#!/bin/bash
#SBATCH --job-name=test
#SBATCH --partition=highmem_p
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=ys98038@uga.edu
#SBATCH --ntasks=1                    
#SBATCH --cpus-per-task=1
#SBATCH --mem=250gb
#SBATCH --time=10:00:00   
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err 

cd $SLURM_SUBMIT_DIR

module load PLINK/2.00-alpha2.3-x86_64-20200124

plink2 --bfile Beach_Project_004.KY --chr 1 --recode vcf --out chr1_Batch2
plink2 --bfile Beach_Project_004.KY --chr 2 --recode vcf --out chr2_Batch2
plink2 --bfile Beach_Project_004.KY --chr 3 --recode vcf --out chr3_Batch2
plink2 --bfile Beach_Project_004.KY --chr 4 --recode vcf --out chr4_Batch2
plink2 --bfile Beach_Project_004.KY --chr 5 --recode vcf --out chr5_Batch2
plink2 --bfile Beach_Project_004.KY --chr 6 --recode vcf --out chr6_Batch2
plink2 --bfile Beach_Project_004.KY --chr 7 --recode vcf --out chr7_Batch2
plink2 --bfile Beach_Project_004.KY --chr 8 --recode vcf --out chr8_Batch2
plink2 --bfile Beach_Project_004.KY --chr 9 --recode vcf --out chr9_Batch2
plink2 --bfile Beach_Project_004.KY --chr 10 --recode vcf --out chr10_Batch2
plink2 --bfile Beach_Project_004.KY --chr 11 --recode vcf --out chr11_Batch2
plink2 --bfile Beach_Project_004.KY --chr 12 --recode vcf --out chr12_Batch2
plink2 --bfile Beach_Project_004.KY --chr 13 --recode vcf --out chr13_Batch2
plink2 --bfile Beach_Project_004.KY --chr 14 --recode vcf --out chr14_Batch2
plink2 --bfile Beach_Project_004.KY --chr 15 --recode vcf --out chr15_Batch2
plink2 --bfile Beach_Project_004.KY --chr 16 --recode vcf --out chr16_Batch2
plink2 --bfile Beach_Project_004.KY --chr 17 --recode vcf --out chr17_Batch2
plink2 --bfile Beach_Project_004.KY --chr 18 --recode vcf --out chr18_Batch2
plink2 --bfile Beach_Project_004.KY --chr 19 --recode vcf --out chr19_Batch2
plink2 --bfile Beach_Project_004.KY --chr 20 --recode vcf --out chr20_Batch2
plink2 --bfile Beach_Project_004.KY --chr 21 --recode vcf --out chr21_Batch2
plink2 --bfile Beach_Project_004.KY --chr 22 --recode vcf --out chr22_Batch2
plink2 --bfile Beach_Project_004.KY --chr X --recode vcf --out chr23_Batch2
plink2 --bfile Beach_Project_004.KY --chr Y --recode vcf --out chr24_Batch2

