## EDNRB:
311:3382351-3462194


grep '^> 1:' mauve_alignment_chr311_All_Lepus | cut -f2 -d' ' | cut -f2 -d':' | awk 'BEGIN{FS="-"}{if($2>=3382351 && $1<=3462194) print $0}'
3434577-3481985 7th --> longer and complete
3434405-3434576 6th
3432081-3433642 4th
3433643-3434404 5th
3431463-3432080 3rd
3431114-3431462 2nd
3322196-3431113 1st --> longer and complete

3434577	3481985	47408
3434405	3434576	171
3432081	3433642	1561
3433643	3434404	761
3431463	3432080	617
3431114	3431462	348
3322196	3431113	108917

# 1st fragment:
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3322196-3431113'
> 1:3322196-3431113 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta
> 2:3324064-3432746 + DMNS18807_06042020_pseudohap2.2_chr_311.fasta
> 3:79672273-79795104 - Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta
> 4:3321881-3430860 + AD04_DOLSEN1_311.consensus.seqA.fa
> 5:3321155-3431030 + Lam_ine_2013_311.consensus.seqA.fa
> 6:3323602-3430910 + LER_VIE_1639_311.consensus.seqA.fa
> 7:3321337-3431212 + LGR_CRE_2553_311.consensus.seqA.fa
> 8:3321164-3431030 + Lib_1_8897_311.consensus.seqA.fa
> 9:3321283-3431030 + Lib_2_Canada_227_311.consensus.seqA.fa
> 10:3321643-3431212 + Lib_4_UAM_83621_311.consensus.seqA.fa
> 11:3321643-3431212 + Lib_5_UAM_117654_311.consensus.seqA.fa
> 12:3321155-3431212 + Lib_6_LTM_MAG_1862_311.consensus.seqA.fa
> 13:3323102-3430997 + Lib_7_LCL_1956_311.consensus.seqA.fa
> 14:3321487-3431212 + Lib_7_LCP_SAF_1905_311.consensus.seqA.fa
> 15:3322879-3431030 + Lib_8_MacKay2_311.consensus.seqA.fa
> 1:3293258-3317632 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta

# 2nd fragment:
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3431114-3431462'
> 1:3431114-3431462 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta
> 2:3432747-3433091 + DMNS18807_06042020_pseudohap2.2_chr_311.fasta
> 3:79671191-79671245 - Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta
> 5:3431031-3431203 + Lam_ine_2013_311.consensus.seqA.fa
> 8:3431031-3431203 + Lib_1_8897_311.consensus.seqA.fa
> 9:3431031-3431146 + Lib_2_Canada_227_311.consensus.seqA.fa
> 15:3431031-3431154 + Lib_8_MacKay2_311.consensus.seqA.fa
> 1:3322196-3431113 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta

# 3rd fragment:
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3431463-3432080'
> 1:3431463-3432080 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta
> 2:3433092-3433709 + DMNS18807_06042020_pseudohap2.2_chr_311.fasta
> 4:3431507-3432141 + AD04_DOLSEN1_311.consensus.seqA.fa
> 5:3431204-3432080 + Lam_ine_2013_311.consensus.seqA.fa
> 7:3431213-3432340 + LGR_CRE_2553_311.consensus.seqA.fa
> 8:3431204-3432080 + Lib_1_8897_311.consensus.seqA.fa
> 9:3431250-3432080 + Lib_2_Canada_227_311.consensus.seqA.fa
> 10:3431213-3432342 + Lib_4_UAM_83621_311.consensus.seqA.fa
> 11:3431213-3432342 + Lib_5_UAM_117654_311.consensus.seqA.fa
> 12:3431213-3432342 + Lib_6_LTM_MAG_1862_311.consensus.seqA.fa
> 13:3431309-3431873 + Lib_7_LCL_1956_311.consensus.seqA.fa
> 14:3431213-3432342 + Lib_7_LCP_SAF_1905_311.consensus.seqA.fa
> 15:3431206-3432080 + Lib_8_MacKay2_311.consensus.seqA.fa

> 1:3431114-3431462 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta

# 4th fragment:
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3432081-3433642'
> 1:3432081-3433642 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta
> 2:3433710-3435262 + DMNS18807_06042020_pseudohap2.2_chr_311.fasta
> 3:79667939-79667976 - Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta
> 5:3432081-3433735 + Lam_ine_2013_311.consensus.seqA.fa
> 6:3432365-3434432 + LER_VIE_1639_311.consensus.seqA.fa
> 7:3432730-3433488 + LGR_CRE_2553_311.consensus.seqA.fa
> 8:3432081-3433735 + Lib_1_8897_311.consensus.seqA.fa
> 9:3432081-3433735 + Lib_2_Canada_227_311.consensus.seqA.fa
> 10:3432343-3433771 + Lib_4_UAM_83621_311.consensus.seqA.fa
> 11:3432343-3433771 + Lib_5_UAM_117654_311.consensus.seqA.fa
> 12:3432343-3433771 + Lib_6_LTM_MAG_1862_311.consensus.seqA.fa
> 13:3432396-3435789 + Lib_7_LCL_1956_311.consensus.seqA.fa
> 14:3432343-3434370 + Lib_7_LCP_SAF_1905_311.consensus.seqA.fa
> 15:3432081-3433735 + Lib_8_MacKay2_311.consensus.seqA.fa
> 1:3433643-3434404 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta

# 5th fragment:
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3433643-3434404'
> 1:3433643-3434404 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta
> 2:3435263-3436036 + DMNS18807_06042020_pseudohap2.2_chr_311.fasta
> 3:79667995-79669217 - Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta
> 4:3433921-3434404 + AD04_DOLSEN1_311.consensus.seqA.fa
> 5:3434035-3434404 + Lam_ine_2013_311.consensus.seqA.fa
> 7:3433921-3434404 + LGR_CRE_2553_311.consensus.seqA.fa
> 8:3434035-3434404 + Lib_1_8897_311.consensus.seqA.fa
> 9:3434035-3434404 + Lib_2_Canada_227_311.consensus.seqA.fa
> 10:3434333-3434404 + Lib_4_UAM_83621_311.consensus.seqA.fa
> 11:3434333-3434404 + Lib_5_UAM_117654_311.consensus.seqA.fa
> 12:3434333-3434404 + Lib_6_LTM_MAG_1862_311.consensus.seqA.fa
> 14:3434375-3434404 + Lib_7_LCP_SAF_1905_311.consensus.seqA.fa
> 15:3434035-3434404 + Lib_8_MacKay2_311.consensus.seqA.fa
> 1:3431463-3432080 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta

# 6th fragment:
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3434405-3434576'
> 1:3434405-3434576 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta
> 2:3436037-3436208 + DMNS18807_06042020_pseudohap2.2_chr_311.fasta
> 3:79667864-79667934 - Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta
> 4:3434405-3434440 + AD04_DOLSEN1_311.consensus.seqA.fa
> 5:3434405-3434576 + Lam_ine_2013_311.consensus.seqA.fa
> 7:3434405-3434576 + LGR_CRE_2553_311.consensus.seqA.fa
> 8:3434405-3434576 + Lib_1_8897_311.consensus.seqA.fa
> 9:3434405-3434576 + Lib_2_Canada_227_311.consensus.seqA.fa
> 10:3434405-3434576 + Lib_4_UAM_83621_311.consensus.seqA.fa
> 11:3434405-3434576 + Lib_5_UAM_117654_311.consensus.seqA.fa
> 12:3434405-3434576 + Lib_6_LTM_MAG_1862_311.consensus.seqA.fa
> 14:3434405-3434576 + Lib_7_LCP_SAF_1905_311.consensus.seqA.fa
> 15:3434405-3434576 + Lib_8_MacKay2_311.consensus.seqA.fa
> 1:3432081-3433642 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta

