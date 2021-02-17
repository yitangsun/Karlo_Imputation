sed 's/^##fileformat=VCFv4.3/##fileformat=VCFv4.2/' Gibbons_Project.StrandAligned.rsID_Updated.vcf > out.vcf

awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' out.vcf > Gibbons_Project_tools.vcf

awk '{if($1 != "chrX") print $0}'  Gibbons_Project.StrandAligned.rsID_Updated.vcf  > chr23_with_chr.vcf

awk '{if($1 != "chrY") print $0}'   chr23_with_chr.vcf  > chr_without_chr.vcf

module load HTSlib/1.10.2-GCC-8.3.0
bgzip chr_without_chr.vcf

module load VCFtools/0.1.16-GCC-8.3.0-Perl-5.30.0

vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr1 --recode --out chr1_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr2 --recode --out chr2_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr3 --recode --out chr3_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr4 --recode --out chr4_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr5 --recode --out chr5_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr6 --recode --out chr6_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr7 --recode --out chr7_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr8 --recode --out chr8_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr9 --recode --out chr9_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr10 --recode --out chr10_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr11 --recode --out chr11_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr12 --recode --out chr12_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr13 --recode --out chr13_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr14 --recode --out chr14_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr15 --recode --out chr15_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr16 --recode --out chr16_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr17 --recode --out chr17_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr18 --recode --out chr18_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr19 --recode --out chr19_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr20 --recode --out chr20_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr21 --recode --out chr21_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chr22 --recode --out chr22_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chrX --recode --out chrX_Gibbons_Project.StrandAligned.rsID_Updated
vcftools --vcf Gibbons_Project.StrandAligned.rsID_Updated.vcf --chr chrY --recode --out chrY_Gibbons_Project.StrandAligned.rsID_Updated

#awk '{if($0 !~ /^#/) $1= "chr24"; print $0}'  chrX_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf | tr ' ' '\t'  > chr23_with_chr.vcf

#awk '{if($0 !~ /^#/) $1= "chr24"; print $0}'  chr24_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf | tr ' ' '\t'  > chr24_with_chr.vcf

#awk '{if($1 !~ "chrX"); print $0}'  Gibbons_Project.StrandAligned.rsID_Updated.vcf  > chr23_with_chr.vcf

module load HTSlib/1.10.2-GCC-8.3.0
bgzip chr1_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr2_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr3_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr4_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr5_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr6_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr7_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr8_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr9_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr10_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr11_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr12_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr13_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr14_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr15_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr16_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr17_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr18_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr19_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr20_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr21_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf
bgzip chr22_Gibbons_Project.StrandAligned.rsID_Updated.recode.vcf

