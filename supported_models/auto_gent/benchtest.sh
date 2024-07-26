
benchmark=(
"alexnet"
"basic_gnn_edgecnn"
"basic_gnn_gcn"
"basic_gnn_gin"
"basic_gnn_sage"
"cm3leon_generate"
)

echo "benchmark     eval     train" > result.log


for i in "${!benchmark[@]}"
do

echo "Running"
echo ${benchmark[i]}

docker pull harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:auto-gen-${benchmark[i]}

docker run -it --rm --gpus all -v work:/workspace/work harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:auto-gen-${benchmark[i]} python run.py -d cuda -t eval ${benchmark[i]} > eval.log

nvidia-smi --query-accounted-apps=gpu_name,gpu_uuid,pid,time,gpu_util,mem_util,max_memory_usage --format=csv > gpu_usage.log

tail -n 1 gpu_usage.log >> eval.log
gpu_usage_eval=$(tail -n 1 gpu_usage.log | awk -F, '{print $NF}' )

docker run -it --rm --gpus all -v work:/workspace/work harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:auto-gen-${benchmark[i]} python run.py -d cuda -t train ${benchmark[i]} > train.log

nvidia-smi --query-accounted-apps=gpu_name,gpu_uuid,pid,time,gpu_util,mem_util,max_memory_usage --format=csv > gpu_usage.log

tail -n 1 gpu_usage.log >> train.log
gpu_usage_train=$(tail -n 1 gpu_usage.log | awk -F, '{print $NF}' )

echo  ${benchmark[i]} $gpu_usage_eval $gpu_usage_train >> result.log

echo ${benchmark[i]} >> raw.log
cat eval.log >> raw.log
cat train.log >> raw.log

docker image rm harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:auto-gen-${benchmark[i]}

echo ${benchmark[i]}
echo "Done"
done

rm gpu_usage.log eval.log train.log
cat result.log
