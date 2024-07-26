
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
| Background_Matting | py311-53d98e3-Background_Matting      | eval - NO IMP, train - 71778 MiB (14.6067 GB)   |
| LearningToPaint    | py311-53d98e3-LearningToPaint         | eval - 2434 MiB (2.1907 GB) train - 2416 MiB (2.2668 GB)   |
| Super_SloMo        | py311-53d98e3-Super_SloMo             | eval - 1952 MiB (2.7766 GB) train - 7040 MiB (7.7454 GB)   |
| alexnet            | auto-gen-alexnet                      | eval - 1140 MiB (1.6731 GB) train - 2798 MiB (3.6028 GB)   |
| basic_gnn_edgecnn  | auto-gen-basic_gnn_edgecnn            | eval - 820 MiB (1.6711 GB) train - 1472 MiB (2.3079 GB)   |
| basic_gnn_gcn      | auto-gen-basic_gnn_gcn                | eval - 648 MiB train - 710 MiB    |
| basic_gnn_gin      | auto-gen-basic_gnn_gin                | eval - 622 MiB train - 630 MiB   |
| basic_gnn_sage     | auto-gen-basic_gnn_sage               | eval - 592 MiB train - 630 MiB   |
| cm3leon_generate   | auto-gen-cm3leon_generate             | eval - 3334 MiB train - NO IMP   |


Autogeneration model results:
image tag = auto-gen-$benchname

| Model  | Memory Usage (eval train) |
|--------|---------------------------|
| dcgan | 752 MiB 728 MiB |
| demucs | 4350 MiB 52454 MiB |
| densenet121 | 1448 MiB 36314 MiB |
| detectron2_fasterrcnn_r_101_c4  | 3348 MiB 5426 MiB |
| detectron2_fasterrcnn_r_101_dc5 | 2576 MiB 5188 MiB |
| detectron2_fasterrcnn_r_101_fpn | 2262 MiB 3752 MiB |
| detectron2_fasterrcnn_r_50_c4   | 3260 MiB 5002 MiB |
| detectron2_fasterrcnn_r_50_dc5  | 2502 MiB 4692 MiB |
| detectron2_fasterrcnn_r_50_fpn  | 2206 MiB 3132 MiB | 
| detectron2_fcos_r_50_fpn | 2200 MiB 554 MiB |
| detectron2_maskrcnn | 2340 MiB 3298 MiB |



