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

After this, I submitted the genomes to NCBI again. NCBI trimmed a few more scaffolds that were too short/contamination, but not all. I used the "ForeignContaminationModified" genome .fsa files to filter more scaffolds based on the ncbi reports (pseudohap2.1_submit.ncbi.nlm.nih.gov.txt and pseudohap2.2_submit.ncbi.nlm.nih.gov.txt).

#### Mitochondria

I put all the putative sequences in a new file and used NCBI blast to confirm these were indeed mtDNA. All of these blasted to other Lepus mtDNA. Results in XF2HP8CT013-Alignment.txt.zip XF0NJ2VH013-Alignment.txt.zip

```
samtools faidx DMNS18807_06042020_pseudohap2.1.noNs.fasta 230727 > pseudohap2.1_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.1.noNs.fasta 237548 >> pseudohap2.1_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.1.noNs.fasta 271992 >> pseudohap2.1_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.1.noNs.fasta 321837 >> pseudohap2.1_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.1.noNs.fasta 321838 >> pseudohap2.1_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.1.noNs.fasta 970 >> pseudohap2.1_putative_mtDNA.fasta
```

```
samtools faidx DMNS18807_06042020_pseudohap2.2.noNs.fasta 230727 > pseudohap2.2_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.2.noNs.fasta 237548 >> pseudohap2.2_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.2.noNs.fasta 271992 >> pseudohap2.2_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.2.noNs.fasta 321837 >> pseudohap2.2_putative_mtDNA.fasta
samtools faidx DMNS18807_06042020_pseudohap2.2.noNs.fasta 321838 >> pseudohap2.2_putative_mtDNA.fasta
```

I removed these sequences.

#### Duplicates

I kept one sequence per duplicate.

#### Filtering

I created files with the scaffolds to remove.

```
filterbyname.sh -Xmx20g in=fasta/DMNS18807_06042020_pseudohap2_1_noNs.fa out=DMNS18807_06042020_pseudohap2_1.noNs.nomtDNA.noDups.fasta names=filter_p2.1_lcl.txt
filterbyname.sh -Xmx20g in=fasta/DMNS18807_06042020_pseudohap2_2_noNs.fa out=DMNS18807_06042020_pseudohap2_2.noNs.nomtDNA.noDups.fasta names=filter_p2.2_lcl.txt
```

#### Adaptors

The recommendation is to split these scaffolds in two, but some of them are quite long. Also, looking at the D-Genies output, none of the alignments to Oryctolagus chromosomes breaks on any of the coordinates labeled as adaptors, which gives me some confidence that the scaffolds were not misassembled because of adaptor contamination. Splitting the scaffolds would require changing their names relatively to what was used during the actual analysis. To avoid confusion, my decision was then to mask these coordinates.

```
Sequence name, length, span(s), apparent source
227	113291978	2762876..2762915,33348480..33348519	adaptor:multiple
241886	18998	1..16148	mitochondrion-not_cleaned
295	102702642	102113456..102113476	adaptor:NGB01088.1-not_cleaned
310509	7130	5732..5772	adaptor:NGB00749.1-not_cleaned
317375	7134	5736..5776	adaptor:NGB00749.1-not_cleaned
373	46990746	9685310..9685338	adaptor:NGB01088.1-not_cleaned
375	59613073	17653677..17653710	adaptor:NGB01088.1-not_cleaned
488	49961744	25258059..25258087	adaptor:NGB01096.1-not_cleaned
574	5648746	5102940..5102970	adaptor:NGB01088.1-not_cleaned
683	63731038	17893472..17893509	adaptor:NGB01093.1-not_cleaned
84	26604866	4197141..4197193	adaptor:NGB01096.1-not_cleaned
```

