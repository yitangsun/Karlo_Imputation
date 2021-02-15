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

chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

plink2 --bfile Gibbons_Project.StrandAligned.rsID_Updated --chr $chr --recode vcf --out chr$chrGibbons_Project.StrandAligned.rsID_Updated


#cd /project/kylab/lab_shared/CFR_UGA_Sociology/genotype/Strand_Alignment

#bcftools sort Gibbons_Project.StrandAligned.rsID_Updated.vcf -Oz -o Gibbons_Project.StrandAligned.rsID_Updated.vcf.gz

#python checkVCF.py -r human_g1k_v37.fasta -o out Gibbons_Project.StrandAligned.rsID_Updated.vcf 

#For example, if the --update-name file is
#SNP_A-1919191   rs123456
#SNP_A-64646464  rs222222
