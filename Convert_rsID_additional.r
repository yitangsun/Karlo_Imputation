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

Trait <- read.csv("/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/old_Gibbons_Project.StrandAligned.rsID_Updated.bim",header=F, as.is=T,sep = "\t")
colnames(Trait) <- c("chr_38","rsid","pos1_38","location_38","EA","NEA")
Trait$merge_id=paste(Trait$chr_38,Trait$location_38,Trait$EA, sep="-")

Trait2 <- read.csv("/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/copy_Gibbons_Project.StrandAligned.rsID_Updated.bim",header=F, as.is=T,sep = "\t")
Trait2$merge_id=paste(Trait2$V1,Trait2$V4,Trait2$V5, sep="-")

Trait3 <- Trait %>% left_join(Trait2, by= "merge_id")
Trait3=Trait3[!duplicated(Trait3$rsid),]

Trait4 <- Trait[duplicated(Trait$rsid),]
Trait5 <- Trait4 %>% left_join(Trait2, by= "merge_id")
Trait5=Trait5[!duplicated(Trait5$rsid),]
Trait6=rbind(Trait3,Trait5)

Trait7 <- Trait6[order(Trait6$chr_38, Trait6$location_38),]

Trait7<-Trait7%>%select(V1, V2,  V3, V4, V5, V6)

write.table(Trait7, file= "/scratch/ys98038/UKB/plink2_format/Imputation/Strand_Alignment/Gibbons_Project.StrandAligned.rsID_Updated.bim", append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep='\t')


# # [1] "rs889694294" 
# Trait[Trait$rsid=="rs889694294",]
# Trait7[42872,]
# Trait7[42873,]
# # [2] "rs182212697"  
# Trait[Trait$rsid=="rs182212697",]
# Trait7[117804,]
# Trait7[117805,]
# # [3] "rs3891956"         
# Trait[Trait$rsid=="rs3891956",]
# Trait7[122691,]
# Trait7[122692,]
# # [4] "rs35167514,rs202220802,rs764492656,rs34305973,rs771338559,rs35191146,rs72552763,rs755828176"        
# Trait[Trait$rsid=="rs35167514,rs202220802,rs764492656,rs34305973,rs771338559,rs35191146,rs72552763,rs755828176",]
# Trait7[444260,]
# Trait7[444261,]
# # [5] "rs113569197,rs866909435,rs754212517,rs200234072,rs869282864,rs755473306,rs35854239,rs36056065,rs869243170"
# Trait[Trait$rsid=="rs113569197,rs866909435,rs754212517,rs200234072,rs869282864,rs755473306,rs35854239,rs36056065,rs869243170",]
# Trait7[444262,]
# Trait7[444263,]
# # [6] "rs75401962"                                                                                               
# Trait[Trait$rsid=="rs75401962",]
# Trait7[486667,]
# Trait7[486668,]
# # [7] "rs181194321"                                                                                              
# Trait[Trait$rsid=="rs181194321",]
# Trait7[486671]
# Trait7[486672,]
# # [8] "rs61844005"                                                                                               
# Trait[Trait$rsid=="rs61844005",]
# Trait7[615811,]
# Trait7[615812,]
# # [9] "rs76692859"                                                                                               
# Trait[Trait$rsid=="rs76692859",]
# Trait7[615835,]
# Trait7[615836,]
# # [10] "rs2296414"                                                                                                
# Trait[Trait$rsid=="rs2296414",]
# Trait7[615846,]
# Trait7[615847,]
# # [11] "rs200386184"                                                                                              
# Trait[Trait$rsid=="rs200386184",]
# Trait7[615850,]
# Trait7[615851,]
# # [12] "rs606231248"                                                                                              
# Trait[Trait$rsid=="rs606231248",]
# Trait7[615878,]
# Trait7[615879,]
# # [13] "rs71497223"                                                                                               
# Trait[Trait$rsid=="rs71497223",]
# Trait7[615880,]
# Trait7[615881,]
# # [14] "rs964650617"                                                                                              
# Trait[Trait$rsid=="rs964650617",]
# Trait7[615919,]
# Trait7[615920,]
# # [15] "rs782520160"                                                                                              
# Trait[Trait$rsid=="rs782520160",]
# Trait7[624381,]
# Trait7[624382,]
# # [16] "rs4935561"                                                                                                
# Trait[Trait$rsid=="rs4935561",]
# Trait7[625544,]
# Trait7[625545,]
# # [17] "rs2437447"  
# Trait[Trait$rsid=="rs2437447",]
# Trait7[1046881,]
# Trait7[1046882,]

