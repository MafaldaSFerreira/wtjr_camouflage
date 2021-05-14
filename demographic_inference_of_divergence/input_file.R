
coordinates<-read.table("gene_coordinates_ENSEMBL_OryCun2_18April20.txt",skip = 1)
colnames(coordinates)<-c("Gene_ID","Chromosome","Start","End")

# remove scaffolds, chromosome X and MT (I'm sure there's a better way to do this but oh well)
coordinates<-subset(coordinates,coordinates$Chromosome==1 | 
                      coordinates$Chromosome==2 |
                      coordinates$Chromosome==3 |
                      coordinates$Chromosome==4 |
                      coordinates$Chromosome==5 |
                      coordinates$Chromosome==6 | 
                      coordinates$Chromosome==7 | 
                      coordinates$Chromosome==8 | 
                      coordinates$Chromosome==9 | 
                      coordinates$Chromosome==10 |
                      coordinates$Chromosome==11 |
                      coordinates$Chromosome==12 |
                      coordinates$Chromosome==13 | 
                      coordinates$Chromosome==14 | 
                      coordinates$Chromosome==15 | 
                      coordinates$Chromosome==16 |
                      coordinates$Chromosome==17 | 
                      coordinates$Chromosome==18 |
                      coordinates$Chromosome==19 |
                      coordinates$Chromosome==20 |
                      coordinates$Chromosome==21 )

# export a bed file to use with bedtools complement:
head(coordinates)
bedinput<-coordinates[,c(2,3,4)]
bedinput$Start<-bedinput$Start-1
bedinput[order(bedinput[,1],bedinput[,2]),]->bedinput

write.table(bedinput,file="gene_coordinates_ENSEMBL_OryCun2_18April20.bed",col.names=F,row.names=F,quote=F,sep="\t")

# readtable
library(dplyr)
intergenic<-read.table("rabbit_intergenic.bed",header=F)
colnames(intergenic)<-c("chr","start","end")

#format bed file: add (+) 1000 bp to start and subtract (-) 1000 bp from the end

m <- mutate(intergenic, stert_n = start + 1000, end_n = end - 1000)

# extract regions >=1000bp
subset(m,m$end_n-m$stert_n>=1000)->m_1000

write.table(m_1000,file="rabbit_intergenic_larger1Kb_1kbfromgenes.bed",col.names=F,row.names=F,quote=F,sep="\t")


