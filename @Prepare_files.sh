#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

module load PLINK/1.9b_6-24-x86_64

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_A1-H4/
  
################## Convert to bfiles ##################
plink \
--file PLINK_GenomeStudio \
--make-bed \
--out PLINK_GenomeStudio

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_A9-H12/
  
################## Convert to bfiles ##################
plink \
--file PLINK_GenomeStudio \
--make-bed \
--out PLINK_GenomeStudio

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_H5-H8/
  
################## Convert to bfiles ##################
plink \
--file PLINK_GenomeStudio \
--make-bed \
--out PLINK_GenomeStudio

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_Philibert_Project_011/
  
################## Convert to bfiles ##################
plink \
--file PLINK_GenomeStudio \
--make-bed \
--out PLINK_GenomeStudio

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W5_Philibert2_Project_006/
  
################## Convert to bfiles ##################
plink \
--file PLINK_GenomeStudio \
--make-bed \
--out PLINK_GenomeStudio

#
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/
##### https://www.strand.org.uk/
# Genotyping chips strand and build files
### GDA-8v1-0_D2 37
wget https://www.strand.org.uk/topStrand/GDA-8v1-0_D2-b37-strand.zip
### GDA-8v1-0_D2 37
wget https://www.strand.org.uk/topStrand/GDA-8v1-0_D2-b38-strand.zip
### GDA-8v1-0_A1 37 (old)
wget https://www.strand.org.uk/topStrand/GDA-8v1-0_A1-b37-strand.zip
### GDA-8v1-0_D1 37 (old)
wget https://www.strand.org.uk/topStrand/GDA-8v1-0_D1-b37-strand.zip
### GDA-8v1-0_A1_2004 37 (old)
wget https://www.strand.org.uk/topStrand/GDA_PGx-8v1-0_20042614_A1-b37-strand.zip

ml  UnZip/6.0-GCCcore-11.2.0
unzip GDA-8v1-0_D2-b37-strand.zip 
unzip GDA-8v1-0_D2-b38-strand.zip
unzip GDA-8v1-0_A1-b37-strand.zip
unzip GDA-8v1-0_D1-b37-strand.zip 
unzip GDA_PGx-8v1-0_20042614_A1-b37-strand.zip

# wget https://www.well.ox.ac.uk/~wrayner/strand/update_build.sh
wget https://www.strand.org.uk/update_build.sh

chmod 777 update_build*
  
mkdir Strand

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

module load PLINK/1.9b_6-24-x86_64

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W5_Philibert2_Project_006/PLINK_GenomeStudio \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_A1-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Forward_A1

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W5_Philibert2_Project_006/PLINK_GenomeStudio \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D1-b37.strand\
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Forward_D1

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W5_Philibert2_Project_006/PLINK_GenomeStudio \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Forward_D2

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W5_Philibert2_Project_006/PLINK_GenomeStudio \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA_PGx-8v1-0_20042614_A1-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Forward_A1_2004

####### Top
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_A1-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Top_A1

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D1-b37.strand\
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Top_D1

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Top_D2

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA_PGx-8v1-0_20042614_A1-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Top_A1_2004

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/
  
#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Forward_A1 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Forward_A1_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Forward_D1 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Forward_D1_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Forward_D2 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Forward_D2_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Forward_A1_2004 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Forward_A1_2004_chr"$i"
done

#### gz files
ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Forward_A1_chr"$i".vcf > \
W5_Philibert2_Project_006_Forward_A1_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Forward_D1_chr"$i".vcf > \
W5_Philibert2_Project_006_Forward_D1_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Forward_D2_chr"$i".vcf > \
W5_Philibert2_Project_006_Forward_D2_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Forward_A1_2004_chr"$i".vcf > \
W5_Philibert2_Project_006_Forward_A1_2004_chr"$i".vcf.gz
done

################## Convert to vcf ################## Top
for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Top_A1 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Top_A1_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Top_D1 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Top_D1_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Top_D2 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Top_D2_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Top_A1_2004 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Top_A1_2004_chr"$i"
done

#### gz files
ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Top_A1_chr"$i".vcf > \
W5_Philibert2_Project_006_Top_A1_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Top_D1_chr"$i".vcf > \
W5_Philibert2_Project_006_Top_D1_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Top_D2_chr"$i".vcf > \
W5_Philibert2_Project_006_Top_D2_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Top_A1_2004_chr"$i".vcf > \
W5_Philibert2_Project_006_Top_A1_2004_chr"$i".vcf.gz
done

mkdir gz_files/top/
mv *.gz gz_files/top/
  
