#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=highmem_p              # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=1               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%A_%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)

ml PLINK/2.00a4-GCC-11.2.0

# cd $SLURM_SUBMIT_DIR

######################### Change to your path of imputation data
cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/

outdir=("/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/APOE4_PRS")

#chr
# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)
chr=(19)
################## Convert to vcf ##################
for i in ${chr[@]}
do
plink2 \
--vcf W8_Top_GDAD2_chr"$i".dose.vcf.gz \
--make-bed \
--snps rs429358, rs7412 \
--out $outdir/W8_Top_GDAD2_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile $outdir/W8_Top_GDAD2_chr"$i" \
--export vcf \
--out $outdir/W8_Top_GDAD2_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--vcf W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz \
--make-bed \
--snps rs429358, rs7412 \
--out $outdir/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile $outdir/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i" \
--export vcf \
--out $outdir/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--vcf Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".dose.vcf.gz \
--make-bed \
--snps rs429358, rs7412 \
--out $outdir/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile $outdir/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i" \
--export vcf \
--out $outdir/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--vcf Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz \
--make-bed \
--snps rs429358, rs7412 \
--out $outdir/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile $outdir/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i" \
--export vcf \
--out $outdir/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i"
done

############# ped
for i in ${chr[@]}
do
plink2 \
--bfile $outdir/W8_Top_GDAD2_chr"$i" \
--export ped \
--out $outdir/W8_Top_GDAD2_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile $outdir/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i" \
--export ped \
--out $outdir/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile $outdir/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i" \
--export ped \
--out $outdir/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"
done

for i in ${chr[@]}
do
plink2 \
--bfile $outdir/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i" \
--export ped \
--out $outdir/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i"
done

################ R
# interact --mem 120gb -c 20
# ml R/4.3.1-foss-2022a
# R
#################################################5e-8
'%ni%' <- Negate('%in%')
library(plyr)
library(dplyr)
library(tidyverse)
library(readr)
library(RNOmni)

#Visual example found here: https://ibb.co/VwHvBLT
setwd("/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/APOE4_PRS")

Pathway="/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/APOE4_PRS/"

name=c("W8_Top_GDAD2", "W5_Philibert2_Project_006_Top_GDAD2_NCBI_37", 
       "Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38", 
       "Beach_Project_004_Top_GDAD2_NCBI_37")

for (batch_nam in name) {
  # vcf_file_tem <- read.table(paste0(batch_nam,"_chr19.vcf"), comment.char = "", skip=6,header=T, sep="")  
  # SNP_file <- vcf_file_tem
  # 
  # tem_SNP_file=sapply(strsplit(colnames(SNP_file),fixed = TRUE, split= "X"),"[",2)
  # 
  # colnames(SNP_file)[10:length(colnames(SNP_file))]=tem_SNP_file[10:length(colnames(SNP_file))]
  # 
  # tem_SNP_file=sapply(strsplit(colnames(SNP_file),fixed = TRUE, split= "X."),"[",2)
  # 
  # colnames(SNP_file)[1]=tem_SNP_file[1]
  
  PED_file <- read.table(paste(Pathway,batch_nam,"_chr19.ped",sep = ""), header=F, sep="\t")
  MAP_file <- read.table(paste(Pathway,batch_nam,"_chr19.map",sep = ""), header=F, sep="\t")
  
  SNP_file <- PED_file
  
  SNP_file$SNP1=paste(SNP_file$V7,SNP_file$V8,sep = "/")
  print(table(SNP_file$SNP1))
  
  colnames(SNP_file)[ncol(SNP_file)]=MAP_file$V2[1]
  
  SNP_file$SNP2=paste(SNP_file$V10,SNP_file$V9,sep = "/")
  print(table(SNP_file$SNP2))
  
  colnames(SNP_file)[ncol(SNP_file)]=MAP_file$V2[2]
  
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "C/C" & SNP_file$rs7412 == "T/T", "E1/E1",NA)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "C/T" & SNP_file$rs7412 == "T/T", "E1/E2",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "C/T" & SNP_file$rs7412 == "C/T", "E1/E3",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "C/T" & SNP_file$rs7412 == "C/T", "E2/E4",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "C/C" & SNP_file$rs7412 == "C/T", "E1/E4",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "T/T" & SNP_file$rs7412 == "T/T", "E2/E2",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "T/T" & SNP_file$rs7412 == "C/T", "E2/E3",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "T/T" & SNP_file$rs7412 == "C/C", "E3/E3",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "C/T" & SNP_file$rs7412 == "C/C", "E3/E4",SNP_file$APOE)
  SNP_file$APOE=ifelse(SNP_file$rs429358 == "C/C" & SNP_file$rs7412 == "C/C", "E4/E4",SNP_file$APOE)
  
  colnames(SNP_file)[2]="IID"
  
  SNP_file<-SNP_file%>%select(IID,rs429358,rs7412,APOE)
  
  write.table(SNP_file, file= paste0(batch_nam,"_APOE_Yitang.csv"), col.names = T, append = F,
              row.names = F, quote = FALSE, sep='\t')
  
}

