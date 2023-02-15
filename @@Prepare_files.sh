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
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 XY)

################## Convert to vcf ################## Top
for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Top_GDAD2_NCBI_37 \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_A1-H4_Top_GDAD2_NCBI_38 \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_H5-H8_Top_GDAD2_NCBI_38 \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_A9-H12_Top_GDAD2_NCBI_38 \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_Philibert_Project_011_Top_GDAD2_NCBI_37 \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i"
done

# Change chr*
# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_phase3.pvar > all_hg37_snps.pvar
mkdir backup_vcf
cp *Top* backup_vcf/

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf > VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf > VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".vcf > VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

#### gz files
ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".vcf > \
VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf > \
VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

mkdir gz_files/top/VCF42_prepare_vcf_gz_011823
mv *.gz gz_files/top/VCF42_prepare_vcf_gz_011823

####### Chr X
####### Chr X
####### Chr X
####### Chr X

# rm /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/V*X.*
# rm /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/backup_vcf/V*X.*
# rm /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/VCF42_prepare_vcf_gz_011823/V*X.*

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/

#chr
chr=(X)

################## Convert to vcf ################## Top
for i in ${chr[@]}
do
plink2 \
--bfile W5_Philibert2_Project_006_Top_GDAD2_NCBI_37 \
--chr "$i" \
--set-hh-missing \
--make-bed \
--out VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i" \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_A1-H4_Top_GDAD2_NCBI_38 \
--chr "$i" \
--set-hh-missing \
--make-bed \
--out VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i" \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_H5-H8_Top_GDAD2_NCBI_38 \
--chr "$i" \
--set-hh-missing \
--make-bed \
--out VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i" \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_A9-H12_Top_GDAD2_NCBI_38 \
--chr "$i" \
--set-hh-missing \
--make-bed \
--out VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i" \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile W8_Philibert_Project_011_Top_GDAD2_NCBI_37 \
--chr "$i" \
--set-hh-missing \
--make-bed \
--out VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i" \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i"
done

# Change chr*
# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_phase3.pvar > all_hg37_snps.pvar
mkdir backup_vcf
cp *Top* backup_vcf/

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf > VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf > VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".vcf > VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".test.vcf
done

#### gz files
ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".vcf > \
VCF42_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
VCF42_W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
VCF42_W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".test.vcf > \
VCF42_W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".vcf.gz
done

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf > \
VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

mkdir gz_files/top/VCF42_prepare_vcf_gz_011823
mv *.gz gz_files/top/VCF42_prepare_vcf_gz_011823

####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################

####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################

####################################################  Gibbons_Project.StrandAligned.rsID_Updated ####################################################
####################################################  Gibbons_Project.StrandAligned.rsID_Updated ####################################################

# #
# cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/
# ##### https://www.strand.org.uk/
# # Genotyping chips strand and build files
# ### GDA-8v1-0_D2 37
# wget https://www.strand.org.uk/topStrand/GDA-8v1-0_D2-b37-strand.zip
# ### GDA-8v1-0_D2 37
# wget https://www.strand.org.uk/topStrand/GDA-8v1-0_D2-b38-strand.zip
# ### GDA-8v1-0_A1 37 (old)
# wget https://www.strand.org.uk/topStrand/GDA-8v1-0_A1-b37-strand.zip
# ### GDA-8v1-0_D1 37 (old)
# wget https://www.strand.org.uk/topStrand/GDA-8v1-0_D1-b37-strand.zip
# ### GDA-8v1-0_A1_2004 37 (old)
# wget https://www.strand.org.uk/topStrand/GDA_PGx-8v1-0_20042614_A1-b37-strand.zip
# 
# ml  UnZip/6.0-GCCcore-11.2.0
# unzip GDA-8v1-0_D2-b37-strand.zip 
# unzip GDA-8v1-0_D2-b38-strand.zip
# unzip GDA-8v1-0_A1-b37-strand.zip
# unzip GDA-8v1-0_D1-b37-strand.zip 
# unzip GDA_PGx-8v1-0_20042614_A1-b37-strand.zip
# 
# # wget https://www.well.ox.ac.uk/~wrayner/strand/update_build.sh
# wget https://www.strand.org.uk/update_build.sh
# 
# chmod 777 update_build*
#   
# mkdir Strand

