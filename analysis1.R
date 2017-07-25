#' produce heatmaps for each Category with subcat informations

rm(list = ls())

require(ggplot2)
require(RColorBrewer)
require(reshape2)
library(pander)

I46_orig <- read.csv2("data/I46_features.tsv.tsv", sep="\t", header=T)
I48_orig <- read.csv2("data/I48_features.tsv.tsv", sep="\t", header=T)
I49_orig <- read.csv2("data/I49_features.tsv.tsv", sep="\t", header=T)
KB18_orig <- read.csv2("data/KB18_DSMZ_features.tsv.tsv", sep="\t", header=T)
KB1_orig <- read.csv2("data/KB1_features.tsv.tsv", sep="\t", header=T)
YL27_orig <- read.csv2("data/YL27_features.tsv.tsv", sep="\t", header=T)
YL2_orig <- read.csv2("data/YL2_features.tsv.tsv", sep="\t", header=T)
YL31_orig <- read.csv2("data/YL31_features.tsv.tsv", sep="\t", header=T)
YL32_orig <- read.csv2("data/YL32_features.tsv.tsv", sep="\t", header=T)
YL44_orig <- read.csv2("data/YL44_features.tsv.tsv", sep="\t", header=T)
YL45_orig <- read.csv2("data/YL45_features.tsv.tsv", sep="\t", header=T)
YL58_orig <- read.csv2("data/YL58_features.tsv.tsv", sep="\t", header=T)

pval_mat <- data.frame(cat=unique(YL58_orig$Category), pval = 1)