```
Sequence name, length, span(s), apparent source
227	113287062	2760996..2761035,33364340..33364379	adaptor:multiple
241886	18998	1..16148	mitochondrion-not_cleaned
295	94574294	93985801..93985821	adaptor:NGB01088.1-not_cleaned
310509	7130	5732..5772	adaptor:NGB00749.1-not_cleaned
317375	7134	5736..5776	adaptor:NGB00749.1-not_cleaned
373	46989064	9661041..9661069	adaptor:NGB01088.1-not_cleaned
375	59580242	17692317..17692350	adaptor:NGB01088.1-not_cleaned
488	49961815	25270409..25270437	adaptor:NGB01096.1-not_cleaned
574	5653791	5106340..5106370	adaptor:NGB01088.1-not_cleaned
683	63657215	17871249..17871286	adaptor:NGB01093.1-not_cleaned
84	26576653	4194845..4194897	adaptor:NGB01096.1-not_cleaned
```

```
bedtools maskfasta -fi DMNS18807_06042020_pseudohap2_1.noNs.nomtDNA.noDups.fasta -fo DMNS18807_06042020_pseudohap2_1.noNs.nomtDNA.noDups.masked.fasta -bed p_2_1_mask.bed

bedtools maskfasta -fi DMNS18807_06042020_pseudohap2_2.noNs.nomtDNA.noDups.fasta -fo DMNS18807_06042020_pseudohap2_2.noNs.nomtDNA.noDups.masked.fasta -bed p_2_2_mask.bed
```

Renamed the genome fastas to the original name I used in the submission. 

```
mv DMNS18807_06042020_pseudohap2.1.noNs.fasta DMNS18807_06042020_pseudohap2.1.noNs.original.fasta
mv DMNS18807_06042020_pseudohap2.2.noNs.fasta DMNS18807_06042020_pseudohap2.2.noNs.original.fasta

mv DMNS18807_06042020_pseudohap2_1.noNs.nomtDNA.noDups.masked.fasta DMNS18807_06042020_pseudohap2.1.noNs.fasta
mv DMNS18807_06042020_pseudohap2_2.noNs.nomtDNA.noDups.masked.fasta DMNS18807_06042020_pseudohap2.2.noNs.fasta
```

I submitted DMNS18807_06042020_pseudohap2.1.noNs.fasta and DMNS18807_06042020_pseudohap2.2.noNs.fasta

### Filtering again:

NCBI flagged additional contigs, so let's remove them. The reports are the following files `2nd_error_report_pseudohap2.1.submit.ncbi.nlm.nih.gov.txt` and `2nd_error_report_pseudohap2.2.submit.ncbi.nlm.nih.gov.txt`


```
filterbyname.sh -Xmx20g in=DMNS18807_06042020_pseudohap2.1.noNs.fasta out=DMNS18807_06042020_pseudohap2.1.noNs.2ndRound.fasta names=filter_p2.1_lcl_v2.txt
filterbyname.sh -Xmx20g in=DMNS18807_06042020_pseudohap2.2.noNs.fasta out=DMNS18807_06042020_pseudohap2.2.noNs.2ndRound.fasta names=filter_p2.2_lcl_v2.txt
```

Renamed the genome fastas to the original name I used in the submission. 

```
mv DMNS18807_06042020_pseudohap2.1.noNs.fasta DMNS18807_06042020_pseudohap2.1.noNs.1stSubmission.fasta
mv DMNS18807_06042020_pseudohap2.2.noNs.fasta DMNS18807_06042020_pseudohap2.2.noNs.1stSubmission.fasta

mv DMNS18807_06042020_pseudohap2.1.noNs.2ndRound.fasta DMNS18807_06042020_pseudohap2.1.noNs.fasta
mv DMNS18807_06042020_pseudohap2.2.noNs.2ndRound.fasta DMNS18807_06042020_pseudohap2.2.noNs.fasta
```

Submission inside screen "submissions"

```
sftp subftp@sftp-private.ncbi.nlm.nih.gov
w4pYB9VQ
cd uploads/amafaldasferreira_gmail.com_pqCTDBGy
mkdir genomes
cd genomes
put DMNS18807_06042020_pseudohap2.1.noNs.fasta
put DMNS18807_06042020_pseudohap2.2.noNs.fasta
```