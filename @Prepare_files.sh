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
W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf > \
W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf > \
W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".vcf > \
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


