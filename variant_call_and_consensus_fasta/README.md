## Variant call and filter with bcftools

We used bcftools to call genotypes. In one line, this command will call bcftools mpileup, call, filter and view to produce a vcf file containing only high quality genotypes that pass the filters. The input bam file has been sorted, and we have removed duplicates and realigned indels using Picard. The final vcf file contains invariant and variant sites, and excludes all indels. The call is done by scaffold and sample to be faster.

Input variables of the commands:

1. `$scaffold` - Scaffold being called
2. `$sample` - Sample being called
3. `$maxDepth` - Three times the average coverage for the sample, to be used in the bcftools filter step to exclude genotypes. Depth of coverage was estimated with Qualimap.


```
bcftools mpileup -q 20 -Q 20 -f pseudo-reference.fa -Ou -a DP -r $scaffold $sample.realigned.bam | bcftools call -m -f GQ,GP -Ou | bcftools filter --include "type!=\"INDEL\" && STRLEN(REF) == 1 && QUAL >= 20 && FORMAT/DP >= 6 && INFO/DP < $maxDepth && FMT/GQ >=30 || type!=\"INDEL\" && STRLEN(REF) == 1 && QUAL >= 20 && FORMAT/DP >= 6 && INFO/DP < $maxDepth && FMT/GT==\"0/0\"" -S . -Ou | bcftools view --apply-filters "PASS" -Oz > chr_$scaffold/$sample_$chromosome.vcf.gz
```

## Generating a consensus fasta for each individual

Using the filtered vcf from the previous step, we next generate a consensus fasta sequence for each individual.

Create a bed file containing the coordinates of all sites that were called.

```
bcftools view -H $sample_$scaffold.vcf.gz | do_bed.awk > $sample_$scaffold.filter.bed
```

Grep the lenght of the scaffold beign called from the reference genome.

```
faidx --transform chromsizes --out DMNS18807_06042020_pseudohap2.1_10k.chromsizes DMNS18807_06042020_pseudohap2.1_10k.fasta
```
```
grep -w "$scaffold" DMNS18807_06042020_pseudohap2.1_10k.chromsizes > chr_"$scaffold".chromsize
```

Use bedtools complement to create a bed file of positions that were not called.

```
bedtools complement -i $sample_$scaffold.filter.bed -g chr_$scaffold.chromsize > $sample_$scaffold.nocall.bed
```

Index vcf files for the next step.

```
parallel -j 6 'bcftools index {1}' ::: $(ls *.vcf.gz)
```

Call samtools and then bcftools consensus to inject the called genotypes into the reference sequence. Note that you should provide the name of the sample in the vcf file with `--sample`.

```
samtools faidx path/to/reference $scaffold | bcftools consensus -I $sample_$scaffold.vcf.gz --sample $sample > $sample_$scaffold.fa
```

Finally, hard-mask uncalled positions in the consensus fasta.

```
bedtools maskfasta -fi $sample_$scaffold.fa -bed $sample_$scaffold.filter.nocall.bed -fo $sample_$scaffold.consensus.fa
```

## Converting consensus fasta files to the geno input of genomics generals

With the code in `create_GG_alignments.sh`, I concatenated the individual consensus fasta of each scaffold in a single scaffold alignment containing all individuals. Then, I used that to create a geno file which was used as input for the `Genomics General`.