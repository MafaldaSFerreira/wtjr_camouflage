########################################
# genotype_analyses.R version 2
# October 4, 2021
# Performing changes requested by Tim:
# REQUEST 1. For the PC1 data going into that model, could you multiply all the PC scores by -1, such that positive PC scores are more brown and negative PC scores are more white?
# - Line 94
# REQUEST 2. Could you have the genotype data be in terms of counts of the brown allele (0, 1, or 2 brown alleles), instead of the white? Such that each Beta value is the amount of increase in the PC score (increase in brown) for each additional brown allele.
# - Line 72, 83
# REQUEST 3. Could you run the model without the PCs, and only with corin and ednrb (I’m starting with just two loci for now). Thus, the model equation would be pc1 ~ corin + ednrb.
# - Line 189
# I did not repeat the entire code (check line 210), but can do it if necessary.
########################################
# 28-10-2022: After suggestion for reviewer 2, I added an extra linaer regression, E, where I test 
# for the interaction between ASIP and CORIN
# Had to install/re-install some packages
#######################################
sessionInfo()
# R version 4.2.0 (2022-04-22)
# Platform: x86_64-apple-darwin17.0 (64-bit)
# Running under: macOS Monterey 12.5.1
# 
# Matrix products: default
# LAPACK: /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRlapack.dylib
# 
# locale:
#   [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
# 
# attached base packages:
#   [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#   [1] janitor_2.1.0     genotypeR_0.0.1.8 doBy_4.6.14       forcats_0.5.2     stringr_1.4.1     dplyr_1.0.10     
# [7] purrr_0.3.4       readr_2.1.2       tidyr_1.2.1       tibble_3.1.8      ggplot2_3.3.6     tidyverse_1.3.2  
# [13] reshape2_1.4.4   
# 
# loaded via a namespace (and not attached):
#   [1] zoo_1.8-11           tidyselect_1.1.2     lattice_0.20-45      haven_2.5.1          gargle_1.2.1        
# [6] snakecase_0.11.0     colorspace_2.0-3     vctrs_0.4.1          generics_0.1.3       utf8_1.2.2          
# [11] rlang_1.0.5          pillar_1.8.1         glue_1.6.2           withr_2.5.0          DBI_1.1.3           
# [16] dbplyr_2.2.1         modelr_0.1.9         readxl_1.4.1         lifecycle_1.0.2      plyr_1.8.7          
# [21] munsell_0.5.0        gtable_0.3.1         cellranger_1.1.0     rvest_1.0.3          tzdb_0.3.0          
# [26] fansi_1.0.3          broom_1.0.1          Rcpp_1.0.9           scales_1.2.1         backports_1.4.1     
# [31] googlesheets4_1.0.1  jsonlite_1.8.0       fs_1.5.2             microbenchmark_1.4.9 Deriv_4.1.3         
# [36] gridExtra_2.3        hms_1.1.2            stringi_1.7.8        grid_4.2.0           cli_3.4.0           
# [41] tools_4.2.0          magrittr_2.0.3       crayon_1.5.1         pkgconfig_2.0.3      Matrix_1.5-1        
# [46] MASS_7.3-58.1        ellipsis_0.3.2       xml2_1.3.3           reprex_2.0.2         googledrive_2.0.0   
# [51] lubridate_1.8.0      assertthat_0.2.1     httr_1.4.4           rstudioapi_0.14      R6_2.5.1            
# [56] compiler_4.2.0

#######################################
# Load packages:
#######################################

install.packages("~/Downloads/genotypeR_0.0.1.8.tar.gz", repos = NULL, type="source")
install.packages("doBy")
install.packages("janitor")

library(genotypeR)
library(doBy)
library(reshape2)
library(tidyverse)
library(janitor)

#######################################
load("genotype_analyses_130122.RData")
save.image("genotype_analyses_281022.RData")
#######################################

# Read input file with genotype data for 34 SNPs
genos<-read.table("genotypes.txt",header=T)
# This is a file with the names of each SNP.
# REQUEST 2 - Note: In this input file, the first allele in brackets is the white allele
markers<-read.table("Final_jackrabbit_34SNPs_plex_genos.txt",header=F)
colnames(markers)<-c("chr","start","end","marker")

# We need to convert genotypes to alleles in the format 0, 1, and 2.
# A lot of this code is adapted from the source code of the R package genotypeR
# that can be found here https://rdrr.io/cran/genotypeR/.
library(genotypeR)

