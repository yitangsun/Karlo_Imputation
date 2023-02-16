# interact --mem 80gb -c 20
# ml R/4.2.1-foss-2020b
# R
library(dplyr)

Pathway="/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/"

Batch=c("Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38",
        "W5_Philibert2_Project_006_Top_GDAD2_NCBI_37",
        "W8_Top_GDAD2")

for (var_num in seq(1:length(Batch))) {
  PED_file <- read.table(paste(Pathway,Batch[var_num],"_chr19.ped",sep = ""), header=F, sep=" ")
  MAP_file <- read.table(paste(Pathway,Batch[var_num],"_chr19.map",sep = ""), header=F, sep="\t")
  
  SNP_file <- PED_file
  
  SNP_file$SNP1=paste(SNP_file$V7,SNP_file$V8,sep = ",")
  colnames(SNP_file)[ncol(SNP_file)]=MAP_file$V2[1]
  
  SNP_file$SNP2=paste(SNP_file$V9,SNP_file$V10,sep = ",")
  colnames(SNP_file)[ncol(SNP_file)]=MAP_file$V2[2]
  
  colnames(SNP_file)[2]="ID"
  SNP_file<-SNP_file%>%select(ID,rs429358,rs7412)
  
  write.table(x=SNP_file, file = paste(Pathway,Batch[var_num],"_chr19.csv",sep = ""), sep = "\t",
              quote = FALSE,row.names = FALSE, col.names = TRUE, append = FALSE)
}