mkdir gz_files
mv *.gz gz_files/
  
ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_A1-H4/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile PLINK_GenomeStudio \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/W8_A1-H4_chr"$i"
done

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_A9-H12/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile PLINK_GenomeStudio \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/W8_A9-H12_chr"$i"
done

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_H5-H8/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile PLINK_GenomeStudio \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/W8_H5-H8_chr"$i"
done

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W8_Philibert_Project_011/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile PLINK_GenomeStudio \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/W8_Philibert_Project_011_chr"$i"
done

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/W5_Philibert2_Project_006/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile PLINK_GenomeStudio \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/W5_Philibert2_Project_006_chr"$i"
done

# pip install bgzip

ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_chr"$i".vcf > \
W5_Philibert2_Project_006_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A1-H4_chr"$i".vcf > \
W8_A1-H4_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A9-H12_chr"$i".vcf > \
W8_A9-H12_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_H5-H8_chr"$i".vcf > \
W8_H5-H8_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_Philibert_Project_011_chr"$i".vcf > \
W8_Philibert_Project_011_chr"$i".vcf.gz
done

############ tabix
for i in ${chr[@]}
do
tabix  \
-p vcf \
W5_Philibert2_Project_006_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
tabix  \
-p vcf \
W8_A1-H4_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
tabix  \
-p vcf \
W8_A9-H12_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
tabix  \
-p vcf \
W8_H5-H8_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
tabix  \
-p vcf \
W8_Philibert_Project_011_chr"$i".vcf.gz
done


####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################

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

module load PLINK/1.9b_6-24-x86_64

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W8_A1-H4_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b38.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_A1-H4_Top_GDAD2_NCBI_38

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W8_H5-H8_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b38.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_H5-H8_Top_GDAD2_NCBI_38

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W8_A9-H12_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b38.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_A9-H12_Top_GDAD2_NCBI_38

/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
/scratch/ys98038/genotype20221007/Top_strand/W8_Philibert_Project_011_Top/Top_strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b37.strand \
/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_Philibert_Project_011_Top_GDAD2_NCBI_37

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

################## Convert to vcf ################## Top
for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Top_GDAD2_NCBI_37 \
--chr "$i" \
--recode vcf \
--out W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_A1-H4_Top_GDAD2_NCBI_38 \
--chr "$i" \
--recode vcf \
--out W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_H5-H8_Top_GDAD2_NCBI_38 \
--chr "$i" \
--recode vcf \
--out W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_A9-H12_Top_GDAD2_NCBI_38 \
--chr "$i" \
--recode vcf \
--out W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_Philibert_Project_011_Top_GDAD2_NCBI_37 \
--chr "$i" \
--recode vcf \
--out W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i"
done

# Change chr*
# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_phase3.pvar > all_hg37_snps.pvar
mkdir backup_vcf 
cp *Top* backup_vcf/
  
for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf > W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf > W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".vcf > W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

#### gz files
ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".vcf > \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf > \
W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

mkdir gz_files/top/prepare_vcf_gz_011823
mv *.gz gz_files/top/prepare_vcf_gz_011823

####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################


# https://www.cog-genomics.org/plink/2.0/resources
# 1000 Genomes phase 3, phased and (optionally) annotated 
# (2022-08-04 Byrska-Bishop et al., build 38, 3202 samples, contigs unphased)
wget https://www.dropbox.com/s/j72j6uciq5zuzii/all_hg38.pgen.zst?dl=1
wget https://www.dropbox.com/s/vx09262b4k1kszy/all_hg38.pvar.zst?dl=1
wget https://www.dropbox.com/s/2e87z6nc4qexjjm/hg38_corrected.psam?dl=1

# 1000 Genomes phase 3, phased and (optionally) annotated 
# (2016-05-05 primary release, build 37, 2504 samples)
wget https://www.dropbox.com/s/y6ytfoybz48dc0u/all_phase3.pgen.zst?dl=1
wget https://www.dropbox.com/s/odlexvo8fummcvt/all_phase3.pvar.zst?dl=1
wget https://www.dropbox.com/s/6ppo144ikdzery5/phase3_corrected.psam?dl=1

mv all_hg38.pgen.zst?dl=1 all_hg38.pgen.zst
mv all_hg38.pvar.zst?dl=1 all_hg38.pvar.zst
mv all_phase3.pgen.zst?dl=1 all_phase3.pgen.zst
mv all_phase3.pvar.zst?dl=1 all_phase3.pvar.zst
mv hg38_corrected.psam?dl=1 hg38_corrected.psam
mv phase3_corrected.psam?dl=1 phase3_corrected.psam

plink2 --zst-decompress all_hg38.pgen.zst > all_hg38.pgen
plink2 --zst-decompress all_hg38.pvar.zst > all_hg38.pvar
plink2 --zst-decompress all_phase3.pgen.zst > all_phase3.pgen
plink2 --zst-decompress all_phase3.pvar.zst > all_phase3.pvar

