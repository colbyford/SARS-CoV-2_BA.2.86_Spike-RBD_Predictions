## Load data
library(dplyr)
library(ggplot2)
library(ggpubr)

# df <- read.csv("/Users/syasa/Desktop/Research/BA.2.86/HADDOCK_Results.csv")
df <- read.csv("HADDOCK_Results.csv")
variant_comparisons <- combn(c("WT", "XBB.1.5", "BA.2", "BA.1", "BA.2.86"), 2, simplify = FALSE)

had_boxplot <- ggboxplot(df,
                         x = "Variant",
                         y = "HADDOCK.score",
                         ylab="HADDOCK Score",
                         xlab = "Variant",
                         color = "Variant",
                         palette = c("#00AFBB", "#E7B800", "#FC4E07", "#ADD8E6","#000000"),
                         add = "dotplot") + 
  stat_compare_means(comparisons = variant_comparisons) +
  stat_compare_means(label.y = -150)
  
had_boxplot

variant_comparisons



# kruskal.test(HADDOCK.score ~ Variant, data = df %>% filter(Variant %in% c("WT", "BA.2.86")))
