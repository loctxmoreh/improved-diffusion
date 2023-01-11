#!/usr/bin/env bash
set -e

export OPENAI_LOGDIR="log"
mkdir -p $OPENAI_LOGDIR

# Reasonable defaults for a baseline
MODEL_FLAGS="--image_size 64 --num_channels 128 --num_res_blocks 3"
DIFFUSION_FLAGS="--diffusion_steps 4000 --noise_schedule linear"
TRAIN_FLAGS="--lr 1e-4 --batch_size 64"

if [[ ! -d "datasets/cifar_train" ]]; then
	pushd datasets/
	/usr/bin/env python3 cifar10.py
	popd
fi

/usr/bin/env DIFFUSION_TRAINING_TEST=1 python3 scripts/image_train.py \
	--data_dir datasets/cifar_train \
	--log_interval 50 \
	--save_interval 1000 \
	$MODEL_FLAGS $DIFFUSION_FLAGS $TRAIN_FLAGS
