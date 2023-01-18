# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_phase3.pvar > all_hg37_snps.pvar
# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_hg38.pvar > all_hg38_snps.pvar
# 
# awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}' all_phase3.pvar > all_hg37_snps.pvar
# awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}' all_hg38.pvar > all_hg38_snps.pvar


library(dplyr)
'%ni%' <- Negate('%in%')

all_phase3 <- read.table(paste(Pathway_out,"all_hg37_snps.pvar",sep = ""), header=F, sep="\t")
all_phase3_38 <- read.table(paste(Pathway_out,"all_hg38_snps.pvar",sep = ""), header=F, sep="\t")

all_phase3_chr1=all_phase3[all_phase3$V1=="1",]
all_phase3_38_chr1=all_phase3_38[all_phase3_38$V1=="1",]

all_phase3_chr1$combine=paste(all_phase3_chr1$V1,all_phase3_chr1$V2,
                              all_phase3_chr1$V4,all_phase3_chr1$V5,sep = "__")
all_phase3_38_chr1$combine=paste(all_phase3_38_chr1$V1,all_phase3_38_chr1$V2,
                                 all_phase3_38_chr1$V4,all_phase3_38_chr1$V5,sep = "__")
colnames(all_phase3_chr1)[1] <- "chr"
colnames(all_phase3_38_chr1)[1] <- "chr"

for (Pathway_out in c("/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/",
                      "/scratch/ys98038/genotype20221007/Top_strand/VCF_files/vcf/")) {
  for (batch_name in c("W5_Philibert2_Project_006_chr1.vcf","W8_Philibert_Project_011_chr1.vcf")) {
    Batch <- read.table(paste(Pathway_out,batch_name,sep = ""), header=F, sep="\t")
    Batch<-Batch%>%select(V1,V2,V3,V4,V5)
    
    Batch$combine=paste(Batch$V1,Batch$V2,
                        Batch$V4,Batch$V5,sep = "__")
    
    Comparison <- Batch %>% left_join(all_phase3_chr1, by= "combine")
    
    print(Pathway_out)
    print(batch_name)
    
    print(length(Comparison[is.na(Comparison$chr)==F,]$chr)/length(Comparison$chr)*100)
    print(length(Comparison$chr))
    
  }
}


for (Pathway_out in c("/scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/",
                      "/scratch/ys98038/genotype20221007/Top_strand/VCF_files/vcf/")) {
  for (batch_name in c("W8_A1-H4_chr1.vcf",
                       "W8_A9-H12_chr1.vcf","W8_H5-H8_chr1.vcf")) {
    Batch <- read.table(paste(Pathway_out,batch_name,sep = ""), header=F, sep="\t")
    Batch<-Batch%>%select(V1,V2,V3,V4,V5)
    
    Batch$combine=paste(Batch$V1,Batch$V2,
                        Batch$V4,Batch$V5,sep = "__")
    
    Comparison <- Batch %>% left_join(all_phase3_38_chr1, by= "combine")
    
    print(Pathway_out)
    print(batch_name)
    
    print(length(Comparison[is.na(Comparison$chr)==F,]$chr)/length(Comparison$chr)*100)
    print(length(Comparison$chr))
    
  }
}



head(Comparison,50)


