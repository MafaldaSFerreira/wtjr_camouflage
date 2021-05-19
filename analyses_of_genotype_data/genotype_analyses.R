library(genotypeR)
library(doBy)
library(reshape2)


# Read input file with genotype data for 34 SNPs
genos<-read.table("genotypes.txt",header=T)
# This is a file with the names of each SNP.
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
  
  ##code homozygous Ref as 0
  marker_data_frame[grep(paste(genotypes_from_table[,"Ref"], genotypes_from_table[,"Ref"], sep=""), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "0"
  
  ##code heterozygous as 1
  toMatch <- genotypes_from_table[,c("Alt_Ref", "Ref_Alt")]
  ##exact match!!!
  toMatch <- paste("^", toMatch, "$", sep="")
  ##values for matching grabing the used markers...
  marker_data_frame[grep(paste(toMatch,collapse="|"), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "1"
  
  ##code homozygous Ref as 2
  #marker_data_frame[grep(paste("^", genotypes_from_table[,"Alt"], "$", sep=""), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "2"
  marker_data_frame[grep(paste(genotypes_from_table[,"Alt"], genotypes_from_table[,"Alt"], sep=""), marker_data_frame[,"GENOTYPE"]),"GENOTYPE"] <- "2"
  
  out[[i]] <- marker_data_frame
  ###################################################################################################
  
  
}

out_cast <- dcast(data=do.call(rbind, out), SAMPLE_NAME+WELL~MARKER, value.var="GENOTYPE")

# Read the PC1 loading of spectrophometry analysis (N=59)
pheno<-read.table("phenotype_PC1_loading_spec_data.txt",header=T)

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

write.table(out_struct_corr_012,file="linear_regression_results_all_phenotypes_ADD.txt",col.names = T,row.names = T,sep="\t",quote=F)

### Regression with all the SNPs

"LTW_2_36361155","LTW_4_5424640","LTW_8_79701598"

top_SNPs<-out_cast_pheno_struc[,c("SAMPLE_NAME","LTW_2_36361155","LTW_4_5424640","LTW_8_79701598","Spec1","PC1","PC2")]

# We don't need to remove NAs, because there's no missing data for these SNPs

as.numeric(top_SNPs$LTW_2_36361155)->top_SNPs$LTW_2_36361155
as.numeric(top_SNPs$LTW_4_5424640)->top_SNPs$LTW_4_5424640
as.numeric(top_SNPs$LTW_8_79701598)->top_SNPs$LTW_8_79701598

# A) Model with three top associated SNPS + genome-wide PC1 and PC2 
lm(top_SNPs$Spec1~ + top_SNPs$LTW_4_5424640 + top_SNPs$LTW_8_79701598 + top_SNPs$LTW_2_36361155 + top_SNPs$PC1 + top_SNPs$PC2, data=top_SNPs)->fit

summary(fit)
summary(fit)$coefficients

# B) Model with three top associated SNPS
lm(top_SNPs$Spec1~ + top_SNPs$LTW_4_5424640 + top_SNPs$LTW_8_79701598 + top_SNPs$LTW_2_36361155, data=top_SNPs)->fit

summary(fit)
summary(fit)$coefficients

# C) genome-wide PC1 and PC2 
lm(top_SNPs$Spec1~ + top_SNPs$PC1 + top_SNPs$PC2, data=top_SNPs)->fit

summary(fit)
summary(fit)$coefficients