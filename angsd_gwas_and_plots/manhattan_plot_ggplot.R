########################################################
# R script that will plot a manhatan plot from ANGSD results.
# First argument: The output of lrt2plot_v2.py or lrt2plot_v3.py
# Second argument: The name of the output file
# Third argument: The -log10(P value) threshold to plot a dashed line in the plot
# For example, I counted the number of SNPs in my output files and used the formula:
# -log10(0.05/ No. of SNPs) = Threshold
# to calculate the Threshold.
# Writen by Mafalda S. Ferreira
########################################################

library(ggplot2)
library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
p_table <- args[1]
output_image <- args[2]
thr <- as.numeric(args[3])

gwas.dat<-read.table(p_table,header=T)

nCHR <- length(unique(gwas.dat$CHR))
gwas.dat$BPcum <- NA
s <- 0
nbp <- c()
for (i in unique(gwas.dat$CHR)){
  nbp[i] <- max(gwas.dat[gwas.dat$CHR == i,]$BP)
  gwas.dat[gwas.dat$CHR == i,"BPcum"] <- gwas.dat[gwas.dat$CHR == i,"BP"] + s
  s <- s + nbp[i]
}

axis.set <- gwas.dat %>% 
  group_by(CHR) %>% 
  summarize(center = (max(BPcum) + min(BPcum)) / 2)

tiff(output_image, width = 3000, height = 500, units = "px", res = 300)

ggplot(gwas.dat, aes(x = BPcum, y = P,color = as.factor(V2))) +
  geom_point(size=1)+
  scale_color_manual(values = rep(c("gray10", "gray50"), nCHR))+
  geom_hline(yintercept = thr, color = "grey40", linetype = "dashed")+
  theme_bw()+
  ylim(0,25)+
  scale_x_continuous(label = axis.set$CHR, breaks = axis.set$center) +
  ylab("-log10(pvalue)") +
  theme(legend.position = "none",
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())+
  theme(panel.border = element_blank()) +
  theme(axis.line = element_line(colour = "black")) +
  theme(axis.text.y = element_text(colour="grey10",size=10),
        axis.title.y = element_text(colour="black",size=10),
        axis.text.x = element_blank(),
        axis.title.x = element_blank(),
        axis.ticks.x=element_blank())

dev.off()