marker_names<-make_marker_names(markers)

GT_table <- Ref_Alt_Table(marker_names)

colnames(GT_table)<-c("Alt","Ref","Ref_Alt","Alt_Ref","marker_names")

colnames(genos)[3:36]->GT_table$marker_names

genotypes_data_filtered <- genos[,c(1, 2, grep("TRUE",colnames(genos)%in%GT_table$marker_names))]

pass_through <- initialize_genotypeR_data(seq_data = genotypes_data_filtered,genotype_table = GT_table, output = "pass_through")

seq_split_list <- splitBy(~MARKER, data=genotypes(pass_through))

out <- vector(mode="list", length=length(names(seq_split_list)))

genotype_table<-GT_table


for(i in 1:length(names(seq_split_list))){
  ##test
  test_loop <- 0
  if(test_loop==1){
    i=1
  }
  
  ##marker name
  chr_to_get_from_genotype_table <- names(seq_split_list)[i]
  
  ##genotype based on marker name
  genotypes_from_table <- genotype_table[genotype_table$marker_names==chr_to_get_from_genotype_table,]
  
  marker_data_frame <- seq_split_list[[i]]
  marker_data_frame[marker_data_frame==0]<-NA
  
  marker_data_frame$GENOTYPE <- as.character(marker_data_frame$GENOTYPE) 
  
  # REQUEST 2 - Code genotypes as 0,1,2 in terms of brown alleles:
  # In 
  ##code homozygous Ref (brown) as 2
  marker_data_frame[grep(paste(genotypes_from_table[,"Ref"], genotypes_from_table[,"Ref"], sep=""), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "2"
  
  ##code heterozygous as 1
  toMatch <- genotypes_from_table[,c("Alt_Ref", "Ref_Alt")]
  ##exact match!!!
  toMatch <- paste("^", toMatch, "$", sep="")
  ##values for matching grabing the used markers...
  marker_data_frame[grep(paste(toMatch,collapse="|"), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "1"
  
  ##code homozygous Alt (white) as 0 
  #marker_data_frame[grep(paste("^", genotypes_from_table[,"Alt"], "$", sep=""), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "2"
  marker_data_frame[grep(paste(genotypes_from_table[,"Alt"], genotypes_from_table[,"Alt"], sep=""), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "0"
  
  out[[i]] <- marker_data_frame
  ###################################################################################################
  
  
}

out_cast <- dcast(data=do.call(rbind, out), SAMPLE_NAME+WELL~MARKER, value.var="GENOTYPE")

# Read the PC1 loading of spectrophometry analysis (N=59)
pheno<-read.table("phenotype_PC1_loading_spec_data.txt",header=T)

# REQUEST 1 - Let's multiply by -1 as requested by Tim
pheno$Spec1 <- pheno$Spec1 * -1 

# We use the PC1 and PC2 of the PCA analysis with 61 individuals to correct for population structure.
structure<-read.csv("PC1_PC2_minmaf0.05_61i.txt",header=F,sep="\t")
colnames(structure)<-c("SampleID","PC1","PC2")

######## Allelic 0,1,2 #########
out_cast<-data.frame(out_cast)

# This will restrict the dataset to the 59 phenotyped individuals:
out_cast_pheno<-merge(out_cast,pheno,by.x="SAMPLE_NAME",by.y="SAMPLE_NAME")

out_cast_pheno_struc<-merge(out_cast_pheno,structure,by.x="SAMPLE_NAME",by.y="SampleID")
nrow(out_cast_pheno_struc)
[1] 59

# Let's remove unnecessary columns
out_cast_pheno_struc$WELL<-NULL
out_cast_pheno_struc$State<-NULL

# Give column names
SNPs<-colnames(out_cast_pheno_struc)[2:35]

# And let's run the regressions in a loop:
n<-length(SNPs)

out_struct_corr_012<-data.frame(matrix(nrow=34,ncol=5))

colnames(out_cast_pheno_struc)[2:35]->rownames(out_struct_corr_012)

colnames(out_struct_corr_012)[1]<-"Spec1_pvalue"
colnames(out_struct_corr_012)[2]<-"Spec1_PVE"
colnames(out_struct_corr_012)[3]<-"Spec1_Beta"
colnames(out_struct_corr_012)[4]<-"Spec1_StdE"
colnames(out_struct_corr_012)[5]<-"Spec1_T-value"

# loop through SNPs:
for(i in 2:35){
  
  # Select SNP
  SNP<-colnames(out_cast_pheno_struc)[i]
  
  # Create temporary table
  tmp<-out_cast_pheno_struc[!is.na(out_cast_pheno_struc[,i]),]
  
  as.numeric(tmp[,i])->tmp[,i]
  
  # Run linear regression
  lm(tmp$Spec1~tmp[,i] + tmp$PC1 + tmp$PC2, data=tmp)->fit
  
  #Populate output
  out_struct_corr_012[SNP,1]<-summary(fit)$coefficients[2,4]
  out_struct_corr_012[SNP,2]<-summary(fit)$adj.r.squared
  out_struct_corr_012[SNP,3]<-summary(fit)$coefficients[2,1]
  out_struct_corr_012[SNP,4]<-summary(fit)$coefficients[2,2]
  out_struct_corr_012[SNP,5]<-summary(fit)$coefficients[2,3]
  
}

#write.table(out_struct_corr_012,file="linear_regression_results_all_phenotypes_ADD_130122.txt",col.names = T,row.names = T,sep="\t",quote=F)

####### Regression with all the SNPs ######

#"LTW_2_36361155","LTW_4_5424640","LTW_8_79701598"

top_SNPs<-out_cast_pheno_struc[,c("SAMPLE_NAME","LTW_2_36361155","LTW_4_5424640","LTW_8_79701598","Spec1","PC1","PC2")]

# We don't need to remove NAs, because there's no missing data for these SNPs

as.numeric(top_SNPs$LTW_2_36361155)->top_SNPs$LTW_2_36361155
as.numeric(top_SNPs$LTW_4_5424640)->top_SNPs$LTW_4_5424640
as.numeric(top_SNPs$LTW_8_79701598)->top_SNPs$LTW_8_79701598

# Frequency of brown alleles at top SNPs
colSums(top_SNPs[,c(2,3,4)])/(2*59)
LTW_2_36361155  LTW_4_5424640 LTW_8_79701598 
0.7033898      0.6271186      0.5762712

# A) Model with three top associated SNPS + genome-wide PC1 and PC2 
lm(top_SNPs$Spec1 ~ top_SNPs$LTW_4_5424640 + top_SNPs$LTW_8_79701598 + top_SNPs$LTW_2_36361155 + top_SNPs$PC1 + top_SNPs$PC2, data=top_SNPs)->fitA

summary(fitA)
summary(fitA)$coefficients

# B) Model with three top associated SNPS
lm(top_SNPs$Spec1~ top_SNPs$LTW_4_5424640 + top_SNPs$LTW_8_79701598 + top_SNPs$LTW_2_36361155, data=top_SNPs)->fitB

summary(fitB)
summary(fitB)$coefficients

# C) genome-wide PC1 and PC2 
lm(top_SNPs$Spec1~ top_SNPs$PC1 + top_SNPs$PC2, data=top_SNPs)->fitC

summary(fitC)
summary(fitC)$coefficients

# REQUEST 3 D) Could you run the model without the PCs, and only with corin and ednrb (I’m starting with just two loci for now). 
lm(top_SNPs$Spec1 ~ top_SNPs$LTW_8_79701598 + top_SNPs$LTW_2_36361155, data=top_SNPs)->fitD

summary(fitD)
summary(fitD)$coefficients

# REQUEST 3 E) P8, L3-4. The current full model (Table S12) only includes additive effects of all genes. 
# Would be nice to see a model that includes the Agouti * Corin interaction. It would probably give a 
# higher R^2 than what’s reported here. 
fitE <- lm(top_SNPs$Spec1 ~ top_SNPs$LTW_8_79701598 + top_SNPs$LTW_2_36361155 + top_SNPs$LTW_4_5424640 + top_SNPs$LTW_2_36361155:top_SNPs$LTW_4_5424640, data=top_SNPs)

summary(fitE)
summary(fitE)$coefficients

tableS11<-data.frame(summary(fitA)$coefficients)
tableS11[7,]<-data.frame(matrix(c(summary(fitA)$adj.r.squared,NA,NA,NA),ncol=4,nrow=1))
rownames(tableS11)[7]<-c("PVE_A")

tableS11<-rbind(tableS11,data.frame(summary(fitB)$coefficients))
tableS11[12,]<-data.frame(matrix(c(summary(fitB)$adj.r.squared,NA,NA,NA),ncol=4,nrow=1))
rownames(tableS11)[12]<-c("PVE_B")

tableS11<-rbind(tableS11,data.frame(summary(fitC)$coefficients))
tableS11[16,]<-data.frame(matrix(c(summary(fitC)$adj.r.squared,NA,NA,NA),ncol=4,nrow=1))
rownames(tableS11)[16]<-c("PVE_C")

tableS11<-rbind(tableS11,data.frame(summary(fitD)$coefficients))
tableS11[20,]<-data.frame(matrix(c(summary(fitD)$adj.r.squared,NA,NA,NA),ncol=4,nrow=1))
rownames(tableS11)[20]<-c("PVE_D")

tableS11<-rbind(tableS11,data.frame(summary(fitE)$coefficients))
tableS11[26,]<-data.frame(matrix(c(summary(fitD)$adj.r.squared,NA,NA,NA),ncol=4,nrow=1))
rownames(tableS11)[26]<-c("PVE_E")

colnames(tableS11)<-c("Estimate(Beta)","Std.Error","Tvalue","Pvalue")

write.table(tableS11,file="tableS11_281022.txt",col.names=T,row.names=T,sep="\t",quote=F)

####### Genotype and white allele frequencies ######

pheno_state<-read.table("binary_phenotype_state.txt",header=T)
pheno_state_genotype<-merge(pheno_state,out_cast,by.x="Sample",by.y="SAMPLE_NAME")

pheno_state_genotype<-pheno_state_genotype[,c("Sample","Color","State","LTW_2_36361155","LTW_4_5424640","LTW_8_79701598"),]

# We have 38 brown individuals from Colorado
pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="Brown") %>%
  summary(n=n())

# We have 41 white individuals from Colorado
pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="White") %>%
  summary(n=n())

# And 13 white individuals from outside Colorado
pheno_state_genotype %>%
  filter(State!="Colorado") %>%
  summary(n=n())

# Genotype frequencies in Brown individuals from Colorado:
pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="Brown") %>%
  tabyl(LTW_2_36361155) %>%
  pivot_wider(id_cols=c(LTW_2_36361155,percent), names_from=LTW_2_36361155,values_from=percent)-> Brown_Corin

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="Brown") %>%
  tabyl(LTW_4_5424640) %>%
  pivot_wider(id_cols=c(LTW_4_5424640,percent), names_from=LTW_4_5424640,values_from=percent)-> Brown_Agouti

# Add zero for WW genotype
Brown_Agouti[,"0"]<-0

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="Brown") %>%
  tabyl(LTW_8_79701598) %>%
  pivot_wider(id_cols=c(LTW_8_79701598,percent), names_from=LTW_8_79701598,values_from=percent)-> Brown_Ednrb

# Genotype frequencies in White individuals from Colorado:
pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="White") %>%
  tabyl(LTW_2_36361155) %>%
  pivot_wider(id_cols=c(LTW_2_36361155,percent), names_from=LTW_2_36361155,values_from=percent)-> White_Corin

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="White") %>%
  tabyl(LTW_4_5424640) %>% 
  pivot_wider(id_cols=c(LTW_4_5424640,percent), names_from=LTW_4_5424640,values_from=percent) -> White_Agouti

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="White") %>%
  tabyl(LTW_8_79701598) %>%
  pivot_wider(id_cols=c(LTW_8_79701598,percent), names_from=LTW_8_79701598,values_from=percent)-> White_Ednrb

