#!/usr/local/bin/Rscript

## Working directory
#setwd("~/Desktop/Projects/Drug_Development/R_code")


## Libraries
library(dplyr)
library(ggplot2)
library(ggpubr)

df <- read.csv("HADDOCK_Results_FINAL.csv")
variant_comparisons <- combn(c("WT", "XBB.1.5", "BA.2", "BA.1/B.1.1.529", "BA.2.86", "JN.1"), 2, simplify = FALSE)
var_order <- c('WT', 'BA.1/B.1.1.529', 'BA.2', 'XBB.1.5', 'BA.2.86', 'JN.1') 

# Create controls subset and add them to boxplots
## controls <- df[df$Antibody.Name %in% c('C105','C102','COVOX150', 'LYCOV555', 'LYCOV1404'),]
## geom_dotplot(data = controls, binaxis = "y", stackdir = "center", color = "#000000")

#Create boxplot for HADDOCK Scores
had_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "HADDOCK.score",
                         ylab="HADDOCK Score",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF00FF", "#FF0000", "#FFA500", "#008000","#0000FF", "#5d02bf"),
                         add = "dotplot") + 
  #geom_dotplot(data = controls, binaxis = "y", stackdir = "center", color = "#000000") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox", tip.length = 0.01, vjust = 0.3) +
  stat_compare_means(label.y = -180) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant") + 
  theme(axis.text.x = element_text(angle = 10, vjust = 0.7, hjust= 0.5))
#had_boxplot + ggtitle("HADDOCK Score vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for Van der Waals Energy
vdw_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Van.der.Waals.energy",
                         ylab="Van der Waals Energy",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF00FF", "#FF0000", "#FFA500", "#008000","#0000FF", "#5d02bf"),
                         add = "dotplot") + 
  #geom_dotplot(data = controls, binaxis = "y", stackdir = "center", color = "#000000") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox", tip.length = 0.01, vjust = 0.3) +
  stat_compare_means(label.y = -110) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant") + 
  theme(axis.text.x = element_text(angle = 10, vjust = 0.7, hjust=0.5))
#vdw_boxplot + ggtitle("Van der Waals Energy vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplit for Electrostatic Energy
ee_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Electrostatic.energy",
                         ylab="Electrostatic Energy",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF00FF", "#FF0000", "#FFA500", "#008000","#0000FF", "#5d02bf"),
                         add = "dotplot") + 
  #geom_dotplot(data = controls, binaxis = "y", stackdir = "center", color = "#000000") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox", tip.length = 0.01, vjust = 0.3) +
  stat_compare_means(label.y = -500) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant") + 
  theme(axis.text.x = element_text(angle = 10, vjust = 0.7, hjust=0.5))
#ee_boxplot + ggtitle("Electrostatic Energy vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for Desolvation Energy
de_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Desolvation.energy",
                         ylab="Desolvation Energy",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF00FF", "#FF0000", "#FFA500", "#008000","#0000FF", "#5d02bf"),
                         add = "dotplot") + 
  #geom_dotplot(data = controls, binaxis = "y", stackdir = "center", color = "#000000") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox", tip.length = 0.01, vjust = 0.3) +
  stat_compare_means(label.y = -50) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant") + 
  theme(axis.text.x = element_text(angle = 10, vjust = 0.7, hjust=0.5))
#de_boxplot + ggtitle("Desolvation Energy vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for Buried Surface Area
bsa_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Buried.Surface.Area",
                         ylab="Buried Surface Area",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF00FF", "#FF0000", "#FFA500", "#008000","#0000FF", "#5d02bf"),
                         add = "dotplot") + 
  #geom_dotplot(data = controls, binaxis = "y", stackdir = "center", color = "#000000") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox", tip.length = 0.01, vjust = 0.3) +
  stat_compare_means(label.y = 500) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant") + 
  theme(axis.text.x = element_text(angle = 10, vjust = 0.7, hjust=0.5))
#bsa_boxplot + ggtitle("Buried Surface Area vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for PRODIGY Predicted deltaG
pro_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "prodigy_deltaG_kcalpermol",
                         ylab="PRODIGY Predicted \u0394G\n Kcal/mol",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF00FF", "#FF0000", "#FFA500", "#008000","#0000FF", "#5d02bf"),
                         add = "dotplot") + 
  #geom_dotplot(data = controls, binaxis = "y", stackdir = "center", color = "#000000") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox", tip.length = 0.01, vjust = 0.3) +
  stat_compare_means(label.y = -18) + 
  aes(x = factor(Variant, level = var_order)) + 
  labs(x="Variant", y=expression("PRODIGY Predicted "*Delta*"G Kcal/mol")) + 
  theme(axis.text.x = element_text(angle = 10, vjust = 0.7, hjust=0.5))
#pro_boxplot + ggtitle("PRODIGY Predicted \u0394G vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Show all boxplots in one single table and save to image
all_boxplots <- ggarrange(had_boxplot, 
          vdw_boxplot, 
          ee_boxplot, 
          de_boxplot, 
          bsa_boxplot, 
          pro_boxplot, 
          ncol=2, nrow=3, 
          labels = c("A", "B", "C", "D", "E", "F"), 
          common.legend = TRUE, legend="bottom")

ggsave(all_boxplots, filename = "antibodies_boxplots.pdf", device = "pdf", height = 11.5, width = 9, dpi = 300, units = "in", scale = 1.25)
