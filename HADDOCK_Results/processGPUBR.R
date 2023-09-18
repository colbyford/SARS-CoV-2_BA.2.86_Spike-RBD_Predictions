# Load data
library("ggplot2")
library("ggpubr")
df <- read.csv("/Users/syasa/Desktop/Research/BA.2.86/HADDOCK_Results.csv")
variant_comparisons <- combn(c("BA.1", "BA.2", "BA.2.86", "XBB.1.5","WT"), 2, simplify = FALSE)
had_boxplot <- ggboxplot(df, x = "Variant",
                         y = "HADDOCK.score",
                         ylab="HADDOCK Score",
                         xlab = "Variant",
                         color = "Variant",
                         palette =c("#00AFBB", "#E7B800", "#FC4E07", "#ADD8E6","#000000"),
                         add = "dotplot")+ 
  stat_compare_means(method = "kruskal.test", comparisons = variant_comparisons)
had_boxplot

variant_comparisons