# Genotype frequencies in White individuals from outside Colorado:
pheno_state_genotype %>%
  filter(State!="Colorado" & Color=="White") %>%
  tabyl(LTW_2_36361155) %>%
  pivot_wider(id_cols=c(LTW_2_36361155,percent), names_from=LTW_2_36361155,values_from=percent)-> White_Corin_notCO

pheno_state_genotype %>%
  filter(State!="Colorado" & Color=="White") %>%
  tabyl(LTW_4_5424640) %>% 
  pivot_wider(id_cols=c(LTW_4_5424640,percent), names_from=LTW_4_5424640,values_from=percent)-> White_Agouti_notCO

pheno_state_genotype %>%
  filter(State!="Colorado" & Color=="White") %>%
  tabyl(LTW_8_79701598) %>%
  pivot_wider(id_cols=c(LTW_8_79701598,percent), names_from=LTW_8_79701598,values_from=percent)-> White_Ednrb_notCO

# Genotype frequencies:
cbind(rbind(Brown_Ednrb,White_Ednrb,White_Ednrb_notCO),rbind(Brown_Corin,White_Corin,White_Corin_notCO),
      rbind(Brown_Agouti,White_Agouti,White_Agouti_notCO)) -> genotype_frequencies


# Brown allele frequencies

as.numeric(pheno_state_genotype[,4])->pheno_state_genotype[,4]
as.numeric(pheno_state_genotype[,5])->pheno_state_genotype[,5]
as.numeric(pheno_state_genotype[,6])->pheno_state_genotype[,6]

