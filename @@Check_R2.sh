#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --array=1-22

chr=$SLURM_ARRAY_TASK_ID

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212
# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 XY)

for i in ${chr[@]}
do
grep "rs6977660" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs11206244" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs10493147" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs2235544" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs2550298" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs9376165" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs1976324" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs2294512" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs10512065" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs6026565" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs2252696" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

for i in ${chr[@]}
do
grep "rs2523189" \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  >>  \
SNP_R2.vcf
done

