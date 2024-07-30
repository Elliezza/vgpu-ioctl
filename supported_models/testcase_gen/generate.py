import json, math, copy

image_base = "harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark"
expect_fail_case = "/scripts/run_PASS_if_return_nonzero.sh"
expect_pass_case = "/scripts/run_PASS_if_return_zero.sh"

percentages = [20, 50, 80, 90, 95, 99, 110]

testcase_template = {
    "owner": "wangsiqi",
    "num_containers": 1,
    "container": [
    {
        "vmem_limit": 0,
        "percentage" : 0,
        "image": " ",
        "script": expect_fail_case,
        "timeout": 120,
        "output": "/results/test_case_yj.log"
    }
    ]
}

def generate_one_case(base_case, vmem, percentage):
    case = copy.deepcopy(base_case)
    case["container"][0]["vmem_limit"] = math.floor(vmem * percentage / 100)
    case["container"][0]["percentage"] = percentage
    if percentage > 100:
        case["container"][0]["script"] = expect_pass_case
    return case

def generate_for_model(image_tag, vmem):
    testcases = []
    case = copy.deepcopy(testcase_template)
    case["container"][0]["image"] = f"{image_base}:{image_tag}" 
    for pct in percentages:
        testcases.append(generate_one_case(case,vmem,pct))
    return testcases

if __name__ == "__main__":
    file_path = "bench_info.txt"
    out_file = "testcases.json"
    with open(file_path, 'r') as file:
        lines = file.readlines()

    testcases = []
    for line in lines:
        line = line.strip()
        parts = line.split(',')

        model_name = parts[0].strip()
        vmem = int(parts[1])
        image_tag = parts[2].strip()

        print(model_name)

        testcases.extend(generate_for_model(image_tag, vmem))


    dataset = {
    "dataset_name": "pytorch_set_1",
    "testcases": testcases
    }


    with open(out_file, 'w') as file:
        json.dump(dataset, file, indent=4)
