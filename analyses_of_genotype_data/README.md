## Genotype data analyses

We genotyped SNPs across the association regions using mass spectrometry. This code was used to process genotype data, perform linear regression analyses to detect associations between genotypes and continuous winter coat color and perform fisher exact tests for differences in allele counts between winter white and winter brown individuals from Colorado and other states.

The R libraries required for this code are:
- genotypeR
- doBy
- reshape2
- tidyverse
- janitor

The input files necessary are the genotypes for 92 individuals `genotypes.txt`, the scaffold and coordinates of the region used to design the primers for genotyping in a specific file `Final_jackrabbit_34SNPs_plex_genos.txt` required by `genotypeR`, PC1 loading of reflectance data `phenotype_PC1_loading_spec_data.txt` obtained in [previous analysis](https://github.com/MafaldaSFerreira/wtjr_winter_camouflage_evolution/blob/master/analyses_of_reflectance_data/README.md), coat color classifications and State origin for each individual `binary_phenotype_state.txt`, and PC1 and PC2 of a PCA analysis with 239,834 single-nucleotide polymorphisms to correct for population structure `PC1_PC2_minmaf0.05_61i.txt`. The linear regression code is detailed in the script `genotype_analyses.R`.

