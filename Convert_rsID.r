
library(TwoSampleMR)
library(dplyr)
library(googlesheets)
library(vcfR)
library(stringr)
library(mr.raps)
'%ni%' <- Negate('%in%')
# ieugwasr::api_status()
# $`API version`
# #3.6.7
# $`Total associations`
# [1] 126335269652
# $`Total complete datasets`
# [1] 34670
# $`Total public datasets`
# [1] 34513
library(MRInstruments)
library(MVMR)
library(SNPlocs.Hsapiens.dbSNP144.GRCh37)
library("SNPlocs.Hsapiens.dbSNP151.GRCh38")


#load("/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/SNPS_37_38.RData")
snps_38 <- SNPlocs.Hsapiens.dbSNP151.GRCh38

Trait <- read.csv("/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/old_Gibbons_Project.StrandAligned.rsID_Updated.bim",header=F, as.is=T,sep = "\t")

chr1_snps_38 <- snpsBySeqname(snps_38, "1")
SNPS_chr1_38=data.frame(chr1_snps_38@elementMetadata@listData$RefSNP_id,1,chr1_snps_38@ranges@pos,paste("1:",chr1_snps_38@ranges@pos,sep=""),paste("chr1:",chr1_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr1_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr2_snps_38 <- snpsBySeqname(snps_38, "2")
SNPS_chr2_38=data.frame(chr2_snps_38@elementMetadata@listData$RefSNP_id,2,chr2_snps_38@ranges@pos,paste("2:",chr2_snps_38@ranges@pos,sep=""),paste("chr2:",chr2_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr2_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr3_snps_38 <- snpsBySeqname(snps_38, "3")
SNPS_chr3_38=data.frame(chr3_snps_38@elementMetadata@listData$RefSNP_id,3,chr3_snps_38@ranges@pos,paste("3:",chr3_snps_38@ranges@pos,sep=""),paste("chr3:",chr3_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr3_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr4_snps_38 <- snpsBySeqname(snps_38, "4")
SNPS_chr4_38=data.frame(chr4_snps_38@elementMetadata@listData$RefSNP_id,4,chr4_snps_38@ranges@pos,paste("4:",chr4_snps_38@ranges@pos,sep=""),paste("chr4:",chr4_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr4_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr5_snps_38 <- snpsBySeqname(snps_38, "5")
SNPS_chr5_38=data.frame(chr5_snps_38@elementMetadata@listData$RefSNP_id,5,chr5_snps_38@ranges@pos,paste("5:",chr5_snps_38@ranges@pos,sep=""),paste("chr5:",chr5_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr5_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr6_snps_38 <- snpsBySeqname(snps_38, "6")
SNPS_chr6_38=data.frame(chr6_snps_38@elementMetadata@listData$RefSNP_id,6,chr6_snps_38@ranges@pos,paste("6:",chr6_snps_38@ranges@pos,sep=""),paste("chr6:",chr6_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr6_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr7_snps_38 <- snpsBySeqname(snps_38, "7")
SNPS_chr7_38=data.frame(chr7_snps_38@elementMetadata@listData$RefSNP_id,7,chr7_snps_38@ranges@pos,paste("7:",chr7_snps_38@ranges@pos,sep=""),paste("chr7:",chr7_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr7_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr8_snps_38 <- snpsBySeqname(snps_38, "8")
SNPS_chr8_38=data.frame(chr8_snps_38@elementMetadata@listData$RefSNP_id,8,chr8_snps_38@ranges@pos,paste("8:",chr8_snps_38@ranges@pos,sep=""),paste("chr8:",chr8_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr8_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr9_snps_38 <- snpsBySeqname(snps_38, "9")
SNPS_chr9_38=data.frame(chr9_snps_38@elementMetadata@listData$RefSNP_id,9,chr9_snps_38@ranges@pos,paste("9:",chr9_snps_38@ranges@pos,sep=""),paste("chr9:",chr9_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr9_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr10_snps_38 <- snpsBySeqname(snps_38, "10")
SNPS_chr10_38=data.frame(chr10_snps_38@elementMetadata@listData$RefSNP_id,10,chr10_snps_38@ranges@pos,paste("10:",chr10_snps_38@ranges@pos,sep=""),paste("chr10:",chr10_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr10_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr11_snps_38 <- snpsBySeqname(snps_38, "11")
SNPS_chr11_38=data.frame(chr11_snps_38@elementMetadata@listData$RefSNP_id,11,chr11_snps_38@ranges@pos,paste("11:",chr11_snps_38@ranges@pos,sep=""),paste("chr11:",chr11_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr11_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr12_snps_38 <- snpsBySeqname(snps_38, "12")
SNPS_chr12_38=data.frame(chr12_snps_38@elementMetadata@listData$RefSNP_id,12,chr12_snps_38@ranges@pos,paste("12:",chr12_snps_38@ranges@pos,sep=""),paste("chr12:",chr12_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr12_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr13_snps_38 <- snpsBySeqname(snps_38, "13")
SNPS_chr13_38=data.frame(chr13_snps_38@elementMetadata@listData$RefSNP_id,13,chr13_snps_38@ranges@pos,paste("13:",chr13_snps_38@ranges@pos,sep=""),paste("chr13:",chr13_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr13_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr14_snps_38 <- snpsBySeqname(snps_38, "14")
SNPS_chr14_38=data.frame(chr14_snps_38@elementMetadata@listData$RefSNP_id,14,chr14_snps_38@ranges@pos,paste("14:",chr14_snps_38@ranges@pos,sep=""),paste("chr14:",chr14_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr14_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr15_snps_38 <- snpsBySeqname(snps_38, "15")
SNPS_chr15_38=data.frame(chr15_snps_38@elementMetadata@listData$RefSNP_id,15,chr15_snps_38@ranges@pos,paste("15:",chr15_snps_38@ranges@pos,sep=""),paste("chr15:",chr15_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr15_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr16_snps_38 <- snpsBySeqname(snps_38, "16")
SNPS_chr16_38=data.frame(chr16_snps_38@elementMetadata@listData$RefSNP_id,16,chr16_snps_38@ranges@pos,paste("16:",chr16_snps_38@ranges@pos,sep=""),paste("chr16:",chr16_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr16_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr17_snps_38 <- snpsBySeqname(snps_38, "17")
SNPS_chr17_38=data.frame(chr17_snps_38@elementMetadata@listData$RefSNP_id,17,chr17_snps_38@ranges@pos,paste("17:",chr17_snps_38@ranges@pos,sep=""),paste("chr17:",chr17_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr17_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr18_snps_38 <- snpsBySeqname(snps_38, "18")
SNPS_chr18_38=data.frame(chr18_snps_38@elementMetadata@listData$RefSNP_id,18,chr18_snps_38@ranges@pos,paste("18:",chr18_snps_38@ranges@pos,sep=""),paste("chr18:",chr18_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr18_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr19_snps_38 <- snpsBySeqname(snps_38, "19")
SNPS_chr19_38=data.frame(chr19_snps_38@elementMetadata@listData$RefSNP_id,19,chr19_snps_38@ranges@pos,paste("19:",chr19_snps_38@ranges@pos,sep=""),paste("chr19:",chr19_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr19_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr20_snps_38 <- snpsBySeqname(snps_38, "20")
SNPS_chr20_38=data.frame(chr20_snps_38@elementMetadata@listData$RefSNP_id,20,chr20_snps_38@ranges@pos,paste("20:",chr20_snps_38@ranges@pos,sep=""),paste("chr20:",chr20_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr20_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr21_snps_38 <- snpsBySeqname(snps_38, "21")
SNPS_chr21_38=data.frame(chr21_snps_38@elementMetadata@listData$RefSNP_id,21,chr21_snps_38@ranges@pos,paste("21:",chr21_snps_38@ranges@pos,sep=""),paste("chr21:",chr21_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr21_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr22_snps_38 <- snpsBySeqname(snps_38, "22")
SNPS_chr22_38=data.frame(chr22_snps_38@elementMetadata@listData$RefSNP_id,22,chr22_snps_38@ranges@pos,paste("22:",chr22_snps_38@ranges@pos,sep=""),paste("chr22:",chr22_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr22_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr23_snps_38 <- snpsBySeqname(snps_38, "X")
SNPS_chr23_38=data.frame(chr23_snps_38@elementMetadata@listData$RefSNP_id,23,chr23_snps_38@ranges@pos,paste("23:",chr23_snps_38@ranges@pos,sep=""),paste("chr23:",chr23_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr23_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")
chr24_snps_38 <- snpsBySeqname(snps_38, "Y")
SNPS_chr24_38=data.frame(chr24_snps_38@elementMetadata@listData$RefSNP_id,24,chr24_snps_38@ranges@pos,paste("24:",chr24_snps_38@ranges@pos,sep=""),paste("chr24:",chr24_snps_38@ranges@pos,sep=""))
colnames(SNPS_chr24_38) <- c("variant_id","chr_38","pos_38","location_38","location_chr_38")

SNPS_38=rbind(SNPS_chr1_38,SNPS_chr2_38,SNPS_chr3_38,SNPS_chr4_38,SNPS_chr5_38,SNPS_chr6_38,SNPS_chr7_38,SNPS_chr8_38,SNPS_chr9_38,SNPS_chr10_38,SNPS_chr11_38,SNPS_chr12_38,SNPS_chr13_38,SNPS_chr14_38,SNPS_chr15_38,SNPS_chr16_38,SNPS_chr17_38,SNPS_chr18_38,SNPS_chr19_38,SNPS_chr20_38,SNPS_chr21_38,SNPS_chr22_38,SNPS_chr23_38,SNPS_chr24_38)

Trait$location_38=paste(Trait$V1,":",Trait$V4, sep="")

Trait <- Trait %>% left_join(SNPS_38, by= "location_38")

len_exp_file=length(Trait$V1)
for (e in 1:len_exp_file) {
  if (Trait$V1[e]<23) {
    if (is.na(Trait$variant_id[e])==TRUE) {
      write.table(paste(Trait$V1,Trait$V4, sep=":"), file= "/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/Missing_SNP.txt", append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep='\t')
    }
    Trait$new_variant_id[e]=ifelse(is.na(Trait$variant_id[e])==TRUE,paste(Trait$V1,":",Trait$V4, sep=""),Trait$variant_id[e])
  } else if (Trait$V1[e]==23) {
    if (is.na(Trait$variant_id[e])==TRUE) {
      write.table(paste(Trait$V1,Trait$V4, sep=":"), file= "/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/Missing_SNP.txt", append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep='\t')
    }
    Trait$new_variant_id[e]=ifelse(is.na(Trait$variant_id[e])==TRUE,paste("X",":",Trait$V4, sep=""),Trait$variant_id[e])
  } else if (Trait$V1[e]==24) {
    if (is.na(Trait$variant_id[e])==TRUE) {
      write.table(paste(Trait$V1,Trait$V4, sep=":"), file= "/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/Missing_SNP.txt", append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep='\t')
    }
    Trait$new_variant_id[e]=ifelse(is.na(Trait$variant_id[e])==TRUE,paste("Y",":",Trait$V4, sep=""),Trait$variant_id[e])
  }
}

Trait<-Trait%>%select(V1, new_variant_id, trait, V3, V4, V5, V6)

write.table(Trait, file= "/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/Gibbons_Project.StrandAligned.rsID_Updated.bim", append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep='\t')

  