for (cat in (unique(YL58_orig$Category))){
  if (cat == "Iron acquisition and metabolism"){
    next
  }
  
  if (cat == "Secondary Metabolism"){
    next
  }
  
  if (cat == "Motility and Chemotaxis"){
    next
  }
  
  print(cat)
  #cat <- "Amino Acids and Derivatives"
  I46 <- I46_orig[which(I46_orig$Category==cat),]
  I48 <- I48_orig[which(I48_orig$Category==cat),]
  I49 <- I49_orig[which(I49_orig$Category==cat),]
  KB1 <- KB1_orig[which(KB1_orig$Category==cat),]
  YL27 <- YL27_orig[which(YL27_orig$Category==cat),]
  YL2 <- YL2_orig[which(YL2_orig$Category==cat),]
  YL31 <- YL31_orig[which(YL31_orig$Category==cat),]
  YL32 <- YL32_orig[which(YL32_orig$Category==cat),]
  YL44 <- YL44_orig[which(YL44_orig$Category==cat),]
  YL45 <- YL45_orig[which(YL45_orig$Category==cat),]
  YL58 <- YL58_orig[which(YL58_orig$Category==cat),]
  
  I46_out <- I46_orig[which(I46_orig$Category!=cat),]
  I48_out <- I48_orig[which(I48_orig$Category!=cat),]
  I49_out <- I49_orig[which(I49_orig$Category!=cat),]
  KB1_out <- KB1_orig[which(KB1_orig$Category!=cat),]
  YL27_out <- YL27_orig[which(YL27_orig$Category!=cat),]
  YL2_out <- YL2_orig[which(YL2_orig$Category!=cat),]
  YL31_out <- YL31_orig[which(YL31_orig$Category!=cat),]
  YL32_out <- YL32_orig[which(YL32_orig$Category!=cat),]
  YL44_out <- YL44_orig[which(YL44_orig$Category!=cat),]
  YL45_out <- YL45_orig[which(YL45_orig$Category!=cat),]
  YL58_out <- YL58_orig[which(YL58_orig$Category!=cat),]
  
  I46$sample <- "I46"
  I48$sample <- "I48"
  I49$sample <- "I49"
  KB1$sample <- "KB1"
  YL27$sample <- "YL27"
  YL31$sample <- "YL31"
  YL32$sample <- "YL32"
  YL44$sample <- "YL44"
  YL45$sample <- "YL45"
  YL58$sample <- "YL58"
  
  YL27_t_out <- sum(as.data.frame(table(YL27_out$Subcategory))$Freq)
  YL45_t_out <- sum(as.data.frame(table(YL45_out$Subcategory))$Freq)
  YL44_t_out <- sum(as.data.frame(table(YL44_out$Subcategory))$Freq)
  YL32_t_out <- sum(as.data.frame(table(YL32_out$Subcategory))$Freq)
  I48_t_out <- sum(as.data.frame(table(I48_out$Subcategory))$Freq)
  YL58_t_out <- sum(as.data.frame(table(YL58_out$Subcategory))$Freq)
  YL31_t_out <- sum(as.data.frame(table(YL31_out$Subcategory))$Freq)
  I46_t_out <- sum(as.data.frame(table(I46_out$Subcategory))$Freq)
  I49_t_out <- sum(as.data.frame(table(I49_out$Subcategory))$Freq)
  KB1_t_out <- sum(as.data.frame(table(KB1_out$Subcategory))$Freq)
  
  YL27_t <- sum(as.data.frame(table(YL27$Subcategory))$Freq)
  YL45_t <- sum(as.data.frame(table(YL45$Subcategory))$Freq)
  YL44_t <- sum(as.data.frame(table(YL44$Subcategory))$Freq)
  YL32_t <- sum(as.data.frame(table(YL32$Subcategory))$Freq)
  I48_t <- sum(as.data.frame(table(I48$Subcategory))$Freq)
  YL58_t <- sum(as.data.frame(table(YL58$Subcategory))$Freq)
  YL31_t <- sum(as.data.frame(table(YL31$Subcategory))$Freq)
  I46_t <- sum(as.data.frame(table(I46$Subcategory))$Freq)
  I49_t <- sum(as.data.frame(table(I49$Subcategory))$Freq)
  KB1_t <- sum(as.data.frame(table(KB1$Subcategory))$Freq)
  
  YL27_t2 <- as.data.frame(table(YL27$Subcategory))
  YL45_t2 <- as.data.frame(table(YL45$Subcategory))
  YL44_t2 <- as.data.frame(table(YL44$Subcategory))
  YL32_t2 <- as.data.frame(table(YL32$Subcategory))
  I48_t2 <- as.data.frame(table(I48$Subcategory))
  YL58_t2 <- as.data.frame(table(YL58$Subcategory))
  YL31_t2 <- as.data.frame(table(YL31$Subcategory))
  I46_t2 <- as.data.frame(table(I46$Subcategory))
  I49_t2 <- as.data.frame(table(I49$Subcategory))
  KB1_t2 <- as.data.frame(table(KB1$Subcategory))
  
  
  depleted_case <- sum(YL27_t, YL45_t, YL44_t, YL32_t,I48_t )
  depleted_control <- sum(YL27_t_out, YL45_t_out, YL44_t_out, YL32_t_out, I48_t_out )
  
  intermediate_case <- sum(YL58_t, YL31_t, I46_t)
  intermediate_control <- sum(YL58_t_out, YL31_t_out, I46_t_out)
  
  enriched_case <- sum(I49_t, KB1_t )
  enriched_control <- sum(I49_t_out, KB1_t_out)
  
  mat <- matrix(c(depleted_case, intermediate_case, enriched_case,
                  depleted_control, intermediate_control, enriched_control), nrow=2, ncol=3, byrow=TRUE)
  
  test <- fisher.test(mat, simulate.p.value=TRUE,B=1e7)
  
  pval_mat[which(pval_mat$cat == cat),]$pval <- test$p.value
  
  # get sum of missing/complete
  #depleted.table <- sum(YL27_t$Freq) + sum(YL45_t$Freq) + sum(YL44_t$Freq)+ sum(YL32_t$Freq)+ sum(I48_t$Freq)
  #intermediate.table <- sum(YL58_t$Freq) + sum(YL31_t$Freq) + sum(I46_t$Freq)
  #enriched.table <- sum(I49_t$Freq) + sum(KB1_t$Freq)
  #mat <- rbind(depleted.table, intermediate.table, enriched.table)
  #chisq.test(mat) 
  
  I46_t2$sample <- "c_I46"
  I48_t2$sample <- "f_I48"
  I49_t2$sample <- "b_I49"
  KB1_t2$sample <- "a_KB1"
  YL27_t2$sample <- "j_YL27"
  YL31_t2$sample <- "d_YL31"
  YL32_t2$sample <- "g_YL32"
  YL44_t2$sample <- "h_YL44"
  YL45_t2$sample <- "i_YL45"
  YL58_t2$sample <- "e_YL58"
  
  df_count <- as.data.frame(rbind(YL27_t2, YL45_t2, YL44_t2, YL32_t2, I48_t2, YL58_t2, YL31_t2,
                                  I46_t2, I49_t2, KB1_t2))
  df_count <- df_count[which(df_count$Freq > 0),]
  
  df <- dcast(data = df_count,formula = sample~ Var1,fun.aggregate = sum,value.var = "Freq")
  samples <- df$sample
  df$sample <- NULL 
  
  d <- melt(df_count)
  d$z_bin <- cut(d$value, breaks = c(1, 20, 40, 60, 80, 100, 120,140,160, 180))
  base_size <- 10
  
  p <- ggplot(d, aes(sample, reorder(Var1, value)) )
  p <- p + geom_tile(aes(fill = z_bin)) + coord_equal()
  p <- p + ggtitle(paste0(cat, " (",test$p.value,")"))
  p <- p +  theme(axis.text.y   = element_text(size=14),
                  axis.text.x   = element_text(size=14),
                  axis.title.y  = element_text(size=14),
                  axis.title.x  = element_text(size=14),
                  panel.background = element_blank(),
                  panel.grid.major = element_blank(), 
                  panel.grid.minor = element_blank(),
                  axis.line = element_line(colour = "black"),
                  panel.border = element_rect(colour = "black", fill=NA, size=1.2)
  )
  
  p <- p + theme_minimal(base_size = base_size) + scale_fill_brewer(palette = "YlGnBu", direction = 1)
  
  pdf(paste0("analysis1/heatmap_category_", cat,".pdf"))
  print(p)
  dev.off()
}

pval_mat$fdr <- NULL
pval_mat$fdr <- p.adjust(pval_mat$pval, method="fdr")
pval_mat$stars <- add.significance.stars(pval_mat$fdr)

write.table(pval_mat, file="analysis1/pval_category.txt", sep='\t', row.names = F, quote = F)