#cd /project/kylab/lab_shared/CFR_UGA_Sociology/genotype/Strand_Alignment

#bcftools sort Gibbons_Project.StrandAligned.rsID_Updated.vcf -Oz -o Gibbons_Project.StrandAligned.rsID_Updated.vcf.gz

#python checkVCF.py -r human_g1k_v37.fasta -o out Gibbons_Project.StrandAligned.rsID_Updated.vcf 

#For example, if the --update-name file is
#SNP_A-1919191   rs123456
#SNP_A-64646464  rs222222

#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

module load PLINK/1.9b_6-24-x86_64

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/Top_strand/W8_A1-H4_Top/
  
################## Convert to bfiles ##################
plink \
--file Top_strand \
--make-bed \
--out Top_strand

cd /scratch/ys98038/genotype20221007/Top_strand/W8_A9-H12_Top/
  
################## Convert to bfiles ##################
plink \
--file Top_strand \
--make-bed \
--out Top_strand

cd /scratch/ys98038/genotype20221007/Top_strand/W8_H5-H8_Top/
  
################## Convert to bfiles ##################
plink \
--file Top_strand \
--make-bed \
--out Top_strand

cd /scratch/ys98038/genotype20221007/Top_strand/W8_Philibert_Project_011_Top/
  
################## Convert to bfiles ##################
plink \
--file Top_strand \
--make-bed \
--out Top_strand

cd /scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/
  
################## Convert to bfiles ##################
plink \
--file Top_strand \
--make-bed \
--out Top_strand

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/Top_strand/W8_A1-H4_Top/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile Top_strand \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/Top_strand/VCF_files/W8_A1-H4_chr"$i"
done

cd /scratch/ys98038/genotype20221007/Top_strand/W8_A9-H12_Top/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile Top_strand \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/Top_strand/VCF_files/W8_A9-H12_chr"$i"
done

cd /scratch/ys98038/genotype20221007/Top_strand/W8_H5-H8_Top/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile Top_strand \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/Top_strand/VCF_files/W8_H5-H8_chr"$i"
done

cd /scratch/ys98038/genotype20221007/Top_strand/W8_Philibert_Project_011_Top/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile Top_strand \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/Top_strand/VCF_files/W8_Philibert_Project_011_chr"$i"
done

cd /scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/
  
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--bfile Top_strand \
--chr "$i" \
--recode vcf \
--out /scratch/ys98038/genotype20221007/Top_strand/VCF_files/W5_Philibert2_Project_006_chr"$i"
done

####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################

# Download.sh

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

cd /scratch/ys98038/genotype20221007/
# mkdir Imputation\ results/
# cd Imputation\ results/
  
mkdir Genotype_20230119
cd Genotype_20230119

mkdir W8_H5-H8_Top_GDAD2_NCBI_38
cd W8_H5-H8_Top_GDAD2_NCBI_38
wget https://imputation.biodatacatalyst.nhlbi.nih.gov/share/results/95c02faa2709617e29be2a4551f842dc333778f6d52cf1c8e6aa8da2152dd70c/qcreport.html
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805168/5cc7ad2b68c7ca7924c880da4cf90d33cded73993b3b0f811eee5fd0ae42c958 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805170/cdb866c88a753945704fb57cdb0869e350d0c04b14c86813369d3317a2482596 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805171/ce4c6ddb5152bf60188779f266a1963f32abc5279d34b4de58e5a907530ddd3f | bash

mkdir ../W8_A9-H12_Top_GDAD2_NCBI_38
cd ../W8_A9-H12_Top_GDAD2_NCBI_38
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805142/d3953ff3c0ae5ae0118a32b11b6ab9004059c08dfd6ea8c66e8072e60913d605 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805146/82a8653ddabe69e0c736e6509b72c1f8beadc8b74c2de7049d7bd114fa40f0f8 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805148/d5617d2c11de1d0d00a0fe7f930ea8b0f2d1a2530a05f28f2247af8119d8e84c | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805149/d60a3718018a5d0142a667c30dd59212ce1173ead72b8a82c7f7464ba00e3112 | bash

mkdir ../W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
cd ../W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/804944/b051329ead837a49b0667a8da3088e2bee3e0cb7d737d3bce29b09a14f5e754e | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/804948/abee66a86cd42f4917076419a8a92bf74a71d8938eb25fa818f2e62d09df6e50 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/804950/b8fd9a5b98933933e89cf90f5f58063cf3401d1c6c8b65dbfe19deb60159f340 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/804951/cc61c93e9701d6606fc86e49de97f8a3c1223072094e2bcd913089513199cbe0 | bash

