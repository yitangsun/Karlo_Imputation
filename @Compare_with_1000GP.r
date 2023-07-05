#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_bfile_%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --array=1-22

i=$SLURM_ARRAY_TASK_ID

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/
  
# pop=("AFR" "EAS" "EUR" "CSA")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

plink \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/Original_bfiles/ukb_chr"$i" \
--extract /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/ukb_chr_no_dup_info.bim \
--make-bed \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/ukb_chr"$i"


#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_Merge_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)


ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/
  
pop=("AFR" "EAS" "EUR" "CSA")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
plink \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/ukb_chr1 \
--merge-list /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/bfile_merge_list.txt \
--keep /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Data/PUFA_04_21_"$p"_ID_QC_bd_pheno.txt \
--make-bed \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_04_21_"$p"_QC
done


###############  --make-grm

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=gpu_30d_p               # Partition name (batch, highmem_p, hugemem_p, gpu_30d_p, highmem_30d_p, or gpu_p)
#SBATCH --gres=gpu:1                  # Requests one GPU device 
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=32               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=119G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=29-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_Merge_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/

# pop=("AFR" "EAS" "CSA" "EUR")
pop=("EUR")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_04_21_"$p"_QC \
--make-grm \
--thread-num 32 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/no_dup_info_ukb_geno_grm_04_21_"$p"_QC
done

######## make-grm-part m i
###############  --make-grm

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, hugemem_p, gpu_30d_p, highmem_30d_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=32               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=119G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_part_Merge_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --array=1-100

i=$SLURM_ARRAY_TASK_ID

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/
  
pop=("AFR" "EAS" "CSA" "EUR")
# pop=("EUR")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_04_21_"$p"_QC \
--make-grm-part 100 "$i" \
--thread-num 32 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/grm_part/no_dup_info_ukb_geno_grm_07_01_"$p"_QC
done

############# 1000 Genomes Project
############# 1000 Genomes Project
############# 1000 Genomes Project
# https://www.cog-genomics.org/plink/2.0/resources#phase3_1kg

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/
mkdir 1000GP
cd 1000GP

wget https://www.dropbox.com/s/y6ytfoybz48dc0u/all_phase3.pgen.zst?dl=1
wget https://www.dropbox.com/s/odlexvo8fummcvt/all_phase3.pvar.zst?dl=1
wget https://www.dropbox.com/s/6ppo144ikdzery5/phase3_corrected.psam?dl=1
wget https://www.dropbox.com/s/j72j6uciq5zuzii/all_hg38.pgen.zst?dl=1
wget https://www.dropbox.com/s/vx09262b4k1kszy/all_hg38.pvar.zst?dl=1
wget https://www.dropbox.com/s/2e87z6nc4qexjjm/hg38_corrected.psam?dl=1

mv all_hg38.pgen.zst?dl=1 all_hg38.pgen.zst
mv all_hg38.pvar.zst?dl=1 all_hg38.pvar.zst
mv all_phase3.pgen.zst?dl=1 all_phase3.pgen.zst
mv all_phase3.pvar.zst?dl=1 all_phase3.pvar.zst
mv hg38_corrected.psam?dl=1 hg38_corrected.psam
mv phase3_corrected.psam?dl=1 phase3_corrected.psam

mv phase3_corrected.psam all_phase3.psam
mv hg38_corrected.psam all_hg38.psam

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev
# ml PLINK/2.00-alpha4.3-x86_64-AVX2-AMD-20230610-final

plink2 --zst-decompress all_hg38.pgen.zst > all_hg38.pgen
plink2 --zst-decompress all_hg38.pvar.zst > all_hg38.pvar
plink2 --zst-decompress all_phase3.pgen.zst > all_phase3.pgen
plink2 --zst-decompress all_phase3.pvar.zst > all_phase3.pvar

awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_phase3.pvar > all_hg37_snps.pvar
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_hg38.pvar > all_hg38_snps.pvar

awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}' all_phase3.pvar > all_hg37_snps.pvar
awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}' all_hg38.pvar > all_hg38_snps.pvar

awk '{print $3}' all_hg37_snps.pvar > all_hg37_snps.txt
vim all_hg37_snps.txt

#!/bin/bash
#SBATCH --job-name=LD_1000         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, hugemem_p, gpu_30d_p, highmem_30d_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=32               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=119G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=LD_1000_Merge_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev
# ml PLINK/2.00-alpha4.3-x86_64-AVX2-AMD-20230610-final
# ml PLINK/1.9b_6-24-x86_64

