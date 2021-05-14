#parallel 'echo "creating gphocs input for {}"' ::: $chromosome

cd chr_"$chromosome"
echo "I'm inside" 

# where are the files:
ln -s /mnt/beegfs/mf239628e/coat_color_evol/pseudo_ref_based/wwe_GG/chr_"$chromosome"/Lib_6_JMG186_"$chromosome".consensus.fa
ln -s /mnt/beegfs/mf239628e/coat_color_evol/pseudo_ref_based/wwe_GG/chr_"$chromosome"/Lib_8_MacKay2_"$chromosome".consensus.fa
ln -s /mnt/beegfs/mf239628e/coat_color_evol/pseudo_ref_based/wwe_GG/chr_"$chromosome"/Lib_8_Burke4_"$chromosome".consensus.fa
ln -s /mnt/beegfs/mf239628e/coat_color_evol/pseudo_ref_based/wwe_GG/chr_"$chromosome"/JMG193_"$chromosome".consensus.fa

# MASK REPEATS IN THE FASTA SEQ:
for i in $(ls *.consensus.fa); do bedtools maskfasta -fi $i -bed /mnt/beegfs/mf239628e/coat_color_evol/pseudo_ref_based/gphocs/OryCun2.0_repeats_fixedChr.bed -fo ${i/.consensus.fa/.mask.fa}; done

#GET FASTAS FOR 1000 BP FRAGMENTS COORDINATES PRODUCED WITH PYTHON SCRIPT:
for i in $(ls *.mask.fa); do bedtools getfasta -fi $i -bed /mnt/beegfs/mf239628e/coat_color_evol/pseudo_ref_based/gphocs/rabbit_intergenic_1000kb_windows.bed -fo ${i/.mask.fa/.frags.fa}; done

#REMOVE FRAGMENTS WITH > 40% Ns (SCRIPT: seq_clean.py):
for i in $(ls *.frags.fa); do python eq_clean_N.py $i 1000 40; done

#GET ID LIST FOR EACH FASTA AND SORT:
for i in $(ls clear*.fa); do cat $i | grep ">" | sort | uniq > ${i/.frags.fa/.ids.txt}; done

#FIND COMMON IDS:
comm -12 clear_Lib_6_JMG186_"$chromosome".ids.txt clear_Lib_8_Burke4_"$chromosome".ids.txt > comm1.txt
comm -12 comm1.txt clear_Lib_8_MacKay2_"$chromosome".ids.txt > comm2.txt
comm -12 comm2.txt clear_JMG193_"$chromosome".ids.txt > comm3.txt

#FROM EACH FASTA FILE EXTRACT COMMON SEQS (based on ids):
sed 's/^.//' comm3.txt > comm3_final.txt
for i in $(ls clear*.fa); do perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' comm3_final.txt $i > ${i/.frags.fa/.commons.fa}; done

#SORT FASTA FILES BY SEQS ID:
for i in $(ls *.commons.fa); do seqkit sort $i > ${i/.commons.fa/.commons_sorted.fa}; done

#ADD POPULATION TAG TO THE SEQ HEADER IN FASTA FILE:
for i in $(ls *.commons_sorted.fa); do header=${i/_"$chromosome".commons_sorted.fa/}; hd=${header/clear_/}; echo $hd ; perl -pe "s/>/>$hd-/g" $i > ${i/.commons_sorted.fa/.rpl.fa}; done

#ORDER SEQUENCES IN ONE FASTA FILE:
python combine_fastas.py clear_Lib_6_JMG186_"$chromosome".rpl.fa clear_Lib_8_Burke4_"$chromosome".rpl.fa clear_Lib_8_MacKay2_"$chromosome".rpl.fa clear_JMG193_"$chromosome".rpl.fa > all_chr"$chromosome"_combined.fasta

#REMOVE > FROM THE BEGINNING OF LINES:
sed 's/^.//' all_chr"$chromosome"_combined.fasta > all_chr"$chromosome"_combined_final.fasta

#ADD EMPTY LINE EVERY 4th LINE:
awk ' {print;} NR % 4 == 0 { print ""; }' all_chr"$chromosome"_combined_final.fasta > all_chr"$chromosome"_combined_emptyline.fasta

#INSERT LINES WITH LOCUS NAMES:
awk ' BEGIN{print "locus_name 4 1000"}{print;} NR % 5 == 0 { print "locus_name 4 1000"; }' all_chr"$chromosome"_combined_emptyline.fasta > all_chr"$chromosome"_combined_names.fasta

#REMOVE COORDINATES:
sed -i  "s/-[0-9]*:[0-9]*-[0-9]*//g" all_chr"$chromosome"_combined_names.fasta

#PRODUCE FINAL G-PHOCS INPUT WITH PYTHON SCRIPT - gphocs_input.py
python gphocs_input.py all_chr"$chromosome"_combined_names.fasta "$chromosome" all_chr"$chromosome"_gphocs_input.txt

# REMOVE LAST LINE
head -n -1 all_chr"$chromosome"_gphocs_input.txt > chr"$chromosome"_gphocs_input.txt 

rm *.commons.fa
rm *.commons_sorted.fa
rm *.frags.fa
rm *.ids.txt
rm *.mask.fa
rm *.mask.fa.fai