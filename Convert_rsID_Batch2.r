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

Trait <- read.csv("//scratch/ys98038/UKB/plink2_format/Imputation/Batch_2/Beach_Project_004.KY.rsID_Updated.bim",header=F, as.is=T,sep = "\t")

snps_37 <- SNPlocs.Hsapiens.dbSNP144.GRCh37

chr1_snps_37 <- snpsBySeqname(snps_37, "1")
SNPS_chr1_37=data.frame(chr1_snps_37@elementMetadata@listData$RefSNP_id,1,chr1_snps_37@ranges@pos,paste("1:",chr1_snps_37@ranges@pos,sep=""),paste("chr1:",chr1_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr1_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr2_snps_37 <- snpsBySeqname(snps_37, "2")
SNPS_chr2_37=data.frame(chr2_snps_37@elementMetadata@listData$RefSNP_id,2,chr2_snps_37@ranges@pos,paste("2:",chr2_snps_37@ranges@pos,sep=""),paste("chr2:",chr2_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr2_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr3_snps_37 <- snpsBySeqname(snps_37, "3")
SNPS_chr3_37=data.frame(chr3_snps_37@elementMetadata@listData$RefSNP_id,3,chr3_snps_37@ranges@pos,paste("3:",chr3_snps_37@ranges@pos,sep=""),paste("chr3:",chr3_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr3_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr4_snps_37 <- snpsBySeqname(snps_37, "4")
SNPS_chr4_37=data.frame(chr4_snps_37@elementMetadata@listData$RefSNP_id,4,chr4_snps_37@ranges@pos,paste("4:",chr4_snps_37@ranges@pos,sep=""),paste("chr4:",chr4_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr4_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr5_snps_37 <- snpsBySeqname(snps_37, "5")
SNPS_chr5_37=data.frame(chr5_snps_37@elementMetadata@listData$RefSNP_id,5,chr5_snps_37@ranges@pos,paste("5:",chr5_snps_37@ranges@pos,sep=""),paste("chr5:",chr5_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr5_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr6_snps_37 <- snpsBySeqname(snps_37, "6")
SNPS_chr6_37=data.frame(chr6_snps_37@elementMetadata@listData$RefSNP_id,6,chr6_snps_37@ranges@pos,paste("6:",chr6_snps_37@ranges@pos,sep=""),paste("chr6:",chr6_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr6_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr7_snps_37 <- snpsBySeqname(snps_37, "7")
SNPS_chr7_37=data.frame(chr7_snps_37@elementMetadata@listData$RefSNP_id,7,chr7_snps_37@ranges@pos,paste("7:",chr7_snps_37@ranges@pos,sep=""),paste("chr7:",chr7_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr7_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr8_snps_37 <- snpsBySeqname(snps_37, "8")
SNPS_chr8_37=data.frame(chr8_snps_37@elementMetadata@listData$RefSNP_id,8,chr8_snps_37@ranges@pos,paste("8:",chr8_snps_37@ranges@pos,sep=""),paste("chr8:",chr8_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr8_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr9_snps_37 <- snpsBySeqname(snps_37, "9")
SNPS_chr9_37=data.frame(chr9_snps_37@elementMetadata@listData$RefSNP_id,9,chr9_snps_37@ranges@pos,paste("9:",chr9_snps_37@ranges@pos,sep=""),paste("chr9:",chr9_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr9_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr10_snps_37 <- snpsBySeqname(snps_37, "10")
SNPS_chr10_37=data.frame(chr10_snps_37@elementMetadata@listData$RefSNP_id,10,chr10_snps_37@ranges@pos,paste("10:",chr10_snps_37@ranges@pos,sep=""),paste("chr10:",chr10_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr10_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr11_snps_37 <- snpsBySeqname(snps_37, "11")
SNPS_chr11_37=data.frame(chr11_snps_37@elementMetadata@listData$RefSNP_id,11,chr11_snps_37@ranges@pos,paste("11:",chr11_snps_37@ranges@pos,sep=""),paste("chr11:",chr11_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr11_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr12_snps_37 <- snpsBySeqname(snps_37, "12")
SNPS_chr12_37=data.frame(chr12_snps_37@elementMetadata@listData$RefSNP_id,12,chr12_snps_37@ranges@pos,paste("12:",chr12_snps_37@ranges@pos,sep=""),paste("chr12:",chr12_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr12_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr13_snps_37 <- snpsBySeqname(snps_37, "13")
SNPS_chr13_37=data.frame(chr13_snps_37@elementMetadata@listData$RefSNP_id,13,chr13_snps_37@ranges@pos,paste("13:",chr13_snps_37@ranges@pos,sep=""),paste("chr13:",chr13_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr13_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr14_snps_37 <- snpsBySeqname(snps_37, "14")
SNPS_chr14_37=data.frame(chr14_snps_37@elementMetadata@listData$RefSNP_id,14,chr14_snps_37@ranges@pos,paste("14:",chr14_snps_37@ranges@pos,sep=""),paste("chr14:",chr14_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr14_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr15_snps_37 <- snpsBySeqname(snps_37, "15")
SNPS_chr15_37=data.frame(chr15_snps_37@elementMetadata@listData$RefSNP_id,15,chr15_snps_37@ranges@pos,paste("15:",chr15_snps_37@ranges@pos,sep=""),paste("chr15:",chr15_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr15_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr16_snps_37 <- snpsBySeqname(snps_37, "16")
SNPS_chr16_37=data.frame(chr16_snps_37@elementMetadata@listData$RefSNP_id,16,chr16_snps_37@ranges@pos,paste("16:",chr16_snps_37@ranges@pos,sep=""),paste("chr16:",chr16_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr16_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr17_snps_37 <- snpsBySeqname(snps_37, "17")
SNPS_chr17_37=data.frame(chr17_snps_37@elementMetadata@listData$RefSNP_id,17,chr17_snps_37@ranges@pos,paste("17:",chr17_snps_37@ranges@pos,sep=""),paste("chr17:",chr17_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr17_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr18_snps_37 <- snpsBySeqname(snps_37, "18")
SNPS_chr18_37=data.frame(chr18_snps_37@elementMetadata@listData$RefSNP_id,18,chr18_snps_37@ranges@pos,paste("18:",chr18_snps_37@ranges@pos,sep=""),paste("chr18:",chr18_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr18_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr19_snps_37 <- snpsBySeqname(snps_37, "19")
SNPS_chr19_37=data.frame(chr19_snps_37@elementMetadata@listData$RefSNP_id,19,chr19_snps_37@ranges@pos,paste("19:",chr19_snps_37@ranges@pos,sep=""),paste("chr19:",chr19_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr19_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr20_snps_37 <- snpsBySeqname(snps_37, "20")
SNPS_chr20_37=data.frame(chr20_snps_37@elementMetadata@listData$RefSNP_id,20,chr20_snps_37@ranges@pos,paste("20:",chr20_snps_37@ranges@pos,sep=""),paste("chr20:",chr20_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr20_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr21_snps_37 <- snpsBySeqname(snps_37, "21")
SNPS_chr21_37=data.frame(chr21_snps_37@elementMetadata@listData$RefSNP_id,21,chr21_snps_37@ranges@pos,paste("21:",chr21_snps_37@ranges@pos,sep=""),paste("chr21:",chr21_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr21_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr22_snps_37 <- snpsBySeqname(snps_37, "22")
SNPS_chr22_37=data.frame(chr22_snps_37@elementMetadata@listData$RefSNP_id,22,chr22_snps_37@ranges@pos,paste("22:",chr22_snps_37@ranges@pos,sep=""),paste("chr22:",chr22_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr22_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr23_snps_37 <- snpsBySeqname(snps_37, "X")
SNPS_chr23_37=data.frame(chr23_snps_37@elementMetadata@listData$RefSNP_id,23,chr23_snps_37@ranges@pos,paste("23:",chr23_snps_37@ranges@pos,sep=""),paste("chr23:",chr23_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr23_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")
chr24_snps_37 <- snpsBySeqname(snps_37, "Y")
SNPS_chr24_37=data.frame(chr24_snps_37@elementMetadata@listData$RefSNP_id,24,chr24_snps_37@ranges@pos,paste("24:",chr24_snps_37@ranges@pos,sep=""),paste("chr24:",chr24_snps_37@ranges@pos,sep=""))
colnames(SNPS_chr24_37) <- c("variant_id","chr_37","pos_37","location_37","location_chr_37")

SNPS_37=rbind(SNPS_chr1_37,SNPS_chr2_37,SNPS_chr3_37,SNPS_chr4_37,SNPS_chr5_37,SNPS_chr6_37,SNPS_chr7_37,SNPS_chr8_37,SNPS_chr9_37,SNPS_chr10_37,SNPS_chr11_37,SNPS_chr12_37,SNPS_chr13_37,SNPS_chr14_37,SNPS_chr15_37,SNPS_chr16_37,SNPS_chr17_37,SNPS_chr18_37,SNPS_chr19_37,SNPS_chr20_37,SNPS_chr21_37,SNPS_chr22_37,SNPS_chr23_37,SNPS_chr24_37)

save(SNPS_37,file = "/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/SNPS_37_include_XY.RData")

SNPS_37=SNPS_37[!duplicated(SNPS_37$location_37),]

Trait$location_37=paste(Trait$V1,":",Trait$V4, sep="")

Trait <- Trait %>% left_join(SNPS_37, by= "location_37")

Trait$XY_chr1=ifelse(Trait$V1==23, "X", Trait$V1 )
Trait$XY_chr=ifelse(Trait$V1==24, "Y", Trait$XY_chr1 )

Trait$new_variant_id=ifelse(is.na(Trait$variant_id)==TRUE, paste(Trait$XY_chr,Trait$V4, sep=":"), Trait$variant_id)

Trait$id.exposure_1=sapply(strsplit(Trait$new_variant_id, split= ":", fixed=TRUE),"[",1)
Trait$id.exposure_2=sapply(strsplit(Trait$new_variant_id, split= ":", fixed=TRUE),"[",2)
Trait$id.exposure_2=as.numeric(Trait$id.exposure_2)

Trait1=Trait[is.na(Trait$id.exposure_2)==F,]

Trait$id.exposure_3=ifelse(is.na(Trait$variant_id)==TRUE, ".",  Trait$variant_id)

Trait<-Trait%>%select(V1, id.exposure_3,  V3, V4, V5, V6)

Trait1<-Trait1%>%select(new_variant_id)

write.table(Trait, file= "/scratch/ys98038/UKB/plink2_format/Imputation/Batch_2/Beach_Project_004.KY.bim", append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep='\t')

write.table(Trait1, file= "/scratch/ys98038/UKB/plink2_format/Imputation/Batch_2/Missing_SNP.txt", append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep='\t')