pop=("AFR" "EAS" "CSA" "EUR")

for p in ${pop[@]} 
do
plink2 \
--pfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/1000GP/all_phase3 \
--indep-pairwise 1000 100 0.9 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/1000GP/LD_pruned_1000GP_all_phase3
done


#!/bin/bash
#SBATCH --job-name=LD         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, hugemem_p, gpu_30d_p, highmem_30d_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=32               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=119G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=LD_part_Merge_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

pop=("AFR" "EAS" "CSA" "EUR")

for p in ${pop[@]} 
do
plink \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_04_21_"$p"_QC \
--indep-pairwise 1000 100 0.9 \
--extract /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/1000GP/all_hg37_snps.txt \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/1000GP/LD_pruned_1000GP_"$p"_hg37
done

#!/bin/bash
#SBATCH --job-name=LD         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, hugemem_p, gpu_30d_p, highmem_30d_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=32               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=119G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=LD_part_Merge_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

pop=("AFR" "EAS" "CSA" "EUR")

for p in ${pop[@]} 
do
plink \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_04_21_"$p"_QC \
####### change
--extract /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/1000GP/LD_pruned_1000GP_"$p"_hg37 \
--make-bed \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_LD_pruned_1000GP_07_02_"$p"_QC
done


######## make-grm-part m i
###############  --make-grm

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, hugemem_p, gpu_30d_p, highmem_30d_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=32               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=119G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_part_Merge_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --array=1-100

i=$SLURM_ARRAY_TASK_ID

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/
  
pop=("AFR" "EAS" "CSA" "EUR")
# pop=("EUR")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_LD_pruned_1000GP_07_02_"$p"_QC \
--make-grm-part 100 "$i" \
--thread-num 32 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/grm_part/LD_pruned/no_dup_info_ukb_geno_grm_07_01_"$p"_QC
done


###############  --make-bK-sparse 0.05

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_Merge_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/
  
pop=("AFR" "EAS" "EUR" "CSA")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--grm /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/no_dup_info_ukb_geno_grm_04_21_"$p"_QC \
--make-bK-sparse 0.05 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/no_dup_info_ukb_sp_grm_04_21_"$p"_QC
done


###############  --fastGWA-mlm

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=2                    # Run a single task	
#SBATCH --cpus-per-task=16             # Number of CPU cores per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_fastGWAmlm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/
  
pop=("AFR" "EAS" "EUR" "CSA")

# phenotypes=("PUFA" "Omega_3" "Omega_6" "DHA" "LA" 
#             "PUFA_pct" "Omega_3_pct" "Omega_6_pct" "DHA_pct" "LA_pct" 
#             "MUFA" "SFA" "Total_FA" "MUFA_pct" "SFA_pct" 
#             "PUFA_by_MUFA" "Omega_6_by_Omega_3" "Unsaturation" "Omega_3_by_Omega_6" 
#             "PUFA_by_SFA" "MUFA_by_PUFA" "SFA_by_PUFA" 
#             "Other_Omega_3" "Other_Omega_6" "Other_Omega_3_pct" "Other_Omega_6_pct" 
#             "DHA_by_Omega_3" "LA_by_Omega_6" "DHA_by_PUFA" "LA_by_PUFA")

phenotypes=("PUFA")
            
# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

phenodir=("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Data/phen")
covardir=("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Data/covar")
outdir=("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Results_04_21")

for p in ${pop[@]} 
do
mkdir -p "$outdir"/"$p"

for j in ${phenotypes[@]}
do

/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/Merge/no_dup_info_ukb_chr_04_21_"$p"_QC \
--grm-sparse /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/no_dup_info_ukb_sp_grm_04_21_"$p"_QC \
--fastGWA-mlm \
--pheno $phenodir/PUFA_04_21_"$p"_ID_QC_bd_pheno_original_"$j".phen \
--covar $covardir/PUFA_04_21_"$p"_ID_QC_bd_pheno.covar \
--qcovar $covardir/PUFA_04_21_"$p"_ID_QC_bd_pheno.qcovar \
--thread-num 32 \
--out $outdir/"$p"/"$j"fastGWA
done



######## each bfile
######## each bfile
######## each bfile

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_bfile_%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --array=1-22

i=$SLURM_ARRAY_TASK_ID

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/
  
pop=("AFR" "EAS" "EUR" "CSA")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
plink \
--bfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/ukb_chr"$i" \
--keep /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Data/PUFA_04_21_"$p"_ID_QC_bd_pheno.txt \
--make-bed \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/no_dup_info_ukb_chr"$i"_04_21_"$p"_QC
done

