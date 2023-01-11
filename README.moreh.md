# Running improved-diffusion on Moreh AI Framework
![](https://badgen.net/badge/Nvidia-A100/passed/green)

## Prepare

### Code
```bash
git clone https://github.com/loctxmoreh/improved-diffusion
cd improved-diffusion
```

### Dataset
This example will use the `cifar10` dataset, which has download script in `./datasets`.

### Environment
On A100 machine, use `a100env.yml` to create a `conda` environment with `torch==1.7.1`:
```bash
conda env create -f a100env.yml
conda activate iddpm
```
And `a100env2.yml` to create an environment with `torch==1.12.1`:
```bash
conda env create -f a100env2.yml
conda activate iddpm2
```

## Run

### Train a baseline iDDPM model
Run the training script `train-baseline.sh` to train a baseline iDDPM model. Checkpoints are saved
in `OPENAI_LOGDIR` (set to `./log` in the script).
```bash
./train-baseline.sh
```
Set the `DIFFUSION_TRAINING_TEST` environment variable to train for only a
limited time. Or else, the training will go on forever.

### Sample from trained iDDPM model
To sample from a iDDPM checkpoint, run the sample script `sample-baseline.sh`.
Checkpoints are saved in `OPENAI_LOGDIR`. It is recommended to sample from the
`ema_0.9999_*.pt` checkpoints.
```bash
./sample-baseline.sh <path-to-checkpoint>

# For example:
./sample-baseline.sh log/ema_0.9999_001000.pt
```
