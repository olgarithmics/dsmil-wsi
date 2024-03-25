#!/bin/bash
#SBATCH --job-name=test_gpu
#SBATCH --output=/home/ofourkioti/Projects/dsmil-wsi/train_brca.txt
#SBATCH --error=/home/ofourkioti/Projects/dsmil-wsi/error.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=00:05:00
#SBATCH --gres=gpu:4
#SBATCH --partition=gpuhm

module use /opt/software/easybuild/modules/all/
module load Mamba
source ~/.bashrc
conda activate dl_torch
cd /home/ofourkioti/Projects/dsmil-wsi/simclr

#python run.py --dataset camelyon --experiment_name phi --feature_path /data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/multi_magnification_project/camelyon_data/tf_feats_256/resnet_feats/h5_files --label_file label_files/camelyon_data.csv --csv_files camelyon_csv_files/splits_0.csv  --epoch 100 --save_dir cam_Saved_model --lambda1 0.00001
python run.py --dataset simclr_patches --level high --multiscale 0
