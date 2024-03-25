#!/bin/bash
#SBATCH --job-name=test_gpu
#SBATCH --output=/home/ofourkioti/Projects/dsmil-wsi/train_brca.txt
#SBATCH --error=/home/ofourkioti/Projects/dsmil-wsi/error.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=120:00:00
#SBATCH --gres=gpu:4
#SBATCH --partition=gpuhm

module use /opt/software/easybuild/modules/all/
module load Mamba
source ~/.bashrc
conda activate dl_torch
cd /home/ofourkioti/Projects/dsmil-wsi/simclr

python run.py --dataset simclr_patches --level high --multiscale 0
