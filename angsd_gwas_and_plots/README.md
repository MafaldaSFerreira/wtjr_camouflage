## Running an association analysis with ANGSD

### Case Control

We will start with the output of a case control association, where individuals are classified as white or brown. This classification can be found in Table S4. I explain all the filters applied in the Materials and Methods of the original publication.

```
angsd -yBin colour.txt -bam bams.txt -sites sites_min11-non_ct_ga-positions.txt -out wb_a928_hap2.1_74i_snps_min55ind_min11-non_ct_ga -doAsso 1 -GL 1 -doCounts 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 -minQ 20 -minMapQ 20 -uniqueOnly 1 -remove_bads 1 -minInd 55 -setMinDepth 55 -setMaxDepth 390 -P 14
```

After the run is complete, we want to plot the results. We first convert the likelihood ration scores to -log10(P values) assuming that LRT is Chi Square distributed with 1 degree of freedom, as instructed by [ANGSD](http://www.popgen.dk/angsd/index.php/Association). 

The script bellow will assume LRT values are in the 6th column.

```
python lrt2plot_v2.py wb_a928_hap2.1_74i_snps_min55ind_min11-non_ct_ga.lrt0 > wb_a928_hap2.1_74i_snps_min55ind_min11-non_ct_ga.2plot.p
```

We also want to plot scaffolds in order of length, with longest scaffolds first, since that generally looks better in a manhattan plot. To do this, we used a file containing scaffold names ordered by length, from longest to shortest. This file contains a second column which gives the order of the scaffolds, from 1 to 4712. Use the `samtools faidx` output for this command.

```
sort -nr -k2,2 DMNS18807_06042020_pseudohap2.1_10k.fasta.fai | cut -f1 | awk '{print $0,NR}' > DMNS18807_06042020_pseudohap2.1_10k_order_correspondance.txt
```

This file will be called by the following R script, which re-orders the ANGSD output so that the results of the longest scaffolds come first and so on.

```
Rscript ordered_2plot_files.R wb_a928_hap2.1_74i_snps_min55ind_min11-non_ct_ga.2plot.p
```

Finally, we use a script that calls ggplots to plot our results. The first argument of the script is the output file from `lrt2plot_v2.py` or `ordered_2plot_files.R`. The second argument is the desired name of the output .tiff file. The third argument is the threshold -log10(P value) that was applied to find significant associations. In my case, I applied a Bonferroni correction and used the formula:

```
-log10(0.05/ No. of SNPs) = Threshold 
```

to caculate the Threshold, depending on the number of SNPs tested.

```
Rscript manhattan_plot_ggplot.R wg_wb_a928_hap2.1_74i_snps_min55ind_min11-non_ct_ga.2plot.p_reordered.txt wg_wb_a928_hap2.1_74i_snps_min55ind_min11-non_ct_ga.p_reordered.tif 8.660152593
```

### Score Test

If we want to correct the case control results for population structure or instead perform an association test with a quantitative phenotype, we need to use the score test instead. Here are the commands I used:

#### 1) Correcting case control test for population structure
```
angsd -yBin colour.txt -cov PC1_PC2_IBS_maf0.05_74i.txt -bam bams.txt -sites sites_min11-non_ct_ga-positions.txt -out wg_PC1_PC2_IBS_maf0.05_model1 -doAsso 2 -model 1 -GL 1 -doCounts 1 -doMajorMinor 1 -doMaf 1 -doPost 1 -SNP_pval 1e-6 -minQ 20 -minMapQ 20 -uniqueOnly 1 -remove_bads 1 -minInd 55 -setMinDepth 55 -setMaxDepth 390 -P 14 -minCount 5 -minHigh 5
```

#### 2) Association with continuous winter coat color

We used PC1 loadings of a PCA analysis with dorsal reflectance measurements for 61 animals as a proxy for coat color. The code to perform this analysis can be found [here](https://github.com/MafaldaSFerreira/wtjr_winter_camouflage_evolution/blob/master/analyses_of_reflectance_data/README.md)

```
angsd -yQuant PC1_280820.txt -bam bams_PC_280820.txt -out wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820 -sites sites_non_ct_ga_positions_2alleles.txt -doAsso 2 -doPost 1 -GL 1 -doCounts 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 -minQ 20 -minMapQ 20 -uniqueOnly 1 -remove_bads 1 -minInd 45 -setMinDepth 45 -setMaxDepth 312 -P 10 -minCount 5 -minHigh 5
```

#### 3) Association with continuous winter coat color correcting for population structure 
```
angsd -yQuant spec_PC1_280820.txt -cov PC1_PC2_IBS_maf0.05_61i_280820.txt -bam bams_280820.txt -out wg_specPC1_test1_MQ20_PC1_PC2_IBS_maf0.05_61i_280820 -rf chr_non_ct_ga_positions_2alleles.txt -sites sites_non_ct_ga_positions_2alleles.txt -doAsso 2 -doPost 1 -GL 1 -doCounts 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 -minQ 20 -minMapQ 20 -uniqueOnly 1 -remove_bads 1 -minInd 45 -setMinDepth 45 -setMaxDepth 312 -P 10 -minCount 5 -minHigh 5
```

The downstream steps for the outputs of the score test are all the same as for the case control, so I will show only one example.

We remove sites that failed the test.

```
zcat wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820.lrt0.gz | awk '{if($7!=-999) print $0}' > wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820.lrt0
```

Convert LRT to -log10(P values). In this case, the script reads LRT values in the 7th column. 

```
python lrt2plot_v3.py wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820.lrt0 > wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820.2plot.p
```

Re-order results by scaffold length.

```
Rscript ordered_2plot_files.R wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820.2plot.p
```

And plot results as described above. These were the commands used to generate the plots in final publication.

```
Rscript manhattan_plot_ggplot.R wg_specPC1_test1_MQ20_PC1_PC2_IBS_maf0.05.2plot.p_reordered.txt wg_specPC1_test1_MQ20_PC1_PC2_IBS_maf0.05.2plot.p_reordered.tif 8.045926346

Rscript manhattan_plot_ggplot.R wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820.2plot.p_reordered.txt wb_wg_specPC1_snps_test1_MQ20_non_ct_ga_sites_280820.2plot.p_reordered.tif 8.045926346

Rscript manhattan_plot_ggplot.R wg_specPC1_test1_MQ20_PC1_PC2_IBS_maf0.05.2plot.p_reordered.txt wg_specPC1_test1_MQ20_PC1_PC2_IBS_maf0.05.2plot.p_reordered.tif 8.045926346
```