#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

# module load PLINK/1.9b_6-24-x86_64

# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
# /scratch/ys98038/genotype20221007/Top_strand/W5_Philibert2_Project_006_Top/Top_strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b37.strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
# 
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
# /scratch/ys98038/genotype20221007/Top_strand/W8_A1-H4_Top/Top_strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b38.strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_A1-H4_Top_GDAD2_NCBI_38
# 
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
# /scratch/ys98038/genotype20221007/Top_strand/W8_H5-H8_Top/Top_strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b38.strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_H5-H8_Top_GDAD2_NCBI_38
# 
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
# /scratch/ys98038/genotype20221007/Top_strand/W8_A9-H12_Top/Top_strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b38.strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_A9-H12_Top_GDAD2_NCBI_38
# 
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/update_build.sh \
# /scratch/ys98038/genotype20221007/Top_strand/W8_Philibert_Project_011_Top/Top_strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/GDA-8v1-0_D2-b37.strand \
# /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/W8_Philibert_Project_011_Top_GDAD2_NCBI_37

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/Strand_Alignment

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 XY)

################## Convert to vcf ################## Top
for i in ${chr[@]}
do
plink2 \
--bfile Gibbons_Project.StrandAligned.rsID_Updated \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"
done

# Change chr*
# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_phase3.pvar > all_hg37_snps.pvar
mkdir Gibbons_backup_vcf 
cp *Gibbons* Gibbons_backup_vcf/

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".vcf > VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".test.vcf
done

#### gz files
ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".test.vcf > \
VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".vcf.gz
done

# mkdir VCF42_prepare_vcf_gz_011823
mv *.gz ../gz_files/top/VCF42_prepare_vcf_gz_011823

####### Chr X
####### Chr X
####### Chr X
####### Chr X

# rm /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/Strand_Alignment/*X.*
# rm /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/Strand_Alignment/Gibbons_backup_vcf/*X.*
# rm ../gz_files/top/VCF42_prepare_vcf_gz_011823/*Gibbons*X.*

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/Strand_Alignment

#chr
chr=(X)

################## Convert to vcf ################## Top
for i in ${chr[@]}
do
plink2 \
--bfile Gibbons_Project.StrandAligned.rsID_Updated \
--chr "$i" \
--set-hh-missing \
--make-bed \
--out VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i" \
--chr "$i" \
--recode vcf-4.2 \
--out VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"
done

# Change chr*
# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_phase3.pvar > all_hg37_snps.pvar
# mkdir Gibbons_backup_vcf 
cp *Gibbons* Gibbons_backup_vcf/

for i in ${chr[@]}
do
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".vcf > VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".test.vcf
done

#### gz files
ml tabix/0.2.6-GCCcore-8.3.0

for i in ${chr[@]}
do
bgzip  \
-c  \
VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".test.vcf > \
VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".vcf.gz
done

# mkdir VCF42_prepare_vcf_gz_011823
mv *.gz ../gz_files/top/VCF42_prepare_vcf_gz_011823

####################################################  Gibbons_Project.StrandAligned.rsID_Updated ####################################################
####################################################  Gibbons_Project.StrandAligned.rsID_Updated ####################################################

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
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

cd /scratch/ys98038/genotype20221007/
# mkdir Imputation\ results/
# cd Imputation\ results/

mkdir Genotype_20230210
cd Genotype_20230210

mkdir W8_A1-H4_Top_GDAD2_NCBI_38
cd W8_A1-H4_Top_GDAD2_NCBI_38
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825793/05c6f3282eb73502804ca3f074382731288b68375909d01a91235e4d3f91c769 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825797/ffefb0bed86865ca7dbd92b17018c2c1c24027c6f9fc67d32cf4dac575581080 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825799/8a9fef32c0e41eea713ff8a423f04a7a3966f67893f4ad84acfa51abc9207d05 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825800/ebfc25f0731b6ffcf0465e264b0a0083ea3d5b454eedcadd3f85efcb4adea74b | bash

