#!/usr/bin/env bash
set -e

export OPENAI_LOGDIR="log"
mkdir -p $OPENAI_LOGDIR

# Baseline params
MODEL_FLAGS="--image_size 64 --num_channels 128 --num_res_blocks 3"
DIFFUSION_FLAGS="--diffusion_steps 4000 --noise_schedule linear"

model_path=$1

/usr/bin/env python3 scripts/image_sample.py \
        --model_path $model_path \
        --num_samples 32 \
        $MODEL_FLAGS $DIFFUSION_FLAGS
