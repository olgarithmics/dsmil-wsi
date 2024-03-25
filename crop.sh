#!/bin/bash
#SBATCH --job-name=crop
#SBATCH --output=/home/ofourkioti/Projects/dsmil-wsi/comp.out
#SBATCH --error=/home/ofourkioti/Projects/dsmil-wsi/comp.err
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=24

module use /opt/software/easybuild/modules/all/
module load Mamba
source ~/.bashrc
conda activate dl_torch
cd /home/ofourkioti/Projects/dsmil-wsi/

#python run.py --dataset camelyon --experiment_name phi --feature_path /data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/multi_magnification_project/camelyon_data/tf_feats_256/resnet_feats/h5_files --label_file label_files/camelyon_data.csv --csv_files camelyon_csv_files/splits_0.csv  --epoch 100 --save_dir cam_Saved_model --lambda1 0.00001
#python run_simclr.py --simclr_path  lipo_SIMCLR_checkpoints --feature_path /data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/multi_magnification_project/SAR_data/simclr_imgs/h5_files/  --csv_file lipo_csv_files/splits_0.csv --simclr_batch_size 1024
python deepzoom_tiler.py -m 0  -b 20 -v jpg -e 56