mkdir ../W8_A9-H12_Top_GDAD2_NCBI_38
cd ../W8_A9-H12_Top_GDAD2_NCBI_38
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/830011/70dbad727f0ae146b4f004ee438ea78788b66e1b658799e6bc8e4e8cc46ec6e7 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/830015/134d938670ef2a136bad0684b9f98d4b92597422ad1ed004efdd4b8ea97a00e7 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/830017/53b55ef9106c7df55baa9a7668a26a597081cff5a080d3b167a760006e79b261 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/830018/ffae13ffef8e37840c9c343c709cf6de982e96035a22ee2938283ef6ba797a12 | bash

mkdir ../W8_H5-H8_Top_GDAD2_NCBI_38
cd ../W8_H5-H8_Top_GDAD2_NCBI_38
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825837/d6079147031b4b92d4fa4f8496598755d8e00f42888a4a38c7bab1d36f9d842a | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825841/3114e22026e2a6bf142a627553198f34554925db7718061e8d72ec4873710b63 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825843/e9d351914b284e9200046ebd646859c20a4c4e8e03a1db8b300bc40ace166e85 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825844/7f5534a28617a59bf9817924f9b5b120f714b7c0dcb19e8a71613e48d1d2ed3b | bash

mkdir ../W8_Philibert_Project_011_Top_GDAD2_NCBI_37
cd ../W8_Philibert_Project_011_Top_GDAD2_NCBI_37
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825925/20f3a613301f46c47b1c76dc56147c4a32a29a6910668522ac3ad0c4dc8dbc95 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825929/eb32eb194622a41732a8c45579ab38d6088b79a8697e2e97f9b530f7bdd98300 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825931/293329c3d36fffb5efef32166e70248f027287580d55bda80e04c6917e09e334 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825932/4f046278d7cea5277ff06cdaeb50c84cb848b4c709ea3a9df3ea9e0b48eb0240 | bash

mkdir ../W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
cd ../W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825947/4aa5b4d291793a65399335a4dcd1217c98297a1e0ac2055f889dee41c3ba45b1 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825951/a7c2571442f56b89761eef820da02da4e2337aed4b550e2b47331134610ad2af | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825953/697888b820c430de3f1241b130b9ca01b0544ff361c6adc8a2d93dd9bb2da5b6 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825954/c1ea04c4dffdf27bd0e5431de0bdd2a54dcb925b176ce47ceaedc091ae3c4634 | bash

mkdir ../Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38
cd ../Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825903/273ae4e19934205b149ba2f8dc5d47eb8f94989454c9bdaa6590ee2b9bb36aa3 | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825907/6add81ac0c368e3a8a9fc05d8f2a517d6689689c6e84043dd187c18efebfa14f | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825909/32743392a418fb3b45fab659f8c6f0b199e6ca769370e08600173343dafdf1ed | bash
curl -sL https://imputation.biodatacatalyst.nhlbi.nih.gov/get/825910/5b9203a1cf87b60879ef46c12ca817597908ef2f4b1d702cf3dcfc25081c8ada | bash

ml  UnZip/6.0-GCCcore-11.2.0

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)

cd /scratch/ys98038/genotype20221007/Genotype_20230210/W8_A1-H4_Top_GDAD2_NCBI_38/

for i in ${chr[@]}
do
unzip -P "v5FKx9DQKz3khn" /scratch/ys98038/genotype20221007/Genotype_20230210/W8_A1-H4_Top_GDAD2_NCBI_38/chr_"$i".zip
done

# W8_A1-H4_Top_GDAD2_NCBI_38
# v5FKx9DQKz3khn

cd /scratch/ys98038/genotype20221007/Genotype_20230210/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/

for i in ${chr[@]}
do
unzip -P "dBg3srHZXji2QG"  /scratch/ys98038/genotype20221007/Genotype_20230210/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/chr_"$i".zip
done

# W8_Philibert_Project_011_Top_GDAD2_NCBI_37
# dBg3srHZXji2QG

cd /scratch/ys98038/genotype20221007/Genotype_20230210/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/

for i in ${chr[@]}
do
unzip -P "CY9tfp5iS4wKtP"  /scratch/ys98038/genotype20221007/Genotype_20230210/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/chr_"$i".zip
done

# W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
# CY9tfp5iS4wKtP

cd /scratch/ys98038/genotype20221007/Genotype_20230210/W8_A9-H12_Top_GDAD2_NCBI_38/

