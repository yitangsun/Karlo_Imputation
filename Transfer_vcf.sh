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

plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 1 --recode vcf --out chr1_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 2 --recode vcf --out chr2_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 3 --recode vcf --out chr3_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 4 --recode vcf --out chr4_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 5 --recode vcf --out chr5_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 6 --recode vcf --out chr6_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 7 --recode vcf --out chr7_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 8 --recode vcf --out chr8_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 9 --recode vcf --out chr9_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 10 --recode vcf --out chr10_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 11 --recode vcf --out chr11_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 12 --recode vcf --out chr12_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 13 --recode vcf --out chr13_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 14 --recode vcf --out chr14_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 15 --recode vcf --out chr15_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 16 --recode vcf --out chr16_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 17 --recode vcf --out chr17_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 18 --recode vcf --out chr18_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 19 --recode vcf --out chr19_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 20 --recode vcf --out chr20_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 21 --recode vcf --out chr21_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr 22 --recode vcf --out chr22_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr X --recode vcf --out chr23_Gibbons_Project.StrandAligned.rsID_Updated
plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr Y --recode vcf --out chr24_Gibbons_Project.StrandAligned.rsID_Updated





#chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

#plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr $chr --recode vcf --out chr$chrGibbons_Project.StrandAligned.rsID_Updated


#cd /project/kylab/lab_shared/CFR_UGA_Sociology/genotype/Strand_Alignment

#bcftools sort Gibbons_Project.StrandAligned.rsID_Updated.vcf -Oz -o Gibbons_Project.StrandAligned.rsID_Updated.vcf.gz

#python checkVCF.py -r human_g1k_v37.fasta -o out Gibbons_Project.StrandAligned.rsID_Updated.vcf 

#For example, if the --update-name file is
#SNP_A-1919191   rs123456
#SNP_A-64646464  rs222222
