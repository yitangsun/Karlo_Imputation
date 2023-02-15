# Karlo_Imputation

# Batch 1

1. mv Gibbons_Project.StrandAligned.rsID_Updated.bim old_Gibbons_Project.StrandAligned.rsID_Updated.bim
2. Run Convert_rsID.r Convert_rsID.sh
3. mv Gibbons_Project.StrandAligned.rsID_Updated.bim copy_Gibbons_Project.StrandAligned.rsID_Updated.bim 
4. Run Convert_rsID_additional.r
5. Transfer_vcf.sh
6. Download vcf files to local computer
7. 
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr1_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr1_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr2_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr2_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr3_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr3_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr4_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr4_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr5_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr5_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr6_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr6_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr7_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr7_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr8_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr8_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr9_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr9_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr10_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr10_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr11_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr11_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr12_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr12_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr13_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr13_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr14_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr14_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr15_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr15_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr16_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr16_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr17_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr17_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr18_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr18_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr19_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr19_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr20_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr20_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr21_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr21_with_chr.vcf
awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' chr22_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr22_with_chr.vcf
#awk '{if($0 !~ /^#/) print "chr23"; else print $0}' chr23_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr23_with_chr.vcf
#awk '{if($0 !~ /^#/) print "chr24"; else print $0}' chr24_Gibbons_Project.StrandAligned.rsID_Updated.vcf > chr24_with_chr.vcf
awk '{if($0 !~ /^#/) $1= "chr23"; print $0}'  chr23_Gibbons_Project.StrandAligned.rsID_Updated.vcf | tr ' ' '\t'  > chr23_with_chr.vcf
awk '{if($0 !~ /^#/) $1= "chr24"; print $0}'  chr24_Gibbons_Project.StrandAligned.rsID_Updated.vcf | tr ' ' '\t'  > chr24_with_chr.vcf


7. module load HTSlib/1.10.2-GCC-8.3.0
bgzip chr1_with_chr.vcf
bgzip chr2_with_chr.vcf
bgzip chr3_with_chr.vcf
bgzip chr4_with_chr.vcf
bgzip chr5_with_chr.vcf
bgzip chr6_with_chr.vcf
bgzip chr7_with_chr.vcf
bgzip chr8_with_chr.vcf
bgzip chr9_with_chr.vcf
bgzip chr10_with_chr.vcf
bgzip chr11_with_chr.vcf
bgzip chr12_with_chr.vcf
bgzip chr13_with_chr.vcf
bgzip chr14_with_chr.vcf
bgzip chr15_with_chr.vcf
bgzip chr16_with_chr.vcf
bgzip chr17_with_chr.vcf
bgzip chr18_with_chr.vcf
bgzip chr19_with_chr.vcf
bgzip chr20_with_chr.vcf
bgzip chr21_with_chr.vcf
bgzip chr22_with_chr.vcf
bgzip chr23_with_chr.vcf
bgzip chr24_with_chr.vcf

#8. module load tabix/0.2.6-GCCcore-8.3.0
tabix chr1_with_chr.vcf.gz
tabix chr2_with_chr.vcf.gz
tabix chr3_with_chr.vcf.gz
tabix chr4_with_chr.vcf.gz
tabix chr5_with_chr.vcf.gz
tabix chr6_with_chr.vcf.gz
tabix chr7_with_chr.vcf.gz
tabix chr8_with_chr.vcf.gz
tabix chr9_with_chr.vcf.gz
tabix chr10_with_chr.vcf.gz
tabix chr11_with_chr.vcf.gz
tabix chr12_with_chr.vcf.gz
tabix chr13_with_chr.vcf.gz
tabix chr14_with_chr.vcf.gz
tabix chr15_with_chr.vcf.gz
tabix chr16_with_chr.vcf.gz
tabix chr17_with_chr.vcf.gz
tabix chr18_with_chr.vcf.gz
tabix chr19_with_chr.vcf.gz
tabix chr20_with_chr.vcf.gz
tabix chr21_with_chr.vcf.gz
tabix chr22_with_chr.vcf.gz
tabix chr23_with_chr.vcf.gz
tabix chr24_with_chr.vcf.gz

mv chr*_with_chr.vcf.gz.tbi Data/data/

mv chr*_with_chr.vcf.gz Data/

9. Go to https://imputation.biodatacatalyst.nhlbi.nih.gov and submit job in Topmed & Michigan Imputation Server.

# Karlo_Imputation

# Batch 2

1. Run Convert_rsID_Batch2.r Convert_rsID_Batch2.sh
2. Transfer_vcf.sh
#awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' out.vcf > Gibbons_Project_tools.vcf
3. 
module load HTSlib/1.10.2-GCC-8.3.0
bgzip chr1_Batch2.vcf
bgzip chr2_Batch2.vcf
bgzip chr3_Batch2.vcf
bgzip chr4_Batch2.vcf
bgzip chr5_Batch2.vcf
bgzip chr6_Batch2.vcf
bgzip chr7_Batch2.vcf
bgzip chr8_Batch2.vcf
bgzip chr9_Batch2.vcf
bgzip chr10_Batch2.vcf
bgzip chr11_Batch2.vcf
bgzip chr12_Batch2.vcf
bgzip chr13_Batch2.vcf
bgzip chr14_Batch2.vcf
bgzip chr15_Batch2.vcf
bgzip chr16_Batch2.vcf
bgzip chr17_Batch2.vcf
bgzip chr18_Batch2.vcf
bgzip chr19_Batch2.vcf
bgzip chr20_Batch2.vcf
bgzip chr21_Batch2.vcf
bgzip chr22_Batch2.vcf
bgzip chr23_Batch2.vcf
bgzip chr24_Batch2.vcf

mkdir Data
mv chr*.vcf.gz Data/

4. Download vcf.gz files from Data/ to local computer

5. Go to https://imputation.biodatacatalyst.nhlbi.nih.gov and submit job in Topmed & Michigan Imputation Server.

6. Download results & unzip files using 7-zip

# Plink Input Report Parameters

# Use the top strand

# Remove zeroed SNPs from the report.


