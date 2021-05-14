## Estimating divergence between white and brown haplotypes

This folder contains the input and output files of the BEAST analysis that was used to estimate the divergence time between the white and brown haplotypes in the CORIN, EDNRB and ASIP association regions.

We took advantage of the phased reference genome, since it is based on an heterozygote individual. Therefore, the pseudohaploid versions of the genome represent alternative haplotypes.

We also included sequences from other hare species by randomly phasing the consensus fasta sequences for the target scaffolds (342, 311 and 245) for each one of them. The script `fake_phase_fasta_algn.py` can be found at the [EVOCHANGE github](https://github.com/evochange/hare-phylogenomics/blob/master/6.network_analyses/6.network_analyses.md).

```
for i in $$(ls *.consensus.fa); do python fake_phase_fasta_algn.py $i ${i/.fa/.haploid.fa}'; done
```

We used one of the haploid sequences for the analysis.

```
for i in $(ls *.haploid.fa); do grep -A1 '^>' $i | head -n2 > ${i/.haploid.fa/.seqA.fa}; done
```

We used `MAUVE` to align all the haploid scaffolds against the European rabbit reference genome. Scaffold 245 was aligned to chromosome 4, scaffold 342 to chromosome 2 and scaffold 311 to chromosome 8.

```
progressiveMauve --output=mauve_alignment_chr245_All_Lepus_test --output-guide-tree=mauve_alignment_chr245_All_Lepus_test.guide_tree --backbone-output=mauve_alignment_chr245_All_Lepus_test.backbone --scratch-path-1=/mnt/beegfs/mf239628e/assembly_analysis/MAUVE/all_Lepus/tmp/ DMNS18807_06042020_pseudohap2.1_chr_245.fasta DMNS18807_06042020_pseudohap2.2_chr_245.fasta Oryctolagus_cuniculus.OryCun2.0_chr_4.fa AD04_DOLSEN1_245.consensus.seqA.fa Lam_ine_2013_245.consensus.seqA.fa LER_VIE_1639_245.consensus.seqA.fa LGR_CRE_2553_245.consensus.seqA.fa Lib_1_8897_245.consensus.seqA.fa Lib_2_Canada_227_245.consensus.seqA.fa Lib_5_UAM_117654_245.consensus.seqA.fa Lib_6_LTM_MAG_1862_245.consensus.seqA.fa Lib_7_LCL_1956_245.consensus.seqA.fa Lib_7_LCP_SAF_1905_245.consensus.seqA.fa Lib_8_MacKay2_245.consensus.seqA.fa Lib_4_UAM_83621_245.consensus.seqB.fa

progressiveMauve --output=mauve_alignment_chr311_All_Lepus --output-guide-tree=mauve_alignment_chr311_All_Lepus.guide_tree --backbone-output=mauve_alignment_chr311_All_Lepus.backbone --scratch-path-1=./tmp/ DMNS18807_06042020_pseudohap2.1_chr_311.fasta DMNS18807_06042020_pseudohap2.2_chr_311.fasta Oryctolagus_cuniculus.OryCun2.0_chr_8.fasta AD04_DOLSEN1_311.consensus.seqA.fa Lam_ine_2013_311.consensus.seqA.fa LER_VIE_1639_311.consensus.seqA.fa LGR_CRE_2553_311.consensus.seqA.fa Lib_1_8897_311.consensus.seqA.fa Lib_2_Canada_227_311.consensus.seqA.fa Lib_4_UAM_83621_311.consensus.seqA.fa Lib_5_UAM_117654_311.consensus.seqA.fa Lib_6_LTM_MAG_1862_311.consensus.seqA.fa Lib_7_LCL_1956_311.consensus.seqA.fa Lib_7_LCP_SAF_1905_311.consensus.seqA.fa Lib_8_MacKay2_311.consensus.seqA.fa

progressiveMauve --output=mauve_alignment_chr342_All_Lepus --output-guide-tree=mauve_alignment_chr342_All_Lepus.guide_tree --backbone-output=mauve_alignment_chr342_All_Lepus.backbone --scratch-path-1=./tmp/ DMNS18807_06042020_pseudohap2.1_chr_342.fasta DMNS18807_06042020_pseudohap2.2_chr_342.fasta Oryctolagus_cuniculus.OryCun2.0_chr_2.fasta AD04_DOLSEN1_342.consensus.seqA.fa Lam_ine_2013_342.consensus.seqA.fa LER_VIE_1639_342.consensus.seqA.fa LGR_CRE_2553_342.consensus.seqA.fa Lib_1_8897_342.consensus.seqA.fa Lib_2_Canada_227_342.consensus.seqA.fa Lib_4_UAM_83621_342.consensus.seqA.fa Lib_5_UAM_117654_342.consensus.seqA.fa Lib_6_LTM_MAG_1862_342.consensus.seqA.fa Lib_7_LCL_1956_342.consensus.seqA.fa Lib_7_LCP_SAF_1905_342.consensus.seqA.fa Lib_8_MacKay2_342.consensus.seqA.fa
```

I parsed the MAUVE output manually to obtain the input for BEAST. The final output file will contain many homologous alignments that are split. Using the coordinates of the association regions, it is possible to find the alignments that are within or overlap with the association region. 

For example, knowing that the association region of EDNRB has the coordinates 311:3382351-3462194, I grep`ed all alignments that are within or overlap with these coordinates from the ouput.

```
grep '^> 1:' mauve_alignment_chr311_All_Lepus | cut -f2 -d' ' | cut -f2 -d':' | awk 'BEGIN{FS="-"}{if($2>=3382351 && $1<=3462194) print $0}'
```
With this, we find that there are 7 alignments or fragnments that overlap or are within the association region.

```
3434577-3481985 7th --> longer and complete
3434405-3434576 6th
3432081-3433642 4th
3433643-3434404 5th
3431463-3432080 3rd
3431114-3431462 2nd
3322196-3431113 1st --> longer and complete
````

Using the command:
```
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3434577-3481985'
```

...for each one of the coordinates above, I found that only the first and seventh alignment contain all the individuals. Therefore, I will only use those two for the BEAST analysis, since the rest of the individuals would only contain missing data in that specific region of the genome. BEAST ignores all positions with missing data.

```
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3434405-3434576'
```
```
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
```

```
grep '^>' mauve_alignment_chr311_All_Lepus | grep -A15 '3434577-3481985'
```
```
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
```

We use the coordinates above, to store the fasta sequence of each individual in an individual fasta file with a sed command.

1st fragment:
```
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
```

7th fragment:
```
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
```

These fasta files now need to be trimmed to include only the association region. In AliView, I searched for the beginning and end of the association region in chr_311_1st_fragment_pseudohap2.1.fasta and chr_311_7th_fragment_pseudohap2.1.fasta, since I know how the DNA sequence looks like.

AAGCCAAGCA --> position 112754 1st fragment

CCAAATGGGAAT --> position 40733 in 7th fragment

Now, we need to change the headers of these files so they can be used with `samtools faidx`.

```
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
```

Call `samtools faidx`. This only works because all fragments are now in the coordinates of the pseudohaploid genome 2.1.

```
for i in $(ls chr_311_1st_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_311_1st_fragment*.fasta); do echo $i; samtools faidx $i 1:112754-186880 > ${i/.fasta/.sliced.fasta}; done

for i in $(ls chr_311_7th_fragment*.fasta); do echo $i; samtools faidx $i; done
for i in $(ls chr_311_7th_fragment*.fasta); do echo $i; samtools faidx $i 1:1-40733 > ${i/.fasta/.sliced.fasta}; done
```

Change the fasta headers so that they have individual names.

```
for i in $(ls *1st*.sliced.fasta); do o=${i/chr_311_1st_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done

for i in $(ls *7th*.sliced.fasta); do o=${i/chr_311_7th_fragment_/}; p=${o/.sliced.fasta/}; sed -i "s/>.*/>$p/" $i ; done
```

Concate all the individual files.
```
cat chr_311_1st_fragment_*.sliced.fasta > chr_311_1st_fragment.sliced.fasta
cat chr_311_7th_fragment_*.sliced.fasta > chr_311_7th_fragment.sliced.fasta
```

Convert N to ? to code for missing data.
```
sed -i 's/N/?/g' chr_311_1st_fragment.sliced.fasta 
sed -i 's/N/?/g' chr_311_7th_fragment.sliced.fasta
```

Finally, use `AMAS` to concatenate fragment 1 and 7 and convert fasta files to nexus format.

```
python3 /mnt/beegfs/mf239628e/programs/AMAS/amas/AMAS.py concat -i chr_311_1st_fragment.sliced.fasta chr_311_7th_fragment.sliced.fasta -f fasta -d dna -p chr_311_all_Lepus_concatenated_alignment.txt -t chr_311_all_Lepus_concatenated_alignment.nexus -u nexus
```

The command line for the other two regions is in the file `commands_used_to_generate_BEAST_input_files.sh`.




