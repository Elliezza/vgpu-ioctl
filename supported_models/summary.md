
Docker build:
```
 docker build -t harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:$benchtag -f $benchname.dockerfile .
```

Docker run:
```
 docker run -it --rm --gpus all -v work:/workspace/work harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:$benchtag bash


```
Repo:
```
base: harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:py311-53d98e3
code: https://github.com/Elliezza/vgpu-ioctl/tree/add_models/supported_models

eval: python run.py -d cuda -t eval $benchname
```

| Model              | Image tag                             | Memory Usage      |
|--------------------|---------------------------------------|-------------------|
| BERT_pytorch       | py311-53d98e3-test-BERT_pytorch-yj    | eval - 1440 MiB (2.2766 GB) train - 4984 MiB (5.7375 GB) |
| Background_Matting | py311-53d98e3-Background_Matting      | No eval, train - 71778 MiB (14.6067 GB)   |
| LearningToPaint    | py311-53d98e3-LearningToPaint         | eval - 2434 MiB (2.1907 GB) train - 2416 MiB (2.2668 GB)   |
| Super_SloMo        | py311-53d98e3-Super_SloMo             | eval - 1952 MiB (2.7766 GB) train - 7040 MiB (7.7454 GB)   |
| alexnet            | auto-gen-alexnet                      | eval - 1140 MiB (1.6731 GB) train - 2798 MiB (3.6028 GB)   |
| basic_gnn_edgecnn  | auto-gen-basic_gnn_edgecnn            | eval - 820 MiB (1.6711 GB) train - 1472 MiB (2.3079 GB)   |
| basic_gnn_gcn      | auto-gen-basic_gnn_gcn                |    |
| basic_gnn_gin      | auto-gen-basic_gnn_gin                |    |
| basic_gnn_sage     | auto-gen-basic_gnn_sage               |    |
| cm3leon_generate   | auto-gen-cm3leon_generate             |    |
|        |     |    |
|        |     |    |
|        |     |    |
|        |     |    |
|        |     |    |
