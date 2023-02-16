# interact --mem 80gb -c 20
# ml R/4.2.1-foss-2020b
# R
# cd /scratch/ys98038/genotype20221007/Imputation\ results/dbSNP_38_build_155/
#   
# cd /scratch/ys98038/genotype20221007/Genotype_20230119/W8_Philibert_Project_011_Top_GDAD2_NCBI_37
# awk '{if($0 !~ /^#/) print "23"$0; else print $0}' head_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf > head_20_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf
# awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' all_hg38.pvar > all_hg38_snps.pvar

cd /scratch/ys98038/genotype20221007/PLINK_GenomeStudio/VCF_files/final_gz_files/Strand/
  
scp Test_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf /scratch/ys98038/genotype20221007/Genotype_20230119/W8_Philibert_Project_011_Top_GDAD2_NCBI_37/head_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf
cd /scratch/ys98038/genotype20221007/Genotype_20230119/W8_Philibert_Project_011_Top_GDAD2_NCBI_37

head -n 20 W8_Philibert_Project_011_Top_GDAD2_NCBI_37 > W8_Philibert_Project_011_Top_GDAD2_NCBI_37
awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12}' head_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf >  head_20_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf

# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)
chr=(X)

ml tabix/0.2.6-GCCcore-8.3.0
for i in ${chr[@]}
do
bgzip  \
-c  \
head_20_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf > \
head_20_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

# chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)
chr=(X)

ml tabix/0.2.6-GCCcore-8.3.0
for i in ${chr[@]}
do
bgzip  \
-c  \
head_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf > \
TEST_head_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf.gz
done

num_col=(10 11 12 13 14 15 16 17 18 19 20 21 22)
for i in ${num_col[@]}
do
awk '{print $"$i"}' head_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
done
awk '{print $19}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $7}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $8}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $9}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $10}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $11}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $12}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $13}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $14}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $15}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $16}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $17}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $18}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $19}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $20}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $21}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $22}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $23}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $24}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq
awk '{print $25}' VCF42_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chrX.vcf|sort|uniq



awk '{print $7}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $8}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $9}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $10}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $11}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $12}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $13}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $14}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $15}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $16}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $17}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $18}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $19}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $20}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $21}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $22}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $23}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $24}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq
awk '{print $25}' VCF42_Gibbons_Project.StrandAligned.rsID_Updated_NCBI_38_chrX.vcf|sort|uniq

awk '{if($0 !~ /^#/) print $1}' GCF_000001405.40|sort|uniq

ml VCFtools/0.1.16-GCC-8.3.0-Perl-5.30.0

vcftools --vcf head_20_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i".vcf \
--chr X \
--from-bp 2699520 \
--to-bp 154931043 \
--recode \
--out test_20_23_unimputed_W8_Philibert_Project_011_Top_GDAD2_NCBI_37_chr"$i"

# awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}' GCF_000001405.39.gz > SNP_hg38_155.vcf.gz
# awk '$1!~/#/{print $1}' GCF_000001405.39 |uniq

awk '$1!~/#/{print $1"\t"$2"\t"$3"}' GCF_000001405.39 > GCF_000001405.39.txt
cp GCF_000001405.39.txt GCF_000001405.39.backup.txt
awk '{print $1}' GCF_000001405.39.txt |uniq > changeName.txt
for i in `cat changeName.txt`
do
echo "sed -i 's/${i}/chr1/g' GCF_000001405.39.txt" >> run.sh
done



library(dplyr)
'%ni%' <- Negate('%in%')

Pathway_out = c("/scratch/ys98038/genotype20221007/Imputation\ results/dbSNP_38_build_155/")
Pathway_out1 = c("/scratch/ys98038/genotype20221007/Imputation\ results/W5_Philibert2_Project_006_Top_GDAD2_NCBI_37/")

SNP_38_155 <- read.table(paste(Pathway_out,"GCF_000001405.39.gz",sep = ""), header=F, sep="\t")

test <- read.table(paste(Pathway_out1,"chr18.dose.vcf",sep = ""), header=F, sep="\t")