#7th fragment.
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3434577-3481985'
> 1:3434577-3481985 + DMNS18807_06042020_pseudohap2.1_chr_311.fasta
> 2:3436209-3482259 + DMNS18807_06042020_pseudohap2.2_chr_311.fasta
> 3:79619034-79667766 - Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta
> 4:3435125-3481957 + AD04_DOLSEN1_311.consensus.seqA.fa
> 5:3434577-3482209 + Lam_ine_2013_311.consensus.seqA.fa
> 6:3434880-3482033 + LER_VIE_1639_311.consensus.seqA.fa
> 7:3434577-3482111 + LGR_CRE_2553_311.consensus.seqA.fa
> 8:3434577-3482209 + Lib_1_8897_311.consensus.seqA.fa
> 9:3434577-3481399 + Lib_2_Canada_227_311.consensus.seqA.fa
> 10:3434577-3481956 + Lib_4_UAM_83621_311.consensus.seqA.fa
> 11:3434577-3481793 + Lib_5_UAM_117654_311.consensus.seqA.fa
> 12:3434577-3481910 + Lib_6_LTM_MAG_1862_311.consensus.seqA.fa
> 13:3436320-3482740 + Lib_7_LCL_1956_311.consensus.seqA.fa
> 14:3434577-3482111 + Lib_7_LCP_SAF_1905_311.consensus.seqA.fa
> 15:3434577-3482092 + Lib_8_MacKay2_311.consensus.seqA.fa
> 3:79667770-79667860 - Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta

# grep between the occurrence that we want and the next occurrence of chr 1. the last line will have an = that we
# need to remove later:
# 1 st fragment:
sed -n '/^> 1:3322196-3431113/,/^> 1:3293258-3317632/p;/^> 1:3293258-3317632/q' mauve_alignment_chr311_All_Lepus | head -n-2 > chr_311_1:3322196-3431113.fasta
# 7th fragment:
sed -n '/^> 1:3434577-3481985/,/^> 3:79667770-79667860/p;/^> 3:79667770-79667860/q' mauve_alignment_chr311_All_Lepus | head -n-2 > chr_311_1:3434577-3481985.fasta

# we need to cut the first and 7th fragment 
# 1st fragment:
sed -n '/^> 1:3322196-3431113/,/^> 2:3324064-3432746/p;/^> 2:3324064-3432746/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_pseudohap2.1.fasta
sed -n '/^> 2:3324064-3432746/,/^> 3:79672273-79795104/p;/^> 3:79672273-79795104/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_pseudohap2.2.fasta
sed -n '/^> 3:79672273-79795104/,/^> 4:3321881-3430860/p;/^> 4:3321881-3430860/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_orycun.fasta
sed -n '/^> 4:3321881-3430860/,/^> 5:3321155-3431030/p;/^> 5:3321155-3431030/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:3321155-3431030/,/^> 6:3323602-3430910/p;/^> 6:3323602-3430910/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:3323602-3430910/,/^> 7:3321337-3431212/p;/^> 7:3321337-3431212/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_LER.fasta
sed -n '/^> 7:3321337-3431212/,/^> 8:3321164-3431030 /p;/^> 8:3321164-3431030/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:3321164-3431030/,/^> 9:3321283-3431030/p;/^> 9:3321283-3431030/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lib_1_8897.fasta
sed -n '/^> 9:3321283-3431030/,/^> 10:3321643-3431212/p;/^> 10:3321643-3431212/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:3321643-3431212/,/^> 11:3321643-3431212/p;/^> 11:3321643-3431212/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:3321643-3431212/,/^> 12:3321155-3431212/p;/^> 12:3321155-3431212/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:3321155-3431212/,/^> 13:3323102-3430997/p;/^> 13:3323102-3430997/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:3323102-3430997/,/^> 14:3321487-3431212/p;/^> 14:3321487-3431212/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:3321487-3431212/,/^> 15:3322879-3431030/p;/^> 15:3322879-3431030/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_1st_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:3322879-3431030/,/^> 1:3293258-3317632/p;/^> 1:3293258-3317632/q' mauve_alignment_chr311_All_Lepus | head -n-2 > chr_311_1st_fragment_Lib_8_MacKay2.fasta

# 7th fragment:
sed -n '/^> 1:3434577-3481985/,/^> 2:3436209-3482259/p;/^> 2:3436209-3482259/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_pseudohap2.1.fasta
sed -n '/^> 2:3436209-3482259/,/^> 3:79619034-79667766/p;/^> 3:79619034-79667766/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_pseudohap2.2.fasta
sed -n '/^> 3:79619034-79667766/,/^> 4:3435125-3481957/p;/^> 4:3435125-3481957/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_orycun.fasta
sed -n '/^> 4:3435125-3481957/,/^> 5:3434577-3482209/p;/^> 5:3434577-3482209/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:3434577-3482209/,/^> 6:3434880-3482033/p;/^> 6:3434880-3482033/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:3434880-3482033/,/^> 7:3434577-3482111/p;/^> 7:3434577-3482111/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_LER.fasta
sed -n '/^> 7:3434577-3482111/,/^> 8:3434577-3482209/p;/^> 8:3434577-3482209/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:3434577-3482209/,/^> 9:3434577-3481399/p;/^> 9:3434577-3481399/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lib_1_8897.fasta
sed -n '/^> 9:3434577-3481399/,/^> 10:3434577-3481956/p;/^> 10:3434577-3481956/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:3434577-3481956/,/^> 11:3434577-3481793/p;/^> 11:3434577-3481793/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:3434577-3481793/,/^> 12:3434577-3481910/p;/^> 12:3434577-3481910/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:3434577-3481910/,/^> 13:3436320-3482740/p;/^> 13:3436320-3482740/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:3436320-3482740/,/^> 14:3434577-3482111/p;/^> 14:3434577-3482111/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:3434577-3482111/,/^> 15:3434577-3482092/p;/^> 15:3434577-3482092/q' mauve_alignment_chr311_All_Lepus | head -n-1 > chr_311_7th_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:3434577-3482092/,/^> 3:79667770-79667860/p;/^> 3:79667770-79667860/q' mauve_alignment_chr311_All_Lepus | head -n-2 > chr_311_7th_fragment_Lib_8_MacKay2.fasta

# In Aliview, grep for the first/last positions of the association region 
AAGCCAAGCA --> position 112754 1st fragment
CCAAATGGGAAT --> position 40733 in 7th fragment