pheno_state_genotype %>%
  filter(State!="Colorado" & Color=="White") %>%
  summarise_at(vars(LTW_8_79701598,LTW_2_36361155,LTW_4_5424640),~sum(.x)/26)->allele_frequencies

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="White") %>%
  summarise_at(vars(LTW_8_79701598,LTW_2_36361155,LTW_4_5424640),~sum(.x)/82) %>%
  bind_rows(allele_frequencies) -> allele_frequencies

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="Brown") %>%
  summarise_at(vars(LTW_8_79701598,LTW_2_36361155,LTW_4_5424640),~sum(.x)/76) %>%
  bind_rows(allele_frequencies) -> allele_frequencies

cbind(allele_frequencies,genotype_frequencies) -> tableS12

write.table(tableS12,file="tableS12_130122.txt",sep="\t",quote=F,row.names = F,col.names=T)

####### Fisher exact tests ######

# Extract allele counts

pheno_state_genotype %>%
  filter(State!="Colorado" & Color=="White") %>%
  summarise_at(vars(LTW_8_79701598,LTW_2_36361155,LTW_4_5424640),list(~sum(.x),~sum(.x)*-1+26))->allele_counts

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="White") %>%
  summarise_at(vars(LTW_8_79701598,LTW_2_36361155,LTW_4_5424640),list(~sum(.x),~sum(.x)*-1+82)) %>%
  bind_rows(allele_counts) -> allele_counts

