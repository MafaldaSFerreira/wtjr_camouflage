## Genotype data analyses

We genotyped SNPs across the association regions using mass spectrometry. This is code I used to process this genotype data and perform linear regression analyses to detect associations between genotypes and continuous winter coat color.

The R libraries required for this code are:
- genotypeR
- doBy
- reshape2

The input files necessary are the genotypes for 59 individuals `genotypes.txt`, the scaffold and coordinates of the region used to design the primers for genotyping in a specific file `Final_jackrabbit_34SNPs_plex_genos.txt` required by `genotypeR`, PC1 loading of reflectance data `phenotype_PC1_loading_spec_data.txt` obtained in [previous analysis](https://github.com/MafaldaSFerreira/wtjr_winter_camouflage_evolution/blob/master/analyses_of_reflectance_data/README.md), and PC1 and PC2 of a PCA analysis with 239,834 single-nucleotide polymorphisms to correct for population structure `PC1_PC2_minmaf0.05_61i.txt`.

The linear regression code is detailed in the script `genotype_analyses.R`.

