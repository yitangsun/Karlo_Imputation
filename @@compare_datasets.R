# interact --mem 80gb -c 20
# ml R/4.2.1-foss-2020b
# R
library(dplyr)
library("stringr")

Pathway="/scratch/ys98038/genotype20221007/Copy_Genotype_20230210/VCF_results_0212/"

# Batch=c("Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38",
#         "W5_Philibert2_Project_006_Top_GDAD2_NCBI_37",
#         "W8_Top_GDAD2",
#         "Beach_Project_004_Top_GDAD2_NCBI_37")
Batch=c("W5_Philibert2_Project_006_Top_GDAD2_NCBI_37")

for (var_num in seq(1:length(Batch))) {
  ############### Change
  PED_file <- read.table(paste(Pathway,Batch[var_num],"_chr",7,".ped",sep = ""), header=F, sep=" ")
  MAP_file <- read.table(paste(Pathway,Batch[var_num],"_chr",7,".map",sep = ""), header=F, sep="\t")
  colnames(PED_file)[2]="ID"
  SNP_file_final = PED_file%>%select(ID)
  ############### Change
  
  for (chr_num in c(7,1,4,16,6,3,9,20,8)) {
    PED_file <- read.table(paste(Pathway,Batch[var_num],"_chr",chr_num,".ped",sep = ""), header=F, sep=" ")
    MAP_file <- read.table(paste(Pathway,Batch[var_num],"_chr",chr_num,".map",sep = ""), header=F, sep="\t")
    
    colnames(PED_file)[2]="ID"
    
    SNP_file = PED_file%>%select(ID)
    
    for (snp_num in seq.int(1:length(MAP_file$V2))) {
      SNP_file_tem=paste(PED_file[,2*snp_num+5],PED_file[,2*snp_num+6],sep = ",")
      SNP_file=cbind(SNP_file,SNP_file_tem)
      colnames(SNP_file)[snp_num+1]=MAP_file$V2[snp_num]
    }
    
    SNP_file_final = SNP_file_final %>% left_join(SNP_file, by= "ID")
    
  }
  
  write.table(x=SNP_file_final, file = paste(Pathway,Batch[var_num],"_SNPs.csv",sep = ""), sep = "\t",
              quote = FALSE,row.names = FALSE, col.names = TRUE, append = FALSE)
}

############ Combine
for (var_num in seq(1:length(Batch))) {
  SNP_file_Karlo <- read.table(paste(Pathway,Batch[var_num],
                                     "_SNPs_Karlo.csv",sep = ""), header=T, sep="\t")
  
  SNP_file_final <- read.table(paste(Pathway,Batch[var_num],
                                     "_SNPs.csv",sep = ""), header=T, sep="\t")
  
  SNP_file_Karlo_reverse_SNP <- SNP_file_Karlo
  
  for (col_num in seq.int(1:(length(colnames(SNP_file_Karlo_reverse_SNP))-1))) {
    SNP_file_Karlo_reverse_SNP[,1+col_num]=
      paste(sapply(strsplit(SNP_file_Karlo_reverse_SNP[,1+col_num],fixed = TRUE, split= ","),"[",2),
            sapply(strsplit(SNP_file_Karlo_reverse_SNP[,1+col_num],fixed = TRUE, split= ","),"[",1),sep=",")
  }
  
  SNP_file_final$ID=sapply(strsplit(SNP_file_final$ID,fixed = TRUE, split= "_"),"[",2)
  
  SNP_file_final = SNP_file_final%>%select(colnames(SNP_file_Karlo))
  
  colnames(SNP_file_final)=paste0(colnames(SNP_file_final),"_Imputation")
  colnames(SNP_file_final)[1]="ID"
  
  SNP_file_Compapre = SNP_file_Karlo %>% left_join(SNP_file_final, by= "ID")
  
  for (col_num in seq.int(1:(length(colnames(SNP_file_Karlo))-1))) {
    SNP_file_Compapre[,2*(length(colnames(SNP_file_Karlo))-1)+1+col_num]=
      ifelse(SNP_file_Compapre[,length(colnames(SNP_file_Karlo))-1+1+col_num]==SNP_file_Compapre[,1+col_num] |
               SNP_file_Compapre[,length(colnames(SNP_file_Karlo))-1+1+col_num]==SNP_file_Karlo_reverse_SNP[,1+col_num]   ,
             NA, paste(SNP_file_Compapre[,1+col_num], " (",SNP_file_Compapre[,length(colnames(SNP_file_Karlo))-1+1+col_num],")",sep=""))
    
    colnames(SNP_file_Compapre)[2*(length(colnames(SNP_file_Karlo))-1)+1+col_num]=paste0(colnames(SNP_file_Compapre)[1+col_num],"_Comparison")
  }
  
  write.table(x=SNP_file_Compapre, file = paste(Pathway,Batch[var_num],"_Compapre_SNPs.csv",sep = ""), sep = "\t",
              na = "",quote = FALSE,row.names = FALSE, col.names = TRUE, append = FALSE)
  
}
  