pheno_state_genotype %>%
  filter(State=="Colorado" & Color=="Brown") %>%
  summarise_at(vars(LTW_8_79701598,LTW_2_36361155,LTW_4_5424640),list(~sum(.x),~sum(.x)*-1+76)) %>%
  bind_rows(allele_counts) -> allele_counts

colnames(allele_counts)<-c("Ednrb_brown","Corin_brown","Agouti_brown",
                           "Ednrb_white","Corin_white","Agouti_white")

rownames(allele_counts)<-c("COBrown","COWhite","nonCOWhite")

stats::fisher.test(allele_counts[c("COBrown","COWhite"),c("Ednrb_white","Ednrb_brown")])->fs10
stats::fisher.test(allele_counts[c("COBrown","nonCOWhite"),c("Ednrb_white","Ednrb_brown")])->fs11
stats::fisher.test(allele_counts[c("COWhite","nonCOWhite"),c("Ednrb_white","Ednrb_brown")])->fs12

stats::fisher.test(allele_counts[c("COBrown","COWhite"),c("Corin_white","Corin_brown")])->fs13
stats::fisher.test(allele_counts[c("COBrown","nonCOWhite"),c("Corin_white","Corin_brown")])->fs14
stats::fisher.test(allele_counts[c("COWhite","nonCOWhite"),c("Corin_white","Corin_brown")])->fs15

stats::fisher.test(allele_counts[c("COBrown","COWhite"),c("Agouti_white","Agouti_brown"),])->fs16
stats::fisher.test(allele_counts[c("COBrown","nonCOWhite"),c("Agouti_white","Agouti_brown")])->fs17
stats::fisher.test(allele_counts[c("COWhite","nonCOWhite"),c("Agouti_white","Agouti_brown")])->fs18


pvalues_alleles <- data.frame(matrix(c(fs10$data.name,fs11$data.name,fs12$data.name,fs13$data.name,fs14$data.name,fs15$data.name,fs16$data.name,fs17$data.name,fs18$data.name,
                    fs10$p.value,fs11$p.value,fs12$p.value,fs13$p.value,fs14$p.value,fs15$p.value,fs16$p.value,fs17$p.value,fs18$p.value),ncol=2,nrow=9))

write.table(pvalues_alleles,"fisher_exact_test_pvalues_allele_counts_130121.txt",sep="\t",quote=F,col.names=F,row.names = F)
