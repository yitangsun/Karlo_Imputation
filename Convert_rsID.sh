#!/bin/bash
#SBATCH --job-name=test
#SBATCH --partition=highmem_p
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=ys98038@uga.edu
#SBATCH --ntasks=1                    
#SBATCH --cpus-per-task=1
#SBATCH --mem=250gb
#SBATCH --time=2-00:00:00   
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err 

cd $SLURM_SUBMIT_DIR

module load R/4.0.0-foss-2019b

R CMD BATCH --no-save Convert_rsID.r
