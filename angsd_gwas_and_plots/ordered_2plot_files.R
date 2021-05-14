# script to order the 2.plot.p file in order to produce
# a manhattan plot where scaffolds are ordered by length

args <- commandArgs(trailingOnly = TRUE)
p_table <- args[1]

order<-read.table("DMNS18807_06042020_pseudohap2.1_10k_order_correspondance.txt")

pnt_fst <- read.table(p_table, header = TRUE)
pnt_fst<-merge(pnt_fst,order,by.x="CHR",by.y="V1")
order(pnt_fst[,5],pnt_fst[,3])->ord
pnt_fst[ord,]->ordered_pnt_fst
ordered_pnt_fst$SNP<-seq(1,nrow(ordered_pnt_fst))
write.table(ordered_pnt_fst,file=paste0(p_table,"_reordered.txt"),row.names=F,col.names=T,quote=F)
