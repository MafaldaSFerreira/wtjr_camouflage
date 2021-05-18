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

### Submitting genome to GenBank

Here I detail certain filtering steps I had to undergo so that I could submit the genome to GenBank on NCBI. Therefore, the submitted genome is not the one used for the original analysis.

The submission portal reported the occorrence of sequences that were strings of Ns. I removed these using [BBmap](https://sourceforge.net/projects/bbmap/) `filterbyname.pl` script.

```
filterbyname.sh in=../DMNS18807_06042020_pseudohap2.1.fasta out=DMNS18807_06042020_pseudohap2.1.noNs.fasta names=2156,2069,2125,2209,2155,1989,1994,2123,1987,2208,2092,1986,2119,2083,2074,2091,2205,1990,2115,2154,2072,2081,2118,2106,1991,2124,2164,320539,2114,2107,2097,1985,2116,2153,359326,2122,1995,321491,2071,366560,1992,2076,1997,1993,2084,1988,2085,2105,2136,2082,2089

filterbyname.sh in=../DMNS18807_06042020_pseudohap2.2.fasta out=DMNS18807_06042020_pseudohap2.2.noNs.fasta names=2156,2069,2125,2209,2155,1989,1994,2123,1987,2208,2092,1986,2119,2083,2074,2091,2205,1990,2115,2154,2072,2081,2118,2106,1991,2124,2164,320539,2114,2107,2097,1985,2116,2153,359326,2122,1995,321491,2071,366560,1992,2076,1997,1993,2084,1988,2085,2105,2136,2082,2089
```