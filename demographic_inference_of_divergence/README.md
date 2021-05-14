## Demographic Inference of Divergence

We used G-PhoCs to estimate ancestral and current effective population sizes, population divergence times, and bi-directional migration rates between white-tailed jackrabbits and black-tailed jackrabbits or Arctic hares. These parameters will be important for divergence simulations to detect introgression in the association regions.

This folder contains G-PhoCs log files and the output files. It also contains the scripts used to generate the input files from whole-genome consensus fasta sequences for various individuals. Since this analysis relies on putatively neutral and non-repetitive sequence data, we used consensus sequences in the coordinates of the European rabbit genome where intergenic and repetitive regions have been annotated.

First, I found the coordinates of intergenic regions in the European rabbit reference genome. Using Biomart, I download the coordinates of all GENE IDS in the rabbit genome `gene_coordinates_ENSEMBL_OryCun2_18April20.txt`. Check code in `input_file.R` to see how I converted this to a bed file that I could use with `bedtools complement`.

```
bedtools complement -i gene_coordinates_ENSEMBL_OryCun2_18April20.bed -g Oryctolagus_21chr.chromsizes > rabbit_intergenic.bed
```

With this bed file, I selected regions that were at least 20000 bp away from genes and that were longer than 1000 bps. The code used is in `input_file.R` as well. The output file is `rabbit_intergenic_larger1Kb_20kbfromgenes.bed`. Finally, I used `bedtools makewindows` to obtain the coordinates of 1000 bp windows that are at least 50 kb apart from each other.

```
bedtools makewindows -b rabbit_intergenic_larger1Kb_20kbfromgenes.bed -w 1000 -s 50000 > rabbit_intergenic_1000kb_windows.bed
```

Finally, from Genome Browser, I obtained the coordinates of regions masked by RepeatMasker `OryCun2.0_repeats.bed`, which I processed with the sed command bellow. This file is available on FigShare.

```
sed 's/chr//' OryCun2.0_repeats.bed > OryCun2.0_repeats_fixedChr.bed
```

Inside a folder specific for each pair of species, I ran the commands inside `create_Gphocs_inputs_LCAF_d1.sh` and `create_Gphocs_inputs_LAR_d1.sh`. `LCF` and `LAR` are abbreviations of the species names of black-tailed jackrabbits and Arctic hares. These scripts call two custom python scripts `gphocs_input.py`, `seq_clean_N.py` and `combine_fastas.py` that are available in this folder. It also uses as input consensus fasta sequences for each scaffold and the bed files `OryCun2.0_repeats_fixedChr.bed` and `rabbit_intergenic_1000kb_windows.bed`. 

Finally, I concatenated the resulting alignments in a single input file for GPhoCs. Add the number of alignments to the top of the input file.

```
ln -s chr_*/chr*_gphocs_input.txt ./
cat chr*_gphocs_input.txt > wg_LCAF_d1_gphocs_input.txt
```

I constructed the control files for GPhoCs using the Control File Generator provided with the installation. I ran GPhoCs three times for each species pair and therefore created three control files. These can be found in the folders [arctic-hares](arctic-hares) and [black-tailed-jackrabbits](black-tailed-jackrabbits). The final log files can also be found there. I found that these files cannot be run directly by Tracer because there is some issue with the tab separator. I used the following `awk` command to fix these files.

```
awk 'BEGIN {FS=" "; OFS="\t"} {print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}' wg_LAR_gphocs_t4_d2_run1.log > wg_LAR_gphocs_t4_d2_run1_fixed.log
```

From Tracer, I extracted the estimated parameters and 95% HPD confidence intervals of the three combined runs. The formulas I used to convert the parameters using a mutation rate of 2.80E-09 and generation time of 2 years are reported in the main publication. The calculations can be found in the excel file [msms_calculations.xlsx](https://github.com/MafaldaSFerreira/wtjr_winter_camouflage_evolution/tree/master/detecting_introgression_with_coalescent_simulations)

