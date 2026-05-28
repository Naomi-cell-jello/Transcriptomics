setwd("C:/Users/Naomi Guichelaar/OneDrive/BT jaar 2/periode 4/Casus Transcriptomics")
install.packages("BiocManager")
library(BiocManager)
BiocManager::install("Rsubread")
library(Rsubread)

#indexeren
#Genome assembly GRCh38.p14
buildindex(basename = 'ref_reuma',reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna', memory = 8000, indexSplit = TRUE)

#mapping
align.normaal1 <- align(index = "ref_reuma", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 ="SRR4785819_2_subset40k.fastq", output_file = "normaal1.BAM")
align.normaal2 <- align(index = "ref_reuma", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 ="SRR4785820_2_subset40k.fastq", output_file = "normaal2.BAM")
align.normaal3 <- align(index = "ref_reuma", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 ="SRR4785828_2_subset40k.fastq", output_file = "normaal3.BAM")
align.normaal4 <- align(index = "ref_reuma", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 ="SRR4785831_2_subset40k.fastq", output_file = "normaal4.BAM")
align.reuma1 <- align(index = "ref_reuma", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 ="SRR4785979_2_subset40k.fastq", output_file = "reuma1.BAM")
align.reuma2 <- align(index = "ref_reuma", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 ="SRR4785980_2_subset40k.fastq", output_file = "reuma2.BAM")
align.reuma3 <- align(index = "ref_reuma", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 ="SRR4785986_2_subset40k.fastq", output_file = "reuma3.BAM")
align.reuma4 <- align(index = "ref_reuma", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 ="SRR4785988_2_subset40k.fastq", output_file = "reuma4.BAM")

#count matrix
allesamples =c("normaal1.BAM", "normaal2.BAM", "normaal3.BAM", "normaal4.BAM", "reuma1.BAM", "reuma2.BAM", "reuma3.BAM", "reuma4.BAM")
count_matrix <- featureCounts(files = allesamples, annot.ext = "genomic.gtf",
                              isPairedEnd = TRUE,isGTFAnnotationFile = TRUE,
                              GTF.attrType = "gene_id",useMetaFeatures = TRUE)
str(count_matrix)
counts=count_matrix$counts
head(counts)
colnames(counts)=c("normaal1", "normaal2", "normaal3", "normaal4", "reuma1", "reuma2", "reuma3", "reuma4")
head(counts)
write.csv(counts, "reuma_countmatrix.csv")
counts=count_matrix_RA
aBiocManager::install("DESeq2")
BiocManager::install("KEGGREST")
BiocManager::install("EnhancedVolcano")
BiocManager::install("pathview")

library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)

#metadata
treatment=c("controle", "controle ", "controle", "controle", "reuma", "reuma", "reuma", "reuma")
treatment_table=data.frame(treatment)
rownames(treatment_table)=c("SRR4785819","SRR4785820","SRR4785828","SRR4785831"	,"SRR4785979"	,"SRR4785980",	"SRR4785986",	"SRR4785988")

#inladen countmatrix
count_matrix2<-read.table("count_matrix_RA.txt", header=TRUE)


#DESeqDataSet aanmaken
dds=DESeqDataSetFromMatrix(countData=count_matrix2, colData=treatment_table, design=~ treatment)
dds=DESeq(dds)
resultaten=results(dds)
write.table(resultaten, file="ResultatenCasus.csv", row.names=TRUE, col.names=TRUE)


#aantal genen tellen die differentieel tot expressie komen
sum(resultaten$padj<0.05 & resultaten$log2FoldChange > 1, na.rm=TRUE)
sum(resultaten$padj<0.05 & resultaten$log2FoldChange < -1, na.rm=TRUE)

#wat zijn de opvallendste genen?
hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]
#hoogste_fold_change: zet de genen met de sterkste opregulatie bovenaan.
#laagste_fold_change: zet de genen met de sterkste neerregulatie bovenaan.
#laagste_p_waarde: zet de genen met de meest significante p-waarden bovenaan.

#volcano plot - moet nog verduidelijking voor de casus
EnhancedVolcano(resultaten,lab = rownames(resultaten),x = 'log2FoldChange',y = 'padj', title="Volcano plot van differentiele gen expressie")
ggsave("volcano_plot.png", width=8, height = 6, dpi=300)

#GO-analyse 

BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("DOSE")

library(clusterProfiler)
library(org.Hs.eg.db)
library(DOSE)
sig_genes <- resultaten[resultaten$padj < 0.05, ]

#GO-analyse
#Significante genen als lijst maken
genen_list <- rownames(sig_genes)

#gen-namen omzetten naar ID-systeem
gene_df <- bitr(genen_list,
                fromType = "SYMBOL",
                toType = "ENTREZID",
                OrgDb = org.Hs.eg.db)

#Welke genen komen vaker voor in mijn genen dan je normaal verwacht:
ego <- enrichGO(
   gene = gene_df$ENTREZID,
   OrgDb = org.Hs.eg.db,
   ont = "BP", 
   pvalueCutoff = 0.05,
   readable = TRUE)

#dotplotmaken
dotplot(ego, showCategory = 10)+scale_y_discrete(labels = function(x) 
  str_wrap(x, width = 40)) +labs(title = "Verrijking GO-proces bij reumatoïde artritis") +theme(axis.text.y = element_text(size = 9),plot.margin = margin(10, 10, 10, 40))


#plot opslaan
ggsave("GO_plot.png", width = 12, height = 8, dpi = 300)

#KEGG pathways


#genen_list vergelijken met KEGG pathways
kegg <- enrichKEGG(
  gene = gene_df$ENTREZID,
  organism = "hsa",
  pvalueCutoff = 0.05)

#omzetten naar data frame
kegg_df <- as.data.frame(kegg)

#percentage berekenen
kegg_df$Percentage <- (kegg_df$Count / sum(kegg_df$Count)) * 100

#sorteren
kegg_df <- kegg_df[order(kegg_df$Percentage, decreasing = TRUE), ]
top10 <- head(kegg_df, 10)


#plot maken
ggplot(top10, aes(x = Percentage, 
                 y = reorder(Description, Percentage))) +
  geom_point(aes(size = Count, color = p.adjust)) +
  scale_color_gradient(low = "pink", high = "darkolivegreen4") +
  ylab("Pathway") +
  xlab("Percentage of genes (%)") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10)) +
  labs(title = "KEGG Pathways Analysis in Rheumatoid Arthritis")


#opslaan
ggsave("kegg_pathway_plot.png", width = 8, height = 6, dpi = 300)






