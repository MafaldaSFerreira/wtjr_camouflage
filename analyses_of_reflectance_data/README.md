## Reflectance data analyses

We used R package [RCLRfolders 0.8](https://bobmontgomerie.wordpress.com/resources/analyzing-colours/) to process the output files of OCEANVIEW-U and convert them in a table that could be analyzed. This table is `DMNS_Ltownsendii_61indvs_tristimulus.txt`.I analyzed reflectance data for each body region separately in R with the code detailed bellow.

The R packages required for this code are:
- factoextra
- ggplots2
- dplyr
- tidyr
- reshape2
- ggrepel
- forcats

Read the input file.

```
table<-read.table("DMNS_Ltownsendii_61indvs_tristimulus.txt",header=T,sep="\t")
subtable=table
```

Select only reflectance measurements of interest and exclude ventral reflectance measurements. Convert into a matrix for PCA analysis.

```
subtable<-table[,c("File","B2","B3","S3","S6","S5c","H3","H4c")]
separate(subtable, File, into=c("Museum","Individual","Region","T","S"), sep = "_")->temp
temp$T<-NULL
temp$S<-NULL
temp$Sample<-paste(temp$Museum,temp$Individual,temp$Region,sep="_")
temp$Museum<-NULL
temp %>% gather(Parameter,Data,B2:H4c,-Region,-Individual)->temp
temp$Region_Par<-paste(temp$Region,temp$Parameter,sep="_")
temp<-temp[,c(1,5,6)]
acast(temp, Individual~Region_Par, value.var="Data")->matrix_subtable
rownames(matrix_subtable)<-unique(temp$Individual)

# this excludes ventral measurements.
matrix_subtable<-matrix_subtable[,c(1:42)]
matrix_subtable->m
rownames(m)<-rownames(matrix_subtable)
colnames(m)<-colnames(matrix_subtable)
```

Scale and centralize reflectance measurements and add coat color information to the table. The coat color information is a binary classification that was previously done for all individuals when they were sampled in the museum collections or in the field. This classification can be found in Table S4 and Data S3.

```
prcomp(m,scale=T,center=T)->pc
colors<-read.table("../DMNS_samples_color_classification",header=T)
rownames(colors)<-colors$DMNS
colors[rownames(pc$x),]->colors
```

Using `factoextra`, plot an histogram showing how much variance is explained by the PCA axis.

```
fviz_eig(pc, addlabels = TRUE)+
  theme(legend.position = "none",
        text=element_text(family="sans",size=15),
        axis.title.x = element_text(size = 15,colour="black",family="sans"),
        axis.title.y = element_text(size = 15,colour="black",family="sans"),
        axis.text.x = element_text(size=15,colour="black",family="sans"),
        axis.text.y = element_text(size=15,colour="black",family="sans"),
        legend.title = element_text(size=15,colour="black",family="sans"),
        legend.text = element_text(size = 15,colour="black",family="sans"))
```   

Also, plot an histogram showing the contribution of each reflectance parameter from each body region to PC1, PC2 and PC3.

```
fviz_contrib(pc, choice = "var", axes = 1, top = 28)
fviz_contrib(pc, choice = "var", axes = 2, top = 17)
fviz_contrib(pc, choice = "var", axes = 3, top = 17)
```

Finally, produce the biplot with PC1 and PC2.

```
data.frame(pc$x)->PCA_TO_PLOT
PCA_TO_PLOT$Sample<-rownames(PCA_TO_PLOT)
PCA_TO_PLOT<-merge(PCA_TO_PLOT,colors,by.x="Sample",by.y="DMNS")

ggplot(PCA_TO_PLOT, aes(x=PC1, y=PC2, colour=Binary,label=Sample)) +
  theme_classic() +
  geom_point(size = 4) +
  scale_color_manual(values=c("#69431A",'#c4b29d')) +
  #scale_color_manual(values=alpha(c("tan4","tan","tan","gray80","gray60","gray60"),1)) +
  xlab("PC1 (51%)") +
  ylab(paste0("PC2 (14.6%)"))+
  theme(legend.position = "none",
        text=element_text(family="sans",size=15),
        axis.title.x = element_text(size = 15,colour="black",family="sans"),
        axis.title.y = element_text(size = 15,colour="black",family="sans"),
        axis.text.x = element_text(size=15,colour="black",family="sans"),
        axis.text.y = element_text(size=15,colour="black",family="sans"),
        legend.title = element_text(size=15,colour="black",family="sans"),
        legend.text = element_text(size = 15,colour="black",family="sans"))+
  geom_hline(yintercept = 0,linetype="dashed",color="grey50")+
  geom_vline(xintercept = 0,linetype="dashed",color="grey50")
```

We can also produce a plot where each sample is ordered according to their PC1, PC2 or PC3 loading.

```
PCA_TO_PLOT %>%
  mutate(Sample = fct_reorder(Sample, PC3)) %>%
  ggplot( aes(x=PC3, y=Sample)) + 
  geom_boxplot() +
  theme_bw()+
  theme(axis.title.x = element_text(size = 15,colour="black",family="sans"),
  axis.title.y = element_text(size = 15,colour="black",family="sans"),
  axis.text.x = element_text(size=15,colour="black",family="sans"),
  axis.text.y = element_text(size=15,colour="black",family="sans"),
  legend.title = element_text(size=15,colour="black",family="sans"),
  legend.text = element_text(size = 15,colour="black",family="sans"))
```
