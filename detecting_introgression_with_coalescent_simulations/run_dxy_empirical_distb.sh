# Mafalda Ferreira
# 17 de Janeiro de 2021
# this is bash script that will generate the dxy_empirical distributions
# 

source activate GG

chromosome=$1
start=$2
ende=$3
region=$4

pop1=$5
pop2=$7
sample1=$6
sample2=$8

#echo $chromosome
#echo $start
#echo $ende
#echo $region
#echo $pop1
#echo $pop2
#echo $sample1
#echo $sample2

DIR=chr_"$chromosome"_"$pop1"_"$pop2"_"$region"

name="$chromosome"_"$pop1"_"$pop2"

echo $DIR

if [ ! -d "$DIR" ]; then
#  # Take action if $DIR does not exist. #
  mkdir $DIR
fi

cd "$DIR"

# check notes file chap5_pipeline.MSMS_dxy_Distributions_RND_intervals.txt to see how 
# chr_"$chromosome"_1Mb_asso.geno was generated. This file is a subset of a global geno file
# that I subsampled to be within 1Mb of the association regions. This makes these commands 
# much faster.

# first step is to subset the geno file by the samples we want
python filterGenotypes.py -i ../chr_"$chromosome"_1Mb_asso.geno -o chr_"$name".geno -p $pop1 $sample1 -p $pop2 $sample2

# second step, retrieve only the region we want to look at
awk -v a=$start -v b=$ende 'NR==1{print $0}; NR>1{if($2>=a && $2<=b) print $0}' chr_"$name".geno > chr_"$name"_"$region".geno

# third, generate 1000 samples of 20000 sites:
python random_sample_from_geno.py chr_"$name"_"$region".geno $chromosome

# calculate dxy for each one of them. make sure you change -f according to phased or diplo genotypes. it shouldn't change results tho.
parallel -j 10 "python popgenWindows.py -g chr_{1}_sample_{2}.geno -p {3} {4} -p {5} {6} -f diplo --windType sites -w 20000 -o chr_{1}_sample_{2}.dxy" ::: $chromosome ::: $(seq 0 999) ::: $pop1 ::: $sample1 ::: $pop2 ::: $sample2

# generate a table with dxys:
for i in $(ls chr*_sample_*.dxy); do cut -f8 -d',' $i | tail -n1; done > "$pop1"_"$pop2"_chr_"$chromosome"_"$region".dxy