###############  --make-grm

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, hugemem_p, or gpu_p)
#SBATCH --nodes=4                     # Number of nodes
#SBATCH --ntasks-per-node=32           # How many tasks on each node
#SBATCH --mem=400G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/
  
  # pop=("AFR" "EAS" "EUR" "CSA")
pop=("EUR")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--mbfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/mbfile_bfile_list_"$p".txt \
--make-grm \
--thread-num 128 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/mbfile/no_dup_info_ukb_geno_grm_04_21_"$p"_QC_128
done


######### 30 day
#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_30d_p               # Partition name (batch, highmem_p, hugemem_p, highmem_30d_p, or gpu_p)
#SBATCH --nodes=2                     # Number of nodes
#SBATCH --ntasks-per-node=32           # How many tasks on each node
#SBATCH --mem=400G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=29-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_chr_make_grm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/
  
  # pop=("AFR" "EAS" "EUR" "CSA")
  pop=("EUR")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--mbfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/mbfile_bfile_list_"$p".txt \
--make-grm \
--thread-num 64 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/mbfile/no_dup_info_ukb_geno_grm_04_21_"$p"_QC_30
done


###############  --make-bK-sparse 0.05

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_chr_bK_sparse_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/
  
pop=("AFR" "EAS" "EUR" "CSA")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

for p in ${pop[@]} 
do
/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--grm /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/mbfile/no_dup_info_ukb_geno_grm_04_21_"$p"_QC \
--make-bK-sparse 0.05 \
--out /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/mbfile/no_dup_info_ukb_sp_grm_04_21_"$p"_QC
done


###############  --fastGWA-mlm

#!/bin/bash
#SBATCH --job-name=Test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=2                    # Run a single task	
#SBATCH --cpus-per-task=16             # Number of CPU cores per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=TEST_chr_fastGWAmlm_%A.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/1.9b_6-24-x86_64

cd /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/genotype/
  
pop=("AFR" "EAS" "EUR" "CSA")

# phenotypes=("PUFA" "Omega_3" "Omega_6" "DHA" "LA" 
#             "PUFA_pct" "Omega_3_pct" "Omega_6_pct" "DHA_pct" "LA_pct" 
#             "MUFA" "SFA" "Total_FA" "MUFA_pct" "SFA_pct" 
#             "PUFA_by_MUFA" "Omega_6_by_Omega_3" "Unsaturation" "Omega_3_by_Omega_6" 
#             "PUFA_by_SFA" "MUFA_by_PUFA" "SFA_by_PUFA" 
#             "Other_Omega_3" "Other_Omega_6" "Other_Omega_3_pct" "Other_Omega_6_pct" 
#             "DHA_by_Omega_3" "LA_by_Omega_6" "DHA_by_PUFA" "LA_by_PUFA")

phenotypes=("PUFA")

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 --bfile test --make-grm --out geno_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  \
# --bfile /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test \
# --grm-sparse /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/sp_grm \
# --fastGWA-mlm \
# --pheno /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/test.phen \
# --out geno_assoc

# plink --bfile /scratch/tpm84680/workDir/plink/plink1.9_format/ukb_chr"$i" \

####### #SBATCH --array=1-22
######## i=$SLURM_ARRAY_TASK_ID

# /home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1  --grm geno_grm --make-bK-sparse 0.05 --out sp_grm

phenodir=("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Data/phen")
covardir=("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Data/covar")
outdir=("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/Results_04_21/mbfile")

for p in ${pop[@]} 
do
mkdir -p "$outdir"/"$p"

for j in ${phenotypes[@]}
do

/home/ys98038/GCTA/gcta-1.94.1-linux-kernel-3-x86_64/gcta-1.94.1 \
--mbfile /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/plink1.9_format/mbfile_bfile_list_"$p".txt \
--grm-sparse /scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/UKBiobank/fastGWA/GRM/mbfile/no_dup_info_ukb_sp_grm_04_21_"$p"_QC \
--fastGWA-mlm \
--pheno $phenodir/PUFA_04_21_"$p"_ID_QC_bd_pheno_original_"$j".phen \
--covar $covardir/PUFA_04_21_"$p"_ID_QC_bd_pheno.covar \
--qcovar $covardir/PUFA_04_21_"$p"_ID_QC_bd_pheno.qcovar \
--thread-num 32 \
--out $outdir/"$p"/"$j"fastGWA
done

