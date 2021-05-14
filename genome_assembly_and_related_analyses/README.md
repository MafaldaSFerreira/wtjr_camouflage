## Supernova assembly with 10 X Genomics linked read data

We obtained 10 X Genomics linked read data for one individual white-tailed jackrabbit.

### Assembly 

This was the command used to generate the assembly.

```
~/programs/supernova-2.1.1/supernova run --id=DMNS18807 --fastqs=/home/mafalda_ferreira/assembly10X/ --maxreads=1265935139 --localcores=50
```

This was how I extracted the various outputs. In downstream analyses, I only used the primary and alternative pseudo-haploid assemblies `DMNS18807_06042020_pseudohap2.1.fasta` and `DMNS18807_06042020_pseudohap2.2.fasta` which are the outputs of `--style pseudohap2`.

```
~/programs/supernova-2.1.1/supernova mkoutput --style pseudohap2 --asmdir=/home/mafalda_ferreira/assembly10X/assembly/DMNS18807/outs/assembly --outprefix=DMNS18807_06042020_pseudohap2
~/programs/supernova-2.1.1/supernova mkoutput --style pseudohap2 --index --asmdir=/home/mafalda_ferreira/assembly10X/assembly/DMNS18807/outs/assembly --outprefix=DMNS18807_06042020_pseudohap2_index

~/programs/supernova-2.1.1/supernova mkoutput --style pseudohap --asmdir=/home/mafalda_ferreira/assembly10X/assembly/DMNS18807/outs/assembly --outprefix=DMNS18807_06042020_pseudohap
~/programs/supernova-2.1.1/supernova mkoutput --style raw --asmdir=/home/mafalda_ferreira/assembly10X/assembly/DMNS18807/outs/assembly --outprefix=DMNS18807_06042020_raw
~/programs/supernova-2.1.1/supernova mkoutput --style megabubbles --asmdir=/home/mafalda_ferreira/assembly10X/assembly/DMNS18807/outs/assembly --outprefix=DMNS18807_06042020_megabubbles
```

### QUAST

Assessing assembly quality using Quast.

```
~/programs/quast/quast.py -o DMNS18807_06042020_pseudohap2.1 DMNS18807_06042020_pseudohap2.1.fasta.gz
~/programs/quast/quast.py -o DMNS18807_06042020_pseudohap2.2 DMNS18807_06042020_pseudohap2.2.fasta.gz
```

### Removing small contigs from the assembly

I filtered contigs that were shorter than 10 kb from the assembly using a custom script found on BioStars https://www.biostars.org/p/79202/.


```
perl removesmalls.pl 10000 DMNS18807_06042020_pseudohap2.1.fasta > DMNS18807_06042020_pseudohap2.1_10k.fasta
perl removesmalls.pl 10000 DMNS18807_06042020_pseudohap2.2.fasta > DMNS18807_06042020_pseudohap2.2_10k.fasta
```

### Lifting annotations from the European rabbit reference genome

I used the program `Liftoff` to perform a draf annotation of the reference genome. First, I downloded the European rabbit reference genome (OryCun2.0) and respective annotation from ENSEMBL.

```
wget ftp://ftp.ensembl.org/pub/release-100/fasta/oryctolagus_cuniculus/dna/Oryctolagus_cuniculus.OryCun2.0.dna_rm.toplevel.fa.gz
wget ftp://ftp.ensembl.org/pub/release-100/gff3/oryctolagus_cuniculus/Oryctolagus_cuniculus.OryCun2.0.100.gff3.gz
```

Then, I ran Liftoff.

```
liftoff -t ../DMNS18807_06042020_pseudohap2.1.fasta -r Oryctolagus_cuniculus.OryCun2.0.dna_rm.toplevel.fa -g Oryctolagus_cuniculus.OryCun2.0.100.gff3 -p 10 -o DMNS18807_06042020_pseudohap2.1_OryCun2.0_liftoff_annotation -u DMNS18807_06042020_pseudohap2.1_liftoff_unmapped -copies -dir ./tmp
```

The output gff file can be found at https://figshare.com/s/0a2dce1d3a6cf15d0e3d.
