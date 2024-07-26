# Benchmark Summary

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

|No.| Model              | Image tag                             | Memory Usage      |
|---|--------------------|---------------------------------------|-------------------|
| 1 | BERT_pytorch       | py311-53d98e3-test-BERT_pytorch-yj    | eval - 1440 MiB (2.2766 GB) train - 4984 MiB (5.7375 GB) |
| 2 | Background_Matting | py311-53d98e3-Background_Matting      | eval - NO IMP, train - 71778 MiB (14.6067 GB)   |
| 3 | LearningToPaint    | py311-53d98e3-LearningToPaint         | eval - 2434 MiB (2.1907 GB) train - 2416 MiB (2.2668 GB)   |
| 4 | Super_SloMo        | py311-53d98e3-Super_SloMo             | eval - 1952 MiB (2.7766 GB) train - 7040 MiB (7.7454 GB)   |
| 5 | alexnet            | auto-gen-alexnet                      | eval - 1140 MiB (1.6731 GB) train - 2798 MiB (3.6028 GB)   |
| 6 | basic_gnn_edgecnn  | auto-gen-basic_gnn_edgecnn            | eval - 820 MiB (1.6711 GB) train - 1472 MiB (2.3079 GB)   |
| 7 | basic_gnn_gcn      | auto-gen-basic_gnn_gcn                | eval - 648 MiB train - 710 MiB    |
| 8 | basic_gnn_gin      | auto-gen-basic_gnn_gin                | eval - 622 MiB train - 630 MiB   |
| 9 | basic_gnn_sage     | auto-gen-basic_gnn_sage               | eval - 592 MiB train - 630 MiB   |
| 10 | cm3leon_generate   | auto-gen-cm3leon_generate             | eval - 3334 MiB train - NO IMP   |


Autogeneration model results:
image tag = auto-gen-$benchname

|No. | Model                           | Memory Usage (eval train) |
|----|---------------------------------|---------------------------|
| 11 | dcgan                           | 752 MiB 728 MiB |
| 12 | demucs                          | 4350 MiB 52454 MiB |
| 13 | densenet121                     | 1448 MiB 36314 MiB |
| 14 | detectron2_fasterrcnn_r_101_c4  | 3348 MiB 5426 MiB |
| 15 | detectron2_fasterrcnn_r_101_dc5 | 2576 MiB 5188 MiB |
| 16 | detectron2_fasterrcnn_r_101_fpn | 2262 MiB 3752 MiB |
| 17 | detectron2_fasterrcnn_r_50_c4   | 3260 MiB 5002 MiB |
| 18 | detectron2_fasterrcnn_r_50_dc5  | 2502 MiB 4692 MiB |
| 19 | detectron2_fasterrcnn_r_50_fpn  | 2206 MiB 3132 MiB | 
| 20 | detectron2_fcos_r_50_fpn        | 2200 MiB NO IMP   |
| 21 | detectron2_maskrcnn             | 2340 MiB 3298 MiB |
| 22 | detectron2_maskrcnn_r_101_c4    | 3370 MiB 5438 MiB |
| 23 | detectron2_maskrcnn_r_101_fpn   | 2270 MiB 4078 MiB |
| 24 | detectron2_maskrcnn_r_50_c4     | 3208 MiB 4760 MiB |
| 25 | detectron2_maskrcnn_r_50_fpn    | 2216 MiB 3408 MiB |
| 26 | dlrm                            | 2538 MiB 3024 MiB |
| 27 | doctr_det_predictor             | 1162 MiB NO IMP   |
| 28 | doctr_reco_predictor            | 698 MiB NO IMP    |
| 29 | drq                             | 578 MiB 2140 MiB  |
| 30 | fastNLP_Bert                    | 968 MiB 6062 MiB  |
| 31 | functorch_dp_cifar10            | 618 MiB 3888 MiB  |
| 32 | functorch_maml_omniglot         | 534 MiB 5314 MiB  |
| 33 | hf_Albert                       | 606 MiB 7692 MiB  |
| 34 | hf_Bart                         | 1154 MiB 5030 MiB |
| 35 | hf_Bert                         | 1008 MiB 5138 MiB |
| 36 | hf_Bert_large                   | 1646 MiB 10952 MiB |
| 37 | hf_BigBird                      | 1614 MiB 7430 MiB |
| 38 | hf_DistilBert                   | 828 MiB 5724 MiB  |
| 39 | hf_GPT2                         | 1106 MiB 7034 MiB |
| 40 | hf_GPT2_large                   | 3752 MiB 29516 MiB |
| 41 | hf_Longformer                   | 1770 MiB 6840 MiB |
| 42 | hf_Reformer                     | 650 MiB 3524 MiB  |
| 43 | hf_Roberta_base                 | 1976 MiB 13960 MiB |
| 44 | hf_T5                           | 1464 MiB 21018 MiB |
| 45 | hf_T5_base                      | 2334 MiB 53204 MiB |
| 46 | hf_T5_generate                  | 1342 MiB NO IMP   |
| 47 | hf_T5_large                     | 3370 MiB 19474 MiB |
| 48 | hf_Whisper                      | 726 MiB NO IMP    |
| 49 | hf_clip                         | BUILD_ERROR       |
| 50 | hf_distil_whisper               | 1680 MiB NO IMP   |
| 51 | lennard_jones                   | 530 MiB 530 MiB   |
| 52 | llama                           | 2830 MiB NO IMP   |
| 53 | llama_v2_7b_16h                 | HF TOKEN          |
| 54 | llava                           | 27764 MiB NO IMP  |
| 55 | maml                            | 1678 MiB NO IMP   |
| 56 | maml_omniglot                   | 534 MiB 668 MiB   |
| 57 | microbench_unbacked_tolist_sum  | 492 MiB NO IMP    |
| 58 | mnasnet1_0                      | 830 MiB 2956 MiB  |
| 59 | mobilenet_v2                    | 888 MiB 9046 MiB  |
| 60 | mobilenet_v2_quantized_qat      | |
| 61 | mobilenet_v3_large              | |
| 62 | moco                            | |
| 63 | moondream                       | |
| 64 | nanogpt                         | |