################ R




####### Table
####### Table
####### Table

'%ni%' <- Negate('%in%')
library(dplyr)

####### Change

library(boot) 
library(table1)

# my.render.cont <- function(x) {
#   with(stats.apply.rounding(stats.default(x), digits=2), c("",
#                                                            "Mean (SD)"=sprintf("%s (&plusmn; %s)", MEAN, SD)))
# }
# my.render.cat <- function(x) {
#   c("", sapply(stats.default(x), function(y) with(y,
#                                                   sprintf("%d (%0.0f %%)", FREQ, PCT))))
# }

my.render.cont <- function(x) {
  with(stats.apply.rounding(stats.default(x), digits=2), c("",
                                                           "Mean (SD)"=sprintf("%s (%s)", MEAN, SD)))
}
my.render.cat <- function(x) {
  c("", sapply(stats.default(x), function(y) with(y,
                                                  sprintf("%d (%0.0f)", FREQ, PCT))))
}

pvalue <- function(x, ...) {
  # Construct vectors of data y, and groups (strata) g
  y <- unlist(x)
  g <- factor(rep(1:length(x), times=sapply(x, length)))
  if (is.numeric(y)) {
    # For numeric variables, perform a standard 2-sample t-test
    p <- t.test(y ~ g)$p.value
  } else {
    # For categorical variables, perform a chi-squared test of independence
    p <- chisq.test(table(y, g))$p.value
  }
  # Format the p-value, using an HTML entity for the less-than sign.
  # The initial empty string places the output on the line below the variable label.
  c("", sub("<", "&lt;", format.pval(p, digits=3, eps=0.001)))
}

# bd_pheno$pop <- 
#   factor(bd_pheno$pop, 
#          levels=c("EUR","AFR","CSA","EAS"),
#          labels=c("European", # Reference
#                   "African", 
#                   "Central/South Asian",
#                   "East Asian"))


setwd("Karlo_Imputation/APOE4_PRS/")

name=c("W8_Top_GDAD2", "W5_Philibert2_Project_006_Top_GDAD2_NCBI_37", 
       "Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38", 
       "Beach_Project_004_Top_GDAD2_NCBI_37")

for (batch_nam in name) {
  bd_pheno <- read.table(paste(batch_nam,"_APOE_Yitang.csv",sep = ""), header=T, sep="\t")
  
  bd_pheno$rs429358 <- 
  factor(bd_pheno$rs429358, levels=c("C/C","C/T","T/T"),
         labels=c("C/C","C/T","T/T"))

  bd_pheno$rs7412 <- 
    factor(bd_pheno$rs7412, levels=c("C/C","C/T","T/T"),
           labels=c("C/C","C/T","T/T"))
  
  bd_pheno$APOE <- 
    factor(bd_pheno$APOE, levels=c("E1/E1","E1/E2","E1/E3","E2/E4","E1/E4",
                                     "E2/E2","E2/E3","E3/E3","E3/E4","E4/E4"),
           labels=c("E1/E1","E1/E2","E1/E3","E2/E4","E1/E4",
                    "E2/E2","E2/E3","E3/E3","E3/E4","E4/E4"))
  label(bd_pheno$rs429358)="rs429358"
  label(bd_pheno$rs7412)="rs7412"
  label(bd_pheno$APOE)="APOE"
  
  # caption  <- "Baseline characteristics of participants with EUR, AFR, SAS, EAS, MID, AMR ancestries  in the UK Biobank."
  caption  <- batch_nam
  # footnote <- "ᵃ Also known as Breslow thickness"
  # footnote <- "*Values are numbers (%) for categorical variables, mean (SD) for continuous variables."
  
  print(table1(~ rs429358  + rs7412 + APOE  , data=bd_pheno,caption=caption,render.continuous=my.render.cont))
  
  # bd_pheno_EUR <- bd_pheno[bd_pheno$pop=="European",]
  # bd_pheno_other <- bd_pheno[bd_pheno$pop!="European",]
}


