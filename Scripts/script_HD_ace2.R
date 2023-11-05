#!/usr/local/bin/Rscript

## Working directory
#setwd("~/Desktop/Drug_Development/R_code")


## Libraries
library(dplyr)
library(ggplot2)
library(ggpubr)

df <- read.csv("~/Documents/GitHub/SARS-CoV-2_BA.2.86_Spike-RBD_Predictions/FinalTables/ACE2_HADDOCK_FINAL.csv")
variant_comparisons <- combn(c("WT", "XBB.1.5", "BA.2", "BA.1", "BA.2.86"), 2, simplify = FALSE)
var_order <- c('WT', 'BA.1', 'BA.2', 'XBB.1.5', 'BA.2.86') 

#pdf("had_boxplot.pdf")
#garbage <- dev.off()

#Create boxplot for HADDOCK Scores
had_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "HADDOCK.score",
                         ylab="HADDOCK Score",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF0000", "#0000FF", "#008000", "#FFA500","#FF00FF"),
                         add = "dotplot") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox") +
  stat_compare_means(label.y = -160) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant")
#had_boxplot + ggtitle("HADDOCK Score vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for Van der Waals Energy
vdw_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Van.der.Waals.energy",
                         ylab="Van der Waals Energy",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF0000", "#0000FF", "#008000", "#FFA500","#FF00FF"),
                         add = "dotplot") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox") +
  stat_compare_means(label.y = -100) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant")
#vdw_boxplot + ggtitle("Van der Waals Energy vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplit for Electrostatic Energy
ee_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Electrostatic.energy",
                         ylab="Electrostatic Energy",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF0000", "#0000FF", "#008000", "#FFA500","#FF00FF"),
                         add = "dotplot") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox") +
  stat_compare_means(label.y = -500) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant")
#ee_boxplot + ggtitle("Electrostatic Energy vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for Desolvation Energy
de_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Desolvation.energy",
                         ylab="Desolvation Energy",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF0000", "#0000FF", "#008000", "#FFA500","#FF00FF"),
                         add = "dotplot") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox") +
  stat_compare_means(label.y = -50) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant")
#de_boxplot + ggtitle("Desolvation Energy vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for Buried Surface Area
bsa_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "Buried.Surface.Area",
                         ylab="Buried Surface Area",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF0000", "#0000FF", "#008000", "#FFA500","#FF00FF"),
                         add = "dotplot") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox") +
  stat_compare_means(label.y = 1200) + 
  aes(x = factor(Variant, level = var_order)) + xlab("Variant")
#bsa_boxplot + ggtitle("Buried Surface Area vs Variant") + theme(plot.title = element_text(hjust = 0.5))

#Create boxplot for PRODIGY Predicted deltaG
pro_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "prodigy_deltaG_kcalpermol",
                         ylab= "PRODIGY Predicted \u0394G\n Kcal/mol",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#FF0000", "#0000FF", "#008000", "#FFA500","#FF00FF"),
                         add = "dotplot") + 
  stat_compare_means(comparisons = variant_comparisons, method = "wilcox") +
  stat_compare_means(label.y = -16) + 
  aes(x = factor(Variant, level = var_order)) + labs(x="Variant", y=expression("PRODIGY Predicted "*Delta*"G Kcal/mol"))
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

ggsave(all_boxplots, filename = "ace2_boxplots.pdf", device = "pdf", height = 11, width = 8.5, dpi = 300, units = "in")