# Change the header names to be used with samtools:
# 1st fragment:
sed -i 's/^> 1:.*$/>1/' chr_311_1st_fragment_pseudohap2.1.fasta
sed -i 's/^> 2:.*$/>1/' chr_311_1st_fragment_pseudohap2.2.fasta
sed -i 's/^> 3:.*$/>1/' chr_311_1st_fragment_orycun.fasta
sed -i 's/^> 4:.*$/>1/' chr_311_1st_fragment_AD04_DOLSEN1.fasta
sed -i 's/^> 5:.*$/>1/' chr_311_1st_fragment_Lam_ine_2013.fasta
sed -i 's/^> 6:.*$/>1/' chr_311_1st_fragment_LER.fasta
sed -i 's/^> 7:.*$/>1/' chr_311_1st_fragment_LGR_CRE_2553.fasta
sed -i 's/^> 8:.*$/>1/' chr_311_1st_fragment_Lib_1_8897.fasta
sed -i 's/^> 9:.*$/>1/' chr_311_1st_fragment_Lib_2_Canada_227.fasta
sed -i 's/^> 10:.*$/>1/' chr_311_1st_fragment_Lib_4_UAM_83621.fasta
sed -i 's/^> 11:.*$/>1/' chr_311_1st_fragment_Lib_5_UAM_117654.fasta
sed -i 's/^> 12:.*$/>1/' chr_311_1st_fragment_Lib_6_LTM_MAG_1862.fasta
sed -i 's/^> 13:.*$/>1/' chr_311_1st_fragment_Lib_7_LCL_1956.fasta
sed -i 's/^> 14:.*$/>1/' chr_311_1st_fragment_Lib_7_LCP_SAF_1905.fasta
sed -i 's/^> 15:.*$/>1/' chr_311_1st_fragment_Lib_8_MacKay2.fasta
# 7th fragment:
sed -i 's/^> 1:.*$/>1/' chr_311_7th_fragment_pseudohap2.1.fasta
sed -i 's/^> 2:.*$/>1/' chr_311_7th_fragment_pseudohap2.2.fasta
sed -i 's/^> 3:.*$/>1/' chr_311_7th_fragment_orycun.fasta
sed -i 's/^> 4:.*$/>1/' chr_311_7th_fragment_AD04_DOLSEN1.fasta
sed -i 's/^> 5:.*$/>1/' chr_311_7th_fragment_Lam_ine_2013.fasta
sed -i 's/^> 6:.*$/>1/' chr_311_7th_fragment_LER.fasta
sed -i 's/^> 7:.*$/>1/' chr_311_7th_fragment_LGR_CRE_2553.fasta
sed -i 's/^> 8:.*$/>1/' chr_311_7th_fragment_Lib_1_8897.fasta
sed -i 's/^> 9:.*$/>1/' chr_311_7th_fragment_Lib_2_Canada_227.fasta
sed -i 's/^> 10:.*$/>1/' chr_311_7th_fragment_Lib_4_UAM_83621.fasta
sed -i 's/^> 11:.*$/>1/' chr_311_7th_fragment_Lib_5_UAM_117654.fasta
sed -i 's/^> 12:.*$/>1/' chr_311_7th_fragment_Lib_6_LTM_MAG_1862.fasta
sed -i 's/^> 13:.*$/>1/' chr_311_7th_fragment_Lib_7_LCL_1956.fasta
sed -i 's/^> 14:.*$/>1/' chr_311_7th_fragment_Lib_7_LCP_SAF_1905.fasta
sed -i 's/^> 15:.*$/>1/' chr_311_7th_fragment_Lib_8_MacKay2.fasta

## use samtools to slide these sequences:
for i in $(ls chr_311_1st_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_311_1st_fragment*.fasta); do echo $i; samtools faidx $i 1:112754-186880 > ${i/.fasta/.sliced.fasta}; done

for i in $(ls chr_311_7th_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_311_7th_fragment*.fasta); do echo $i; samtools faidx $i 1:1-40733 > ${i/.fasta/.sliced.fasta}; done

