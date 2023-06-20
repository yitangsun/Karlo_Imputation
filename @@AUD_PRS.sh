# https://www.pgscatalog.org/score/PGS002739/

wget https://ftp.ebi.ac.uk/pub/databases/spot/pgs/scores/PGS002739/ScoringFiles/Harmonized/PGS002739_hmPOS_GRCh37.txt.gz
wget https://ftp.ebi.ac.uk/pub/databases/spot/pgs/scores/PGS002739/ScoringFiles/Harmonized/PGS002739_hmPOS_GRCh38.txt.gz

# ml R/4.2.1-foss-2020b

library(dplyr)
'%ni%' <- Negate('%in%')

AUD <- read.table(paste('/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/',"PGS002739_hmPOS_GRCh38.txt",sep = ""),header = T,sep = "\t")

AUD$unweighted_beta=1

AUD_SNP<- AUD %>%select(hm_rsID, effect_allele, unweighted_beta)

write.table(AUD_SNP, file= paste('/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/',
                                 "AUD_SNP_unweighted_beta.txt", sep=""), 
            col.names = FALSE, append = TRUE, row.names = F, quote = FALSE, sep='\t')

AUD_SNP<- AUD %>%select(hm_rsID, effect_allele, effect_weight)

write.table(AUD_SNP, file= paste('/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/',
                                 "AUD_SNP_beta.txt", sep=""), 
            col.names = FALSE, append = TRUE, row.names = F, quote = FALSE, sep='\t')

AUD_SNP<- AUD %>%select(hm_rsID)

write.table(AUD_SNP, file= paste('/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/',
                                 "AUD_SNP.txt", sep=""), 
            col.names = FALSE, append = TRUE, row.names = F, quote = FALSE, sep='\t')

#!/bin/bash
#SBATCH --job-name=test         # Job name
#SBATCH --partition=batch               # Partition name (batch, highmem_p, or gpu_p)
#SBATCH --ntasks=1                      # 1 task (process) for below commands
#SBATCH --cpus-per-task=8               # CPU core count per task, by default 1 CPU core per task
#SBATCH --mem=110G                       # Memory per node (4GB); by default using M as unit
#SBATCH --time=6-23:00:00               # Time limit hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=test.%a.out              # Standard output log, e.g., testBowtie2_12345.out
#SBATCH --mail-user=ys98038@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL      # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --array=1-22

i=$SLURM_ARRAY_TASK_ID

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

# cd $SLURM_SUBMIT_DIR

######################### Change to your path of imputation data
cd /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/
  
#chr
# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)
# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22)
################## Convert to vcf ##################
ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

plink2 \
--vcf W8_Top_GDAD2_chr"$i".dose.vcf.gz \
--make-bed \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W8_Top_GDAD2_chr"$i"

module load PLINK/1.9b_6-24-x86_64

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W8_Top_GDAD2_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_unweighted_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W8_Top_GDAD2_chr"$i"_AUD_unweighted

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W8_Top_GDAD2_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W8_Top_GDAD2_chr"$i"_AUD_weighted

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

plink2 \
--vcf W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz \
--make-bed \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"

module load PLINK/1.9b_6-24-x86_64

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_unweighted_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"_AUD_unweighted

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37_chr"$i"_AUD_weighted

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

plink2 \
--vcf Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i".dose.vcf.gz \
--make-bed \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"

module load PLINK/1.9b_6-24-x86_64

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_unweighted_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"_AUD_unweighted

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chr"$i"_AUD_weighted

ml PLINK/2.00-alpha2.3-x86_64-20210920-dev

plink2 \
--vcf Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i".dose.vcf.gz \
--make-bed \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i"

module load PLINK/1.9b_6-24-x86_64

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_unweighted_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i"_AUD_unweighted

plink \
--bfile /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i" \
--extract /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP.txt \
--score /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/AUD_SNP_beta.txt 1 2 3 sum  \
--out /scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/Beach_Project_004_Top_GDAD2_NCBI_37_chr"$i"_AUD_weighted

# ml  R/4.2.1-foss-2020b
# interact --mem 80gb -c 20

'%ni%' <- Negate('%in%')
library(dplyr)

####### Change
Pathway=c("/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/PRS/")
Pathway_out=c("/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/AUD/")

################################### ################################### 
############################# Combine PRS using R #####################
################################### ################################### 

################################### W8_Top_GDAD2
################################### W5_Philibert2_Project_006_Top_GDAD2_NCBI_37
################################### Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38
################################### Beach_Project_004_Top_GDAD2_NCBI_37

for (e in c("unweighted","weighted")) {
  for (x in c("W8_Top_GDAD2","W5_Philibert2_Project_006_Top_GDAD2_NCBI_37",
              "Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38",
              "Beach_Project_004_Top_GDAD2_NCBI_37")) {
    dat=read.table(paste(Pathway,x,"_chr","1","_AUD_",e,".profile", sep=""),header=T,sep = "")
    dat<-dat%>%select(IID, SCORESUM)
    colnames(dat)[2]=c("SCORE_1")
    
    for (chr in (c("2" ,"3", "4" ,"5" ,"6" ,"7", "8" ,"9" ,"10" ,"11", "12", "13", "14", "15", "16" ,"17", "18" ,"19", "20" ,"21", "22", "X" ,"XY"))) {
      Position=try(read.table(paste(Pathway,x,"_chr",chr,"_AUD_",e,".profile", sep=""),header=T,sep = ""), silent=TRUE)
      if (length(colnames(Position))>0) {
        Position<-Position%>%select(IID, SCORESUM)
        colnames(Position)[2]=paste("SCORE_",chr, sep="")
        dat<- dat %>% left_join(Position, by= "IID")
      }
    }
    
    dat_tem=dat[,2:length(colnames(dat))]
    
    dat_tem$Total_PRS <- rowSums(dat_tem, na.rm=TRUE)
    dat_tem$IID <- dat$IID
    
    print(summary(dat_tem$Total_PRS))
    
    dat_tem<-dat_tem%>%select(IID, Total_PRS)
    
    write.table(dat_tem, file= paste(Pathway_out,x,"_AUD_",e,".csv", sep=""), 
                col.names = T, append = F, row.names = F, quote = F, sep='\t')
  }
}
