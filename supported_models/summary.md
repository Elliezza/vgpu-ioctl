
Docker build:
```
 docker build -t harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:$benchtag -f $benchname.dockerfile .
```

Repo:
```
base:  harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:py311-53d98e3
harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark
```

| Model              | Image tag                             | Memory Usage      |
|--------------------|---------------------------------------|-------------------|
| BERT_pytorch       | py311-53d98e3-test-BERT_pytorch-yj    | eval - 1440 MiB (2.2766 GB) train - 4984 MiB (5.7375 GB) |
| Background_Matting | py311-53d98e3-Background_Matting      | No eval, train - 71778 MiB (14.6067 GB)   |
| LearningToPaint    | py311-53d98e3-LearningToPaint         | eval - 2434 MiB (2.1907 GB) train - 2416 MiB (2.2668 GB)   |
|        |     |    |
|        |     |    |
|        |     |    |
|        |     |    |
|        |     |    |