for i in ${chr[@]}
do
unzip -P "ufHnPC3r$usV9Y"  /scratch/ys98038/genotype20221007/Genotype_20230210/W8_A9-H12_Top_GDAD2_NCBI_38/chr_"$i".zip
done

# W8_A9-H12_Top_GDAD2_NCBI_38
# ufHnPC3r$usV9Y

cd /scratch/ys98038/genotype20221007/Genotype_20230210/W8_H5-H8_Top_GDAD2_NCBI_38/

for i in ${chr[@]}
do
unzip -P "elaeCDkK0tKV36"  /scratch/ys98038/genotype20221007/Genotype_20230210/W8_H5-H8_Top_GDAD2_NCBI_38/chr_"$i".zip
done

# W8_H5-H8_Top_GDAD2_NCBI_38
# elaeCDkK0tKV36

cd /scratch/ys98038/genotype20221007/Genotype_20230210/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38/

for i in ${chr[@]}
do
unzip -P "a9CnaTtKe6[WDh"  /scratch/ys98038/genotype20221007/Genotype_20230210/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38/chr_"$i".zip
done

# Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38
# a9CnaTtKe6[WDh

cd /scratch/ys98038/genotype20221007/Genotype_20230210/
gunzip */*gz

####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################
####################################################  @@@@@@@@@  Final ! ####################################################

####### Give rsID
# dbSNP build 156 release notes
# Organism name: Homo sapiens
# Taxonomy ID: 9606
# Total RS: 1130597309
# https://ftp.ncbi.nlm.nih.gov/snp/
# https://ftp.ncbi.nlm.nih.gov/snp/archive/b156/VCF/
# /JSON              RefSNP JSON files. Refer to JSON_README.txt for details.
# /VCF               RefSNP VCF files for GRC (Genome Reference Consortium) human assembly
# 37 (GCF_000001405.25) and 38 (GCF_000001405.40). Files are compressed
# by bgzip and with the tabix index.
cd /scratch/ys98038/genotype20221007/Genotype_20230210/

mkdir dbSNP_38_build_156
cd dbSNP_38_build_156

wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz
wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz.md5
wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz.tbi
wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz.tbi.md5

gunzip GCF_000001405.40.gz
wget https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz

# cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/unimputed_W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chrX.vcf.gz
# cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_A1-H4_Top_GDAD2_NCBI_38_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A1-H4_Top_GDAD2_NCBI_38/unimputed_W8_A1-H4_Top_GDAD2_NCBI_38_chrX.vcf.gz
# cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_A9-H12_Top_GDAD2_NCBI_38_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_A9-H12_Top_GDAD2_NCBI_38/unimputed_W8_A9-H12_Top_GDAD2_NCBI_38_chrX.vcf.gz
# cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_H5-H8_Top_GDAD2_NCBI_38_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_H5-H8_Top_GDAD2_NCBI_38/unimputed_W8_H5-H8_Top_GDAD2_NCBI_38_chrX.vcf.gz
# cp /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/gz_files/top/prepare_vcf_gz_011823/W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf.gz /scratch/ys98038/genotype20221007/Genotype_20230119/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf.gz

####################################################  @@@@@@@@@  annotate ! ####################################################
####################################################  @@@@@@@@@  annotate ! ####################################################
####################################################  @@@@@@@@@  annotate ! ####################################################


#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/
  
# awk '{if($0 !~ /^#/) print $1}' GCF_000001405.40|sort|uniq
ml  BCFtools/1.15.1-GCC-10.2.0

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/
bcftools annotate  \
--rename-chrs /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/chr_name_conv.txt  \
--threads 20  \
-o /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/GRCh38.dbSNP156.vcf.gz -Oz  \
/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/GCF_000001405.40.gz

gunzip /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/GRCh38.dbSNP156.vcf.gz

ml tabix/0.2.6-GCCcore-8.3.0

bgzip  \
-c  \
/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/GRCh38.dbSNP156.vcf > \
/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/GRCh38.dbSNP156.vcf.gz


#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/

ml tabix/0.2.6-GCCcore-8.3.0

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_A1-H4_Top_GDAD2_NCBI_38/
#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
chr"$i".dose.vcf > \
chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_H5-H8_Top_GDAD2_NCBI_38/
#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
chr"$i".dose.vcf > \
chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_A9-H12_Top_GDAD2_NCBI_38/
#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
chr"$i".dose.vcf > \
chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/
#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
chr"$i".dose.vcf > \
chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/
#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
chr"$i".dose.vcf > \
chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38/
#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
chr"$i".dose.vcf > \
chr"$i".dose.vcf.gz
done


# zcat chr1.dose.vcf.gz | bgzip -c > Test.new.chr1.dose.vcf.gz && tabix Test.new.chr1.dose.vcf.gz

#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/

ml  BCFtools/1.15.1-GCC-10.2.0

#chr
# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)
# chr=(1)

ml tabix/0.2.6-GCCcore-8.3.0

zcat GRCh38.dbSNP156.vcf.gz | bgzip -c > New.GRCh38.dbSNP156.vcf.gz && tabix New.GRCh38.dbSNP156.vcf.gz

# zcat chr1.dose.vcf.gz | bgzip -c > Test.new.chr1.dose.vcf.gz && tabix Test.new.chr1.dose.vcf.gz

#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

ml tabix/0.2.6-GCCcore-8.3.0

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_A1-H4_Top_GDAD2_NCBI_38/
#### gz files
for i in ${chr[@]}
do
zcat  \
chr"$i".dose.vcf.gz | bgzip \
-c > New.chr"$i".dose.vcf.gz && \
tabix New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_H5-H8_Top_GDAD2_NCBI_38/
#### gz files
for i in ${chr[@]}
do
zcat  \
chr"$i".dose.vcf.gz | bgzip \
-c > New.chr"$i".dose.vcf.gz && \
tabix New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_A9-H12_Top_GDAD2_NCBI_38/
#### gz files
for i in ${chr[@]}
do
zcat  \
chr"$i".dose.vcf.gz | bgzip \
-c > New.chr"$i".dose.vcf.gz && \
tabix New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/
#### gz files
for i in ${chr[@]}
do
zcat  \
chr"$i".dose.vcf.gz | bgzip \
-c > New.chr"$i".dose.vcf.gz && \
tabix New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/
#### gz files
for i in ${chr[@]}
do
zcat  \
chr"$i".dose.vcf.gz | bgzip \
-c > New.chr"$i".dose.vcf.gz && \
tabix New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38/
#### gz files
for i in ${chr[@]}
do
zcat  \
chr"$i".dose.vcf.gz | bgzip \
-c > New.chr"$i".dose.vcf.gz && \
tabix New.chr"$i".dose.vcf.gz
done


#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/

mkdir VCF_results_0212

ml  BCFtools/1.15.1-GCC-10.2.0

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)
# chr=(1)

ml tabix/0.2.6-GCCcore-8.3.0

# zcat Test.chr1.dose.vcf.gz | bgzip -c > Test.new.chr1.dose.vcf.gz && tabix Test.new.chr1.dose.vcf.gz

# bcftools index Test.chr1.dose.vcf.gz

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_A1-H4_Top_GDAD2_NCBI_38/

for i in ${chr[@]}
do
bcftools annotate  \
-c CHROM,POS,ID  \
-a /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/New.GRCh38.dbSNP156.vcf.gz   \
-o /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".dose.vcf  \
New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_H5-H8_Top_GDAD2_NCBI_38/

for i in ${chr[@]}
do
bcftools annotate  \
-c CHROM,POS,ID  \
-a /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/New.GRCh38.dbSNP156.vcf.gz   \
-o /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".dose.vcf  \
New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_A9-H12_Top_GDAD2_NCBI_38/

for i in ${chr[@]}
do
bcftools annotate  \
-c CHROM,POS,ID  \
-a /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/New.GRCh38.dbSNP156.vcf.gz   \
-o /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".dose.vcf  \
New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/

for i in ${chr[@]}
do
bcftools annotate  \
-c CHROM,POS,ID  \
-a /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/New.GRCh38.dbSNP156.vcf.gz   \
-o /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  \
New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/

for i in ${chr[@]}
do
bcftools annotate  \
-c CHROM,POS,ID  \
-a /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/New.GRCh38.dbSNP156.vcf.gz   \
-o /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf  \
New.chr"$i".dose.vcf.gz
done

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38/

for i in ${chr[@]}
do
bcftools annotate  \
-c CHROM,POS,ID  \
-a /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/dbSNP_38_build_156/New.GRCh38.dbSNP156.vcf.gz   \
-o /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".dose.vcf  \
New.chr"$i".dose.vcf.gz
done

# bcftools --help rename-chrs
# bcftools --help merge

####################################################  @@@@@@@@@  annotate ! ####################################################
####################################################  @@@@@@@@@  annotate ! ####################################################
####################################################  @@@@@@@@@  annotate ! ####################################################

####################################################  @@@@@@@@@  gzipped ! ####################################################
####################################################  @@@@@@@@@  gzipped ! ####################################################
####################################################  @@@@@@@@@  gzipped ! ####################################################

#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

ml tabix/0.2.6-GCCcore-8.3.0

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/
#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/
#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".dose.vcf > \
W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz && \
tabix W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz
done

#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".dose.vcf > \
W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz && \
tabix W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz
done

#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".dose.vcf > \
W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz && \
tabix W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz
done

#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".dose.vcf > \
W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz && \
tabix W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz
done

#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf > \
W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz && \
tabix W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz
done

#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".dose.vcf > \
Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".dose.vcf.gz && \
tabix Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".dose.vcf.gz
done

####################################################  @@@@@@@@@  gzipped ! ####################################################
####################################################  @@@@@@@@@  gzipped ! ####################################################
####################################################  @@@@@@@@@  gzipped ! ####################################################

####################################################  @@@@@@@@@  merge ! ####################################################
####################################################  @@@@@@@@@  merge ! ####################################################
####################################################  @@@@@@@@@  merge ! ####################################################

#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/

mkdir VCF_results_0212

ml  BCFtools/1.15.1-GCC-10.2.0

#chr
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)
# chr=(1)

ml tabix/0.2.6-GCCcore-8.3.0

# zcat Test.chr1.dose.vcf.gz | bgzip -c > Test.new.chr1.dose.vcf.gz && tabix Test.new.chr1.dose.vcf.gz

# bcftools index Test.chr1.dose.vcf.gz

for i in ${chr[@]}
do
bcftools merge  \
/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz  \
/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_A1-H4_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz  \
/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_H5-H8_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz  \
/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_A9-H12_Top_GDAD2_NCBI_38_chr"$i".dose.vcf.gz  \
> /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/W8_Top_GDAD2_chr"$i".dose.vcf
done


#### gz files
for i in ${chr[@]}
do
bgzip  \
-c  \
W8_A1-W8_Top_GDAD2_chr"$i".dose.vcf > \
W8_A1-W8_Top_GDAD2_chr"$i".dose.vcf.gz && \
tabix W8_A1-W8_Top_GDAD2_chr"$i".dose.vcf.gz
done

####################################################  @@@@@@@@@  merge ! ####################################################
####################################################  @@@@@@@@@  merge ! ####################################################
####################################################  @@@@@@@@@  merge ! ####################################################

####################################################  @@@@@@@@@  Extract SNPs  ! ####################################################
####################################################  @@@@@@@@@  Extract SNPs  ! ####################################################
####################################################  @@@@@@@@@  Extract SNPs  ! ####################################################
#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=20               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=220G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR
cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/

#chr
# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)
chr=(19)
################## Convert to vcf ##################
ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

plink2 \
--vcf W8_Top_GDAD2_chr"$i".dose.vcf.gz \
--make-bed \
--snps rs429358, rs7412 \
--out W8_Top_GDAD2_chr"$i"

module load PLINK/1.9b_6-24-x86_64

plink \
--bfile W8_Top_GDAD2_chr"$i" \
--recode ped \
--out W8_Top_GDAD2_chr"$i"

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

plink2 \
--vcf W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz \
--make-bed \
--snps rs429358, rs7412 \
--out W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"

module load PLINK/1.9b_6-24-x86_64

plink \
--bfile W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i" \
--recode ped \
--out W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

plink2 \
--vcf Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".dose.vcf.gz \
--make-bed \
--snps rs429358, rs7412 \
--out Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"

module load PLINK/1.9b_6-24-x86_64

plink \
--bfile Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i" \
--recode ped \
--out Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"

####################################################  @@@@@@@@@  Extract SNPs  ! ####################################################
####################################################  @@@@@@@@@  Extract SNPs  ! ####################################################
####################################################  @@@@@@@@@  Extract SNPs  ! ####################################################