# now, let's change the headers. I'm going to change the files directly, that's why I've used
# the coordinates as file names.
for i in $(ls *1st*.sliced.fasta); do o=${i/chr_311_1st_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done

for i in $(ls *7th*.sliced.fasta); do o=${i/chr_311_7th_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done

# concatenate:
cat chr_311_1st_fragment_*.sliced.fasta > chr_311_1st_fragment.sliced.fasta
cat chr_311_7th_fragment_*.sliced.fasta > chr_311_7th_fragment.sliced.fasta

# fix missing data:
sed -i 's/N/?/g' chr_311_1st_fragment.sliced.fasta 
sed -i 's/N/?/g' chr_311_7th_fragment.sliced.fasta

python3 /mnt/beegfs/mf239628e/programs/AMAS/amas/AMAS.py concat -i chr_311_1st_fragment.sliced.fasta chr_311_7th_fragment.sliced.fasta -f fasta -d dna -p chr_311_all_Lepus_concatenated_alignment.txt -t chr_311_all_Lepus_concatenated_alignment.nexus -u nexus
python3 /mnt/beegfs/mf239628e/programs/AMAS/amas/AMAS.py concat -i chr_311_1st_fragment.sliced.fasta chr_311_7th_fragment.sliced.fasta -f fasta -d dna -p chr_311_all_Lepus_concatenated_alignment.txt -t chr_311_all_Lepus_concatenated_alignment.nexus -u fasta

####### AGOUTI:
245:24188393-24237751
grep '^> 1:' mauve_alignment_chr245_All_Lepus_test | cut -f2 -d' ' | cut -f2 -d':' | awk 'BEGIN{FS="-"}{if($2>=24188393 && $1<=24237751) print $0}'
24213587	24215259	5th	1672
24213445	24213547	3rd	102
24216760	24216790	7th	30
24216791	24284948	8th	68157
24215260	24216759	6th	1499
24188321	24213354	1st	25033
24213355	24213444	2nd	89
24213548	24213586	4th	38

# look for the fragments that contain all individuals:
grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24188321-24213354'
> 1:24188321-24213354 + DMNS18807_06042020_pseudohap2.1_chr_245.fasta
> 2:24177461-24198879 + DMNS18807_06042020_pseudohap2.2_chr_245.fasta
> 3:5445195-5473099 - Oryctolagus_cuniculus.OryCun2.0_chr_4.fa
> 4:24190070-24213621 + AD04_DOLSEN1_245.consensus.seqA.fa
> 5:24188369-24213121 + Lam_ine_2013_245.consensus.seqA.fa
> 6:24189977-24213304 + LER_VIE_1639_245.consensus.seqA.fa
> 7:24188369-24213323 + LGR_CRE_2553_245.consensus.seqA.fa
> 8:24188369-24213476 + Lib_1_8897_245.consensus.seqA.fa
> 9:24188369-24213265 + Lib_2_Canada_227_245.consensus.seqA.fa
> 10:24188336-24213058 + Lib_5_UAM_117654_245.consensus.seqA.fa
> 11:24188336-24213229 + Lib_6_LTM_MAG_1862_245.consensus.seqA.fa
> 12:24188812-24214546 + Lib_7_LCL_1956_245.consensus.seqA.fa
> 13:24188369-24213227 + Lib_7_LCP_SAF_1905_245.consensus.seqA.fa
> 14:24189787-24213287 + Lib_8_MacKay2_245.consensus.seqA.fa
> 15:24188497-24213254 + Lib_4_UAM_83621_245.consensus.seqB.fa
> 1:24187853-24188129 + DMNS18807_06042020_pseudohap2.1_chr_245.fasta

grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24213355-24213444' # just pseudohap 2.1
grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24213445-24213547' # not everyone
grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24213548-24213586' # just pseudohap 2.1
grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24213587-24215259' # not everyone
grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24215260-24216759' # does not have Mackay
grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24216760-24216790' # not everyone
grep '^>' mauve_alignment_chr245_All_Lepus_test | grep -A15 '24216791-24284948' # 
> 1:24216791-24284948 + DMNS18807_06042020_pseudohap2.1_chr_245.fasta
> 2:24200118-24267679 + DMNS18807_06042020_pseudohap2.2_chr_245.fasta
> 3:5379546-5444219 - Oryctolagus_cuniculus.OryCun2.0_chr_4.fa
> 4:24217145-24281325 + AD04_DOLSEN1_245.consensus.seqA.fa
> 5:24216791-24283649 + Lam_ine_2013_245.consensus.seqA.fa
> 6:24216839-24282947 + LER_VIE_1639_245.consensus.seqA.fa
> 7:24216791-24284948 + LGR_CRE_2553_245.consensus.seqA.fa
> 8:24216791-24284723 + Lib_1_8897_245.consensus.seqA.fa
> 9:24216791-24284946 + Lib_2_Canada_227_245.consensus.seqA.fa
> 10:24216791-24284948 + Lib_5_UAM_117654_245.consensus.seqA.fa
> 11:24216791-24284948 + Lib_6_LTM_MAG_1862_245.consensus.seqA.fa
> 12:24216839-24282944 + Lib_7_LCL_1956_245.consensus.seqA.fa
> 13:24216791-24284948 + Lib_7_LCP_SAF_1905_245.consensus.seqA.fa
> 14:24216967-24283536 + Lib_8_MacKay2_245.consensus.seqA.fa
> 15:24216791-24284948 + Lib_4_UAM_83621_245.consensus.seqB.fa
> 1:24215260-24216759 + DMNS18807_06042020_pseudohap2.1_chr_245.fasta

# cool, we need to cut the first and 8th fragment:
# 1st fragment:
sed -n '/^> 1:24188321-24213354/,/^> 2:24177461-24198879/p;/^> 2:24177461-24198879/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_pseudohap2.1.fasta
sed -n '/^> 2:24177461-24198879/,/^> 3:5445195-5473099/p;/^> 3:5445195-5473099/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_pseudohap2.2.fasta
sed -n '/^> 3:5445195-5473099/,/^> 4:24190070-24213621/p;/^> 4:24190070-24213621/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_orycun.fasta
sed -n '/^> 4:24190070-24213621/,/^>5:24188369-24213121/p;/^> 5:24188369-24213121/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:24188369-24213121/,/^> 6:24189977-24213304/p;/^> 6:24189977-24213304/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:24189977-24213304/,/^> 7:24188369-24213323/p;/^> 7:24188369-24213323/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:24188369-24213323/,/^> 8:24188369-24213476/p;/^> 8:24188369-24213476/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:24188369-24213476/,/^> 9:24188369-24213265/p;/^> 9:24188369-24213265/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lib_1_8897.fasta
sed -n '/^> 9:24188369-24213265/,/^> 10:24188336-24213058/p;/^> 10:24188336-24213058/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:24188336-24213058/,/^> 11:24188336-24213229/p;/^> 11:24188336-24213229/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 11:24188336-24213229/,/^> 12:24188812-24214546/p;/^> 12:24188812-24214546/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 12:24188812-24214546/,/^> 13:24188369-24213227/p;/^> 13:24188369-24213227/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 13:24188369-24213227/,/^> 14:24189787-24213287/p;/^> 14:24189787-24213287/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 14:24189787-24213287/,/^> 15:24188497-24213254/p;/^> 15:24188497-24213254/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_1st_fragment_Lib_8_MacKay2.fasta
sed -n '/^> 15:24188497-24213254/,/^> 1:24187853-24188129/p;/^> 1:24187853-24188129/q' mauve_alignment_chr245_All_Lepus_test_test | head -n-2 > chr_245_1st_fragment_Lib_4_UAM_83621.fasta

# 8th fragment:
sed -n '/^> 1:24216791-24284948/,/^> 2:24200118-24267679/p;/^> 2:24200118-24267679/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_pseudohap2.1.fasta
sed -n '/^> 2:24200118-24267679/,/^> 3:5379546-5444219/p;/^> 3:5379546-5444219/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_pseudohap2.2.fasta
sed -n '/^> 3:5379546-5444219/,/^> 4:24217145-24281325/p;/^> 4:24217145-24281325/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_orycun.fasta
sed -n '/^> 4:24217145-24281325/,/^> 5:24216791-24283649/p;/^> 5:24216791-24283649/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:24216791-24283649/,/^> 6:24216839-24282947/p;/^> 6:24216839-24282947/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:24216839-24282947/,/^> 7:24216791-24284948/p;/^> 7:24216791-24284948/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:24216791-24284948/,/^> 8:24216791-24284723/p;/^> 8:24216791-24284723/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:24216791-24284723/,/^> 9:24216791-24284946/p;/^> 9:24216791-24284946/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lib_1_8897.fasta
sed -n '/^> 9:24216791-24284946/,/^> 10:24216791-24284948/p;/^> 10:24216791-24284948/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:24216791-24284948/,/^> 11:24216791-24284948/p;/^> 11:24216791-24284948/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 11:24216791-24284948/,/^> 12:24216839-24282944/p;/^> 12:24216839-24282944/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 12:24216839-24282944/,/^> 13:24216791-24284948/p;/^> 13:24216791-24284948/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 13:24216791-24284948/,/^> 14:24216967-24283536/p;/^> 14:24216967-24283536/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 14:24216967-24283536/,/^> 15:24216791-24284948/p;/^> 15:24216791-24284948/q' mauve_alignment_chr245_All_Lepus_test | head -n-1 > chr_245_8th_fragment_Lib_8_MacKay2.fasta
sed -n '/^> 15:24216791-24284948/,/^> 1:24215260-24216759/p;/^> 1:24215260-24216759/q' mauve_alignment_chr245_All_Lepus_test | head -n-2 > chr_245_8th_fragment_Lib_4_UAM_83621.fasta

# In Aliview, grep for the first/last positions of the association region 
CACTGACTACA --> position 91 1st fragment
ATTGGCCAACGCCA --> position 28890 in 8th fragment

# changed header names to use samtools faidx:
for i in $(ls *.fasta); do sed -i 's/^>.*/>1/' $i; done

## use samtools to slice these sequences:
for i in $(ls chr_245_1st_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_245_1st_fragment*.fasta); do echo $i; samtools faidx $i 1:91-45440 > ${i/.fasta/.sliced.fasta}; done

for i in $(ls chr_245_8th_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_245_8th_fragment*.fasta); do echo $i; samtools faidx $i 1:1-28890 > ${i/.fasta/.sliced.fasta}; done

# now, let's change the headers. I'm going to change the files directly, that's why I've used
# the coordinates as file names.
for i in $(ls chr_245_1st_fragment*.sliced.fasta); do o=${i/chr_245_1st_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done

for i in $(ls chr_245_8th_fragment*.sliced.fasta); do o=${i/chr_245_8th_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done

# concatenate:
cat chr_245_1st_fragment_*.sliced.fasta > chr_245_1st_fragment.sliced.fasta
cat chr_245_8th_fragment_*.sliced.fasta > chr_245_8th_fragment.sliced.fasta

# fix missing data:
sed -i 's/N/?/g' chr_245_1st_fragment.sliced.fasta
sed -i 's/N/?/g' chr_245_8th_fragment.sliced.fasta

python3 /mnt/beegfs/mf239628e/programs/AMAS/amas/AMAS.py concat -i chr_245_1st_fragment.sliced.fasta chr_245_8th_fragment.sliced.fasta -f fasta -d dna -p chr_245_all_Lepus_concatenated_alignment.txt -t chr_245_all_Lepus_concatenated_alignment.nexus -u nexus
python3 /mnt/beegfs/mf239628e/programs/AMAS/amas/AMAS.py concat -i chr_245_1st_fragment.sliced.fasta chr_245_8th_fragment.sliced.fasta -f fasta -d dna -p chr_245_all_Lepus_concatenated_alignment.txt -t chr_245_all_Lepus_concatenated_alignment.fasta -u fasta

####### CORIN:
342:46856651-47120426

# In the case of CORIN, there are WAY too many fragments...
grep '^> 1:' mauve_alignment_chr342_All_Lepus | cut -f2 -d' ' | cut -f2 -d':' | awk 'BEGIN{FS="-"}{if($2>=46856651 && $1<=47120426) print $0}'

46841359-46886134
46886135-46886853
46886854-46889879
46889880-46890114
46890115-46890781
46890782-46890929
46890930-46891053
46891054-46892983
46892984-46893067
46893068-46893092
46893093-46893536
46893537-46893625
46893626-46893974
46893975-46894264
46894265-46895920
46895921-46897117
46897118-46897244
46897245-46897924
46897925-46898140
46898141-46898617
46898618-46898880
46898881-46899700
46899701-46899702
46899703-46900159
46900160-46900617
46900618-46901884
46901885-46902264
46902265-46902646
46902647-46903337
46903338-46904046
46904047-46904675
46904676-46905467
46905468-46908873
46908911-46909415
46909416-46909517
46909518-46910051
46910052-46910097
46910098-46910450
46910451-46910844
46910845-46911683
46911684-46912194
46912195-46914418
46914419-46916118
46916119-46916575
46916576-46916579
46916580-46917212
46917213-46918114
46918115-46918911
46918912-46920910
46920911-46921451
46921452-46921933
46921934-46923016
46923017-46924371
46924372-46924378
46924379-46925527
46925528-46925776
46925777-46926227
46926228-46927391
46927392-46927395
46927396-46927533
46927534-46927536
46927537-46927649
46927650-46927661
46927662-46928603
46928604-46939252
46939253-46939313
46939314-46940091
46940092-46940507
46940508-46940931
46940932-46941085
46941086-46941688
46941689-46942398
46942399-46944003
46944004-46944453
46944454-46946427
46946428-46946701
46946702-46946905
46946906-46947451
46947452-46947689
46947690-46947888
46947889-47012671
47012672-47012675
47012676-47013141
47013142-47013159
47013160-47013697
47013698-47013760
47013761-47013909
47013910-47018164
47018165-47018211
47018212-47029342
47029343-47029962
47029963-47030062
47030063-47030071
47030072-47030112
47030113-47030221
47030222-47030313
47030314-47030438
47030439-47030471
47030472-47030492
47030493-47030819
47030820-47031296
47031297-47031444
47031445-47031682
47031683-47063046
47063047-47064198
47064199-47064746
47064747-47064956
47064957-47152621

# This commands will output coordinates in a format that will allow a quicker copy and past for the grep commands bellow.
while read -r line; do grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 "$line" | cut -f1 -d':' | sed 's/> //' | awk '{s+=$1} END {print s}'; done < coordinates.txt 
while read -r line; do grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 "$line" | cut -f1 -d':' | sed 's/> //' | awk '{print}' ORS=''; done < coordinates.txt 

# fist fragment:
 grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 '46841359-46886134'
> 1:46841359-46886134 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 2:46806608-46851071 + DMNS18807_06042020_pseudohap2.2_chr_342.fasta
> 3:36433643-36486947 - Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta
> 4:46841494-46886134 + AD04_DOLSEN1_342.consensus.seqA.fa
> 5:46841358-46886133 + Lam_ine_2013_342.consensus.seqA.fa
> 6:46841183-46886134 + LER_VIE_1639_342.consensus.seqA.fa
> 7:46841359-46886134 + LGR_CRE_2553_342.consensus.seqA.fa
> 8:46841359-46886134 + Lib_1_8897_342.consensus.seqA.fa
> 9:46841359-46886134 + Lib_2_Canada_227_342.consensus.seqA.fa
> 10:46841359-46886134 + Lib_4_UAM_83621_342.consensus.seqA.fa
> 11:46841359-46886134 + Lib_5_UAM_117654_342.consensus.seqA.fa
> 12:46841359-46886134 + Lib_6_LTM_MAG_1862_342.consensus.seqA.fa
> 13:46841178-46886134 + Lib_7_LCL_1956_342.consensus.seqA.fa
> 14:46841359-46886134 + Lib_7_LCP_SAF_1905_342.consensus.seqA.fa
> 15:46841359-46886134 + Lib_8_MacKay2_342.consensus.seqA.fa
> 1:46777136-46840734 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta

# second fragment:
grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 '46886135-46886853'
> 1:46886135-46886853 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 2:46851072-46852148 + DMNS18807_06042020_pseudohap2.2_chr_342.fasta
> 3:36433040-36433586 + Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta
> 4:46886135-46886544 + AD04_DOLSEN1_342.consensus.seqA.fa
> 5:46886134-46886852 + Lam_ine_2013_342.consensus.seqA.fa
> 6:46886135-46886853 + LER_VIE_1639_342.consensus.seqA.fa
> 7:46886135-46886853 + LGR_CRE_2553_342.consensus.seqA.fa
> 8:46886135-46886853 + Lib_1_8897_342.consensus.seqA.fa
> 9:46886135-46886853 + Lib_2_Canada_227_342.consensus.seqA.fa
> 10:46886135-46886853 + Lib_4_UAM_83621_342.consensus.seqA.fa
> 11:46886135-46886853 + Lib_5_UAM_117654_342.consensus.seqA.fa
> 12:46886135-46886853 + Lib_6_LTM_MAG_1862_342.consensus.seqA.fa
> 13:46886135-46886853 + Lib_7_LCL_1956_342.consensus.seqA.fa
> 14:46886135-46886853 + Lib_7_LCP_SAF_1905_342.consensus.seqA.fa
> 15:46886135-46886853 + Lib_8_MacKay2_342.consensus.seqA.fa
> 1:46841359-46886134 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta

# 14th fragment
grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 '46893975-46894264'
> 1:46893975-46894264 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 2:46860188-46860477 + DMNS18807_06042020_pseudohap2.2_chr_342.fasta
> 3:36425999-36427735 - Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta
> 4:46896550-46898741 + AD04_DOLSEN1_342.consensus.seqA.fa
> 5:46896397-46898136 + Lam_ine_2013_342.consensus.seqA.fa
> 6:46896398-46898854 + LER_VIE_1639_342.consensus.seqA.fa
> 7:46895862-46896048 + LGR_CRE_2553_342.consensus.seqA.fa
> 8:46896398-46898137 + Lib_1_8897_342.consensus.seqA.fa
> 9:46896398-46898282 + Lib_2_Canada_227_342.consensus.seqA.fa
> 10:46894296-46894864 + Lib_4_UAM_83621_342.consensus.seqA.fa
> 11:46896398-46896668 + Lib_5_UAM_117654_342.consensus.seqA.fa
> 12:46893980-46894864 + Lib_6_LTM_MAG_1862_342.consensus.seqA.fa
> 13:46896047-46898741 + Lib_7_LCL_1956_342.consensus.seqA.fa
> 14:46896398-46898854 + Lib_7_LCP_SAF_1905_342.consensus.seqA.fa
> 15:46896398-46897926 + Lib_8_MacKay2_342.consensus.seqA.fa
> 6:46895955-46895994 + LER_VIE_1639_342.consensus.seqA.fa

# 65th fragment
46928604-46939252
> 1:46928604-46939252 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 2:46894763-46905485 + DMNS18807_06042020_pseudohap2.2_chr_342.fasta
> 3:36409560-36418354 - Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta
> 4:46931040-46939396 + AD04_DOLSEN1_342.consensus.seqA.fa
> 5:46929469-46939223 + Lam_ine_2013_342.consensus.seqA.fa
> 6:46929712-46938938 + LER_VIE_1639_342.consensus.seqA.fa
> 7:46928652-46939082 + LGR_CRE_2553_342.consensus.seqA.fa
> 8:46929914-46939224 + Lib_1_8897_342.consensus.seqA.fa
> 9:46929725-46939224 + Lib_2_Canada_227_342.consensus.seqA.fa
> 10:46928523-46939220 + Lib_4_UAM_83621_342.consensus.seqA.fa
> 11:46928508-46939251 + Lib_5_UAM_117654_342.consensus.seqA.fa
> 12:46928508-46939220 + Lib_6_LTM_MAG_1862_342.consensus.seqA.fa
> 13:46930758-46939087 + Lib_7_LCL_1956_342.consensus.seqA.fa
> 14:46929573-46939396 + Lib_7_LCP_SAF_1905_342.consensus.seqA.fa
> 15:46929470-46939224 + Lib_8_MacKay2_342.consensus.seqA.fa
> 3:36418750-36420006 - Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta

# 81th fragment
grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 '46947889-47012671'
> 1:46947889-47012671 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 2:46914761-46980870 + DMNS18807_06042020_pseudohap2.2_chr_342.fasta
> 3:36315781-36384011 - Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta
> 4:46948125-47013445 + AD04_DOLSEN1_342.consensus.seqA.fa
> 5:46947911-47012031 + Lam_ine_2013_342.consensus.seqA.fa
> 6:46948026-47013442 + LER_VIE_1639_342.consensus.seqA.fa
> 7:46947650-47012835 + LGR_CRE_2553_342.consensus.seqA.fa
> 8:46947912-47012032 + Lib_1_8897_342.consensus.seqA.fa
> 9:46947912-47012032 + Lib_2_Canada_227_342.consensus.seqA.fa
> 10:46947889-47012204 + Lib_4_UAM_83621_342.consensus.seqA.fa
> 11:46947889-47011200 + Lib_5_UAM_117654_342.consensus.seqA.fa
> 12:46947889-47011958 + Lib_6_LTM_MAG_1862_342.consensus.seqA.fa
> 13:46948103-47020142 + Lib_7_LCL_1956_342.consensus.seqA.fa
> 14:46947650-47013442 + Lib_7_LCP_SAF_1905_342.consensus.seqA.fa
> 15:46947912-47010380 + Lib_8_MacKay2_342.consensus.seqA.fa

# 104 th fragment
 grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 '47031683-47063046'
> 1:47031683-47063046 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 2:46999738-47023841 + DMNS18807_06042020_pseudohap2.2_chr_342.fasta
> 3:36269633-36301189 - Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta
> 4:47031795-47063651 + AD04_DOLSEN1_342.consensus.seqA.fa
> 5:47031707-47062857 + Lam_ine_2013_342.consensus.seqA.fa
> 6:47031638-47064203 + LER_VIE_1639_342.consensus.seqA.fa
> 7:47031683-47062983 + LGR_CRE_2553_342.consensus.seqA.fa
> 8:47031708-47063046 + Lib_1_8897_342.consensus.seqA.fa
> 9:47031708-47063045 + Lib_2_Canada_227_342.consensus.seqA.fa
> 10:47031683-47062873 + Lib_4_UAM_83621_342.consensus.seqA.fa
> 11:47031683-47062858 + Lib_5_UAM_117654_342.consensus.seqA.fa
> 12:47031683-47062873 + Lib_6_LTM_MAG_1862_342.consensus.seqA.fa
> 13:47031638-47062806 + Lib_7_LCL_1956_342.consensus.seqA.fa
> 14:47031723-47063046 + Lib_7_LCP_SAF_1905_342.consensus.seqA.fa
> 15:47031708-47063067 + Lib_8_MacKay2_342.consensus.seqA.fa
> 1:47031445-47031682 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 1:46946428-46946701 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta

# 108th fragment
grep '^>' mauve_alignment_chr342_All_Lepus | grep -A15 '47064957-47152621'
> 1:47064957-47152621 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta
> 2:47025752-47119387 + DMNS18807_06042020_pseudohap2.2_chr_342.fasta
> 3:36167986-36269628 - Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta
> 4:47065010-47152600 + AD04_DOLSEN1_342.consensus.seqA.fa
> 5:47064410-47152515 + Lam_ine_2013_342.consensus.seqA.fa
> 6:47065010-47152611 + LER_VIE_1639_342.consensus.seqA.fa
> 7:47064957-47152621 + LGR_CRE_2553_342.consensus.seqA.fa
> 8:47064411-47152516 + Lib_1_8897_342.consensus.seqA.fa
> 9:47064542-47152516 + Lib_2_Canada_227_342.consensus.seqA.fa
> 10:47065010-47152621 + Lib_4_UAM_83621_342.consensus.seqA.fa
> 11:47064957-47152621 + Lib_5_UAM_117654_342.consensus.seqA.fa
> 12:47064957-47152621 + Lib_6_LTM_MAG_1862_342.consensus.seqA.fa
> 13:47065012-47152634 + Lib_7_LCL_1956_342.consensus.seqA.fa
> 14:47064006-47152621 + Lib_7_LCP_SAF_1905_342.consensus.seqA.fa
> 15:47064830-47152634 + Lib_8_MacKay2_342.consensus.seqA.fa
> 1:47031683-47063046 + DMNS18807_06042020_pseudohap2.1_chr_342.fasta

 
sed -n '/^> 1:46841359-46886134/,/^> 2:46806608-46851071/p;/^> 2:46806608-46851071/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_pseudohap2.1.fasta
sed -n '/^> 2:46806608-46851071/,/^> 3:36433643-36486947/p;/^> 3:36433643-36486947/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_pseudohap2.2.fasta
sed -n '/^> 3:36433643-36486947/,/^> 4:46841494-46886134/p;/^> 4:46841494-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_orycun.fasta
sed -n '/^> 4:46841494-46886134/,/^> 5:46841358-46886133/p;/^> 5:46841358-46886133/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:46841358-46886133/,/^> 6:46841183-46886134/p;/^> 6:46841183-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:46841183-46886134/,/^> 7:46841359-46886134/p;/^> 7:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:46841359-46886134/,/^> 8:46841359-46886134/p;/^> 8:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:46841359-46886134/,/^> 9:46841359-46886134/p;/^> 9:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lib_1_8897.fasta
sed -n '/^> 9:46841359-46886134/,/^> 10:46841359-46886134/p;/^> 10:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:46841359-46886134/,/^> 11:46841359-46886134/p;/^> 11:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:46841359-46886134/,/^> 12:46841359-46886134/p;/^> 12:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:46841359-46886134/,/^> 13:46841178-46886134/p;/^> 13:46841178-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:46841178-46886134/,/^> 14:46841359-46886134/p;/^> 14:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:46841359-46886134/,/^> 15:46841359-46886134/p;/^> 15:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_1st_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:46841359-46886134/,/^> 1:46777136-46840734/p;/^> 1:46777136-46840734/q' mauve_alignment_chr342_All_Lepus | head -n-2 > chr_342_1st_fragment_Lib_8_MacKay2.fasta

sed -n '/^> 1:46886135-46886853/,/^> 2:46851072-46852148/p;/^> 2:46851072-46852148/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_pseudohap2.1.fasta
sed -n '/^> 2:46851072-46852148/,/^> 3:36433040-36433586/p;/^> 3:36433040-36433586/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_pseudohap2.2.fasta
sed -n '/^> 3:36433040-36433586/,/^> 4:46886135-46886544/p;/^> 4:46886135-46886544/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_orycun.fasta
sed -n '/^> 4:46886135-46886544/,/^> 5:46886134-46886852/p;/^> 5:46886134-46886852/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:46886134-46886852/,/^> 6:46886135-46886853/p;/^> 6:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:46886135-46886853/,/^> 7:46886135-46886853/p;/^> 7:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:46886135-46886853/,/^> 8:46886135-46886853/p;/^> 8:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:46886135-46886853/,/^> 9:46886135-46886853/p;/^> 9:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lib_1_8897.fasta
sed -n '/^> 9:46886135-46886853/,/^> 10:46886135-46886853/p;/^> 10:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:46886135-46886853/,/^> 11:46886135-46886853/p;/^> 11:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:46886135-46886853/,/^> 12:46886135-46886853/p;/^> 12:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:46886135-46886853/,/^> 13:46886135-46886853/p;/^> 13:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:46886135-46886853/,/^> 14:46886135-46886853/p;/^> 14:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:46886135-46886853/,/^> 15:46886135-46886853/p;/^> 15:46886135-46886853/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_2nd_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:46886135-46886853/,/^> 1:46841359-46886134/p;/^> 1:46841359-46886134/q' mauve_alignment_chr342_All_Lepus | head -n-2 > chr_342_2nd_fragment_Lib_8_MacKay2.fasta



sed -n '/^> 1:46893975-46894264/,/^> 2:46860188-46860477/p;/^> 2:46860188-46860477/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_pseudohap2.1.fasta
sed -n '/^> 2:46860188-46860477/,/^> 3:36425999-36427735/p;/^> 3:36425999-36427735/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_pseudohap2.2.fasta
sed -n '/^> 3:36425999-36427735/,/^> 4:46896550-46898741/p;/^> 4:46896550-46898741/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_orycun.fasta
sed -n '/^> 4:46896550-46898741/,/^> 5:46896397-46898136/p;/^> 5:46896397-46898136/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:46896397-46898136/,/^> 6:46896398-46898854/p;/^> 6:46896398-46898854/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:46896398-46898854/,/^> 7:46895862-46896048/p;/^> 7:46895862-46896048/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:46895862-46896048/,/^> 8:46896398-46898137/p;/^> 8:46896398-46898137/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:46896398-46898137/,/^> 9:46896398-46898282/p;/^> 9:46896398-46898282/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lib_1_8897.fasta
sed -n '/^> 9:46896398-46898282/,/^> 10:46894296-46894864/p;/^> 10:46894296-46894864/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:46894296-46894864/,/^> 11:46896398-46896668/p;/^> 11:46896398-46896668/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:46896398-46896668/,/^> 12:46893980-46894864/p;/^> 12:46893980-46894864/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:46893980-46894864/,/^> 13:46896047-46898741/p;/^> 13:46896047-46898741/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:46896047-46898741/,/^> 14:46896398-46898854/p;/^> 14:46896398-46898854/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:46896398-46898854/,/^> 15:46896398-46897926/p;/^> 15:46896398-46897926/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_14th_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:46896398-46897926/,/^> 6:46895955-46895994/p;/^> 6:46895955-46895994/q' mauve_alignment_chr342_All_Lepus | head -n-2 > chr_342_14th_fragment_Lib_8_MacKay2.fasta

sed -n '/^> 1:46928604-46939252/,/^> 2:46894763-46905485/p;/^> 2:46894763-46905485/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_pseudohap2.1.fasta
sed -n '/^> 2:46894763-46905485/,/^> 3:36409560-36418354/p;/^> 3:36409560-36418354/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_pseudohap2.2.fasta
sed -n '/^> 3:36409560-36418354/,/^> 4:46931040-46939396/p;/^> 4:46931040-46939396/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_orycun.fasta
sed -n '/^> 4:46931040-46939396/,/^> 5:46929469-46939223/p;/^> 5:46929469-46939223/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:46929469-46939223/,/^> 6:46929712-46938938/p;/^> 6:46929712-46938938/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:46929712-46938938/,/^> 7:46928652-46939082/p;/^> 7:46928652-46939082/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:46928652-46939082/,/^> 8:46929914-46939224/p;/^> 8:46929914-46939224/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:46929914-46939224/,/^> 9:46929725-46939224/p;/^> 9:46929725-46939224/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lib_1_8897.fasta
sed -n '/^> 9:46929725-46939224/,/^> 10:46928523-46939220/p;/^> 10:46928523-46939220/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:46928523-46939220/,/^> 11:46928508-46939251/p;/^> 11:46928508-46939251/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:46928508-46939251/,/^> 12:46928508-46939220/p;/^> 12:46928508-46939220/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:46928508-46939220/,/^> 13:46930758-46939087/p;/^> 13:46930758-46939087/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:46930758-46939087/,/^> 14:46929573-46939396/p;/^> 14:46929573-46939396/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:46929573-46939396/,/^> 15:46929470-46939224/p;/^> 15:46929470-46939224/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_65th_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:46929470-46939224/,/^> 3:36418750-36420006/p;/^> 3:36418750-36420006/q' mauve_alignment_chr342_All_Lepus | head -n-2 > chr_342_65th_fragment_Lib_8_MacKay2.fasta

sed -n '/^> 1:46947889-47012671/,/^> 2:46914761-46980870/p;/^> 2:46914761-46980870/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_pseudohap2.1.fasta
sed -n '/^> 2:46914761-46980870/,/^> 3:36315781-36384011/p;/^> 3:36315781-36384011/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_pseudohap2.2.fasta
sed -n '/^> 3:36315781-36384011/,/^> 4:46948125-47013445/p;/^> 4:46948125-47013445/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_orycun.fasta
sed -n '/^> 4:46948125-47013445/,/^> 5:46947911-47012031/p;/^> 5:46947911-47012031/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:46947911-47012031/,/^> 6:46948026-47013442/p;/^> 6:46948026-47013442/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:46948026-47013442/,/^> 7:46947650-47012835/p;/^> 7:46947650-47012835/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:46947650-47012835/,/^> 8:46947912-47012032/p;/^> 8:46947912-47012032/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:46947912-47012032/,/^> 9:46947912-47012032/p;/^> 9:46947912-47012032/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lib_1_8897.fasta
sed -n '/^> 9:46947912-47012032/,/^> 10:46947889-47012204/p;/^> 10:46947889-47012204/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:46947889-47012204/,/^> 11:46947889-47011200/p;/^> 11:46947889-47011200/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:46947889-47011200/,/^> 12:46947889-47011958/p;/^> 12:46947889-47011958/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:46947889-47011958/,/^> 13:46948103-47020142/p;/^> 13:46948103-47020142/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:46948103-47020142/,/^> 14:46947650-47013442/p;/^> 14:46947650-47013442/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:46947650-47013442/,/^> 15:46947912-47010380/p;/^> 15:46947912-47010380/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_81st_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:46947912-47010380/,/^> 1:46946428-46946701/p;/^> 1:46946428-46946701/q' mauve_alignment_chr342_All_Lepus | head -n-2 > chr_342_81st_fragment_Lib_8_MacKay2.fasta

sed -n '/^> 1:47031683-47063046/,/^> 2:46999738-47023841/p;/^> 2:46999738-47023841/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_pseudohap2.1.fasta
sed -n '/^> 2:46999738-47023841/,/^> 3:36269633-36301189/p;/^> 3:36269633-36301189/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_pseudohap2.2.fasta
sed -n '/^> 3:36269633-36301189/,/^> 4:47031795-47063651/p;/^> 4:47031795-47063651/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_orycun.fasta
sed -n '/^> 4:47031795-47063651/,/^> 5:47031707-47062857/p;/^> 5:47031707-47062857/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:47031707-47062857/,/^> 6:47031638-47064203/p;/^> 6:47031638-47064203/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:47031638-47064203/,/^> 7:47031683-47062983/p;/^> 7:47031683-47062983/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:47031683-47062983/,/^> 8:47031708-47063046/p;/^> 8:47031708-47063046/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:47031708-47063046/,/^> 9:47031708-47063045/p;/^> 9:47031708-47063045/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lib_1_8897.fasta
sed -n '/^> 9:47031708-47063045/,/^> 10:47031683-47062873/p;/^> 10:47031683-47062873/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:47031683-47062873/,/^> 11:47031683-47062858/p;/^> 11:47031683-47062858/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:47031683-47062858/,/^> 12:47031683-47062873/p;/^> 12:47031683-47062873/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:47031683-47062873/,/^> 13:47031638-47062806/p;/^> 13:47031638-47062806/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:47031638-47062806/,/^> 14:47031723-47063046/p;/^> 14:47031723-47063046/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:47031723-47063046/,/^> 15:47031708-47063067/p;/^> 15:47031708-47063067/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_104_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:47031708-47063067/,/^> 1:47031445-47031682/p;/^> 1:47031445-47031682/q' mauve_alignment_chr342_All_Lepus | head -n-2 > chr_342_104_fragment_Lib_8_MacKay2.fasta

sed -n '/^> 1:47064957-47152621/,/^> 2:47025752-47119387/p;/^> 2:47025752-47119387/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_pseudohap2.1.fasta
sed -n '/^> 2:47025752-47119387/,/^> 3:36167986-36269628/p;/^> 3:36167986-36269628/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_pseudohap2.2.fasta
sed -n '/^> 3:36167986-36269628/,/^> 4:47065010-47152600/p;/^> 4:47065010-47152600/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_orycun.fasta
sed -n '/^> 4:47065010-47152600/,/^> 5:47064410-47152515/p;/^> 5:47064410-47152515/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_AD04_DOLSEN1.fasta
sed -n '/^> 5:47064410-47152515/,/^> 6:47065010-47152611/p;/^> 6:47065010-47152611/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lam_ine_2013.fasta
sed -n '/^> 6:47065010-47152611/,/^> 7:47064957-47152621/p;/^> 7:47064957-47152621/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_LER_VIE_1639.fasta
sed -n '/^> 7:47064957-47152621/,/^> 8:47064411-47152516/p;/^> 8:47064411-47152516/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_LGR_CRE_2553.fasta
sed -n '/^> 8:47064411-47152516/,/^> 9:47064542-47152516/p;/^> 9:47064542-47152516/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lib_1_8897.fasta
sed -n '/^> 9:47064542-47152516/,/^> 10:47065010-47152621/p;/^> 10:47065010-47152621/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lib_2_Canada_227.fasta
sed -n '/^> 10:47065010-47152621/,/^> 11:47064957-47152621/p;/^> 11:47064957-47152621/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lib_4_UAM_83621.fasta
sed -n '/^> 11:47064957-47152621/,/^> 12:47064957-47152621/p;/^> 12:47064957-47152621/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lib_5_UAM_117654.fasta
sed -n '/^> 12:47064957-47152621/,/^> 13:47065012-47152634/p;/^> 13:47065012-47152634/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lib_6_LTM_MAG_1862.fasta
sed -n '/^> 13:47065012-47152634/,/^> 14:47064006-47152621/p;/^> 14:47064006-47152621/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lib_7_LCL_1956.fasta
sed -n '/^> 14:47064006-47152621/,/^> 15:47064830-47152634/p;/^> 15:47064830-47152634/q' mauve_alignment_chr342_All_Lepus | head -n-1 > chr_342_108_fragment_Lib_7_LCP_SAF_1905.fasta
sed -n '/^> 15:47064830-47152634/,/^> 1:47031683-47063046/p;/^> 1:47031683-47063046/q' mauve_alignment_chr342_All_Lepus | head -n-2 > chr_342_108_fragment_Lib_8_MacKay2.fasta

## 1st fragment:
# In Aliview, grep for the first/last positions of the association region 
ATCCCTTCATA --> position 20117 1st fragment
TTTCCTGGGCAA --> position 85186 in 108th fragment

# changed header names to use samtools faidx:
for i in $(ls chr_342_1st_fragment*.fasta); do sed -i 's/^>.*/>1/' $i; done
for i in $(ls chr_342_108_fragment*.fasta); do sed -i 's/^>.*/>1/' $i; done

## use samtools to slice these sequences. only first and last fragment need to be sliced.
for i in $(ls chr_342_1st_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_342_1st_fragment*.fasta); do echo $i; samtools faidx $i 1:20117-64480 > ${i/.fasta/.sliced.fasta}; done

for i in $(ls chr_342_108_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_342_108_fragment*.fasta); do echo $i; samtools faidx $i 1:1-85186 > ${i/.fasta/.sliced.fasta}; done

# now, let's change the headers. I'm going to change the files directly, that's why I've used
# the coordinates as file names.
for i in $(ls chr_342_1st_fragment*.sliced.fasta); do o=${i/chr_342_1st_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done
for i in $(ls chr_342_108_fragment*.sliced.fasta); do o=${i/chr_342_108_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done

for i in $(ls chr_342_2nd*.fasta); do o=${i/chr_342_2nd_fragment_/}; p=${o/.fasta/}; sed -i "s/>.*/>$p/" $i ; done
for i in $(ls chr_342_65th*.fasta); do o=${i/chr_342_65th_fragment_/}; p=${o/.fasta/}; sed -i "s/>.*/>$p/" $i ; done
for i in $(ls chr_342_81st*.fasta); do o=${i/chr_342_81st_fragment_/}; p=${o/.fasta/}; sed -i "s/>.*/>$p/" $i ; done
for i in $(ls chr_342_14th*.fasta); do o=${i/chr_342_14th_fragment_/}; p=${o/.fasta/}; sed -i "s/>.*/>$p/" $i ; done
for i in $(ls chr_342_104_*.fasta); do o=${i/chr_342_104_fragment_/}; p=${o/.fasta/}; sed -i "s/>.*/>$p/" $i ; done

# concatenate:
cat chr_342_1st_fragment_*.sliced.fasta > chr_342_1st_fragment.sliced.fasta
cat chr_342_2nd_fragment_*.fasta > chr_342_2nd_fragment.fasta
cat chr_342_14th_fragment_*.fasta > chr_342_14th_fragment.fasta
cat chr_342_65th_fragment_*.fasta > chr_342_65th_fragment.fasta
cat chr_342_81st_fragment_*.fasta > chr_342_81st_fragment.fasta
cat chr_342_104_fragment_*.fasta > chr_342_104_fragment.fasta
cat chr_342_108_fragment_*.sliced.fasta > chr_342_108_fragment.sliced.fasta

# fix missing data:
sed -i 's/N/?/g' chr_342_1st_fragment.sliced.fasta
sed -i 's/N/?/g' chr_342_2nd_fragment.fasta
sed -i 's/N/?/g' chr_342_14th_fragment.fasta
sed -i 's/N/?/g' chr_342_65th_fragment.fasta
sed -i 's/N/?/g' chr_342_81st_fragment.fasta
sed -i 's/N/?/g' chr_342_104_fragment.fasta
sed -i 's/N/?/g' chr_342_108_fragment.sliced.fasta

python3 /mnt/beegfs/mf239628e/programs/AMAS/amas/AMAS.py concat -i chr_342_1st_fragment.sliced.fasta chr_342_2nd_fragment.fasta chr_342_14th_fragment.fasta chr_342_65th_fragment.fasta chr_342_81st_fragment.fasta chr_342_104_fragment.fasta chr_342_108_fragment.sliced.fasta -f fasta -d dna -p chr_342_all_Lepus_concatenated_alignment.txt -t chr_342_all_Lepus_concatenated_alignment.nexus -u nexus
python3 /mnt/beegfs/mf239628e/programs/AMAS/amas/AMAS.py concat -i chr_342_1st_fragment.sliced.fasta chr_342_2nd_fragment.fasta chr_342_14th_fragment.fasta chr_342_65th_fragment.fasta chr_342_81st_fragment.fasta chr_342_104_fragment.fasta chr_342_108_fragment.sliced.fasta -f fasta -d dna -p chr_342_all_Lepus_concatenated_alignment.txt -t chr_342_all_Lepus_concatenated_alignment.fasta -u fasta
