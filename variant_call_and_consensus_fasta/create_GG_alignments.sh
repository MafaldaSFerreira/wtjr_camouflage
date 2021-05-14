#for chromosome as $1
chromosome=$1
parallel 'echo "creating wwe consensus input for {}"' ::: $chromosome

cd chr_"$chromosome"
echo "I'm inside" 

# change header
for i in $(ls *.consensus.fa.gz); do header=${i/_"$chromosome".consensus.fa.gz/}; o=${i/.consensus.fa.gz/.new.fa}; zcat $i | sed "s/$chromosome/$header/" > $o; done

# create a full chromosome file
cat *.new.fa > chr_"$chromosome"_full_align.fa

# convert to seqToGeno.fa
python seqToGeno.py -s chr_"$chromosome"_full_align.fa -g chr_"$chromosome"_full_align.geno -f fasta --mode samples -C $chromosome

# convert all bases to uppercase:
awk 'NR==1 {print $0}; NR>1 {print toupper($0)}' chr_"$chromosome"_full_align.geno > chr_"$chromosome"_full_align_up.geno

# not sure why, but certain files have one genotype coded as a start. remove those lines.
sed '/\*/d' chr_"$chromosome"_full_align_up.geno > chr_"$chromosome"_full_align_up_fi.geno