mkdir ../W8_Philibert_Project_011_Top_GDAD2_NCBI_37
cd ../W8_Philibert_Project_011_Top_GDAD2_NCBI_37
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805010/fe854a2eed5e8dccc60b1588c4bb4e4ace6dd43d15417d0046dbc134eeb4f2b5 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805014/a3e6cc251e1ce94427a47766ba4ffbf7921ccac0065537bac8f9ee23d9dc1467 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805016/5f41d029ae3d157f6f013b5646edb810e333f03b52bc69a4fafe334b5b4cb60a | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805017/17ce5aa385214b5ba15c57957219f3237edadf47814209b47e51a64fd918b3cd | bash

mkdir ../W8_A1-H4_Top_GDAD2_NCBI_38
cd ../W8_A1-H4_Top_GDAD2_NCBI_38
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805032/9f1c38d0004393a47dac621035f926a3f1ed81aecf59985dd333b193efc07d95 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805036/457d29e4fcdf1de23343899a99e2027c9ce9cbe0d7193ef5c1c86a6e3c82a50b | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805038/6e85741859e355884067ca44bc38f23cca1d0b933d0bf4eecd79fff4d7d5453d | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/805039/1ffd915e39c9d175bea6506404aede66a0db2211556eb8a9fbaaf259ddf85f4f | bash



ml  UnZip/6.0-GCCcore-11.2.0

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

cd /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A1-H4_Top_GDAD2_NCBI_38/
  
for i in ${chr[@]}
do
unzip -P UO2sNlf9UydZW8 /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A1-H4_Top_GDAD2_NCBI_38/chr_"$i".zip
done

# W8_A1-H4_Top_GDAD2_NCBI_38
# UO2sNlf9UydZW8

cd /scratch/ys98038/genotype20221007/Genotype_20230119/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/
  
for i in ${chr[@]}
do
unzip -P GWfhCWK1noXc5S  /scratch/ys98038/genotype20221007/Genotype_20230119/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/chr_"$i".zip
done

# W8_Philibert_Project_011_Top_GDAD2_NCBI_37
# GWfhCWK1noXc5S

cd /scratch/ys98038/genotype20221007/Genotype_20230119/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/
  
for i in ${chr[@]}
do
unzip -P "8M6xO(jxcRkGL{"  /scratch/ys98038/genotype20221007/Genotype_20230119/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/chr_"$i".zip
done

# W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
# 8M6xO(jxcRkGL{

cd /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A9-H12_Top_GDAD2_NCBI_38/
  
for i in ${chr[@]}
do
unzip -P "gQWzj-J0Cbp9pA"  /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A9-H12_Top_GDAD2_NCBI_38/chr_"$i".zip
done

# W8_A9-H12_Top_GDAD2_NCBI_38
# gQWzj-J0Cbp9pA

cd /scratch/ys98038/genotype20221007/Genotype_20230119/W8_H5-H8_Top_GDAD2_NCBI_38/
  
for i in ${chr[@]}
do
unzip -P Sey9FKONQip5rx  /scratch/ys98038/genotype20221007/Genotype_20230119/W8_H5-H8_Top_GDAD2_NCBI_38/chr_"$i".zip
done

# W8_H5-H8_Top_GDAD2_NCBI_38
# Sey9FKONQip5rx

cd /scratch/ys98038/genotype20221007/Imputation\ results/
gunzip */*gz

####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################

####### Give rsID
# dbSNP build 155 release notes
# Organism name: Homo sapiens
# Taxonomy ID: 9606
# https://ftp.ncbi.nlm.nih.gov/snp/
# https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/
# /JSON              RefSNP JSON files. Refer to JSON_README.txt for details.
# /VCF               RefSNP VCF files for GRC (Genome Reference Consortium) human assembly
# 37 (GCF_000001405.25) and 38 (GCF_000001405.39). Files are compressed
# by bgzip and with the tabix index.
cd /scratch/ys98038/genotype20221007/Imputation\ results/

mkdir dbSNP_38_build_155
cd dbSNP_38_build_155

wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.39.gz
wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.39.gz.md5
wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.39.gz.tbi
wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.39.gz.tbi.md5

# gunzip GCF_000001405.39.gz

cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/unimputed_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chrX.vcf.gz
cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_A1-H4_Top_GDAD2_NCBI_38_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A1-H4_Top_GDAD2_NCBI_38/unimputed_W8_A1-H4_Top_GDAD2_NCBI_38_chrX.vcf.gz
cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_A9-H12_Top_GDAD2_NCBI_38_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A9-H12_Top_GDAD2_NCBI_38/unimputed_W8_A9-H12_Top_GDAD2_NCBI_38_chrX.vcf.gz
cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_H5-H8_Top_GDAD2_NCBI_38_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_H5-H8_Top_GDAD2_NCBI_38/unimputed_W8_H5-H8_Top_GDAD2_NCBI_38_chrX.vcf.gz
cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf.gz
