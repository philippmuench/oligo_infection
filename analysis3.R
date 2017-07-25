
rm(list = ls())
set.seed(123)
require(ggplot2)
require(RColorBrewer)
require(reshape2)

I46 <- read.csv2("data/I46_features.tsv.tsv", sep="\t", header=T)
I48 <- read.csv2("data/I48_features.tsv.tsv", sep="\t", header=T)
I49 <- read.csv2("data/I49_features.tsv.tsv", sep="\t", header=T)
KB18 <- read.csv2("data/KB18_DSMZ_features.tsv.tsv", sep="\t", header=T)
KB1 <- read.csv2("data/KB1_features.tsv.tsv", sep="\t", header=T)
YL27 <- read.csv2("data/YL27_features.tsv.tsv", sep="\t", header=T)
YL2 <- read.csv2("data/YL2_features.tsv.tsv", sep="\t", header=T)
YL31 <- read.csv2("data/YL31_features.tsv.tsv", sep="\t", header=T)
YL32 <- read.csv2("data/YL32_features.tsv.tsv", sep="\t", header=T)
YL44 <- read.csv2("data/YL44_features.tsv.tsv", sep="\t", header=T)
YL45 <- read.csv2("data/YL45_features.tsv.tsv", sep="\t", header=T)
YL58 <- read.csv2("data/YL58_features.tsv.tsv", sep="\t", header=T)

I46$sample <- "I46"
I48$sample <- "I48"
I49$sample <- "I49"
KB18$sample <- "KB18"
KB1$sample <- "KB1"
YL27$sample <- "YL27"
YL2$sample <- "YL2"
YL31$sample <- "YL31"
YL32$sample <- "YL32"
YL44$sample <- "YL44"
YL45$sample <- "YL45"
YL58$sample <- "YL58"


YL2_t <-as.data.frame(table(YL2$Subcategory))
YL27_t <-as.data.frame(table(YL27$Subcategory))
YL45_t <-as.data.frame(table(YL45$Subcategory))
YL44_t <-as.data.frame(table(YL44$Subcategory))
YL32_t <-as.data.frame(table(YL32$Subcategory))
I48_t <-as.data.frame(table(I48$Subcategory))
YL58_t <-as.data.frame(table(YL58$Subcategory))
YL31_t <-as.data.frame(table(YL31$Subcategory))
I46_t <-as.data.frame(table(I46$Subcategory))
I49_t <-as.data.frame(table(I49$Subcategory))
KB1_t <-as.data.frame(table(KB1$Subcategory))
KB18_t <-as.data.frame(table(KB18$Subcategory))

I46_t$sample <- "I46"
I48_t$sample <- "I48"
I49_t$sample <- "I49"
KB18_t$sample <- "KB18"
KB1_t$sample <- "KB1"
YL27_t$sample <- "YL27"
YL2_t$sample <- "YL2"
YL31_t$sample <- "YL31"
YL32_t$sample <- "YL32"
YL44_t$sample <- "YL44"
YL45_t$sample <- "YL45"
YL58_t$sample <- "YL58"

df_count <- as.data.frame(rbind(YL27_t, YL45_t, YL44_t, YL32_t, I48_t, YL58_t, YL31_t, I46_t, I49_t, KB1_t))

df <- dcast(data = df_count,formula = sample~ Var1,fun.aggregate = sum,value.var = "Freq")
samples <- df$sample
df$sample <- NULL 

#df_norm <- t(apply(df, 1, function(x)(x-min(x))/(max(x)-min(x))))
y<-c(-2, # I46
     -110, # I48
     12, # I49
     14, # KB1
     -1366, # YL27
     -2, # YL31
     -283, # YL32
     -639, # YL44
     -1252, # YL45
     -8) # YL58

library(randomForest)
rf <- randomForest(df, y, ntree=1000, importance=TRUE)

RF.pr = predict(rf,df)
plot(RF.pr, y)
abline(c(0,1),col=2)

varImpPlot(rf)

### predict

p1 <- read.csv2("data/outgroup/ASF457.tsv", sep="\t", header=T)
p2 <- read.csv2("data/outgroup/14961.tsv", sep="\t", header=T)
p3 <- read.csv2("data/outgroup/2890142.tsv", sep="\t", header=T)
p4 <- read.csv2("data/outgroup/3164353.tsv", sep="\t", header=T)
p5 <- read.csv2("data/outgroup/562374.tsv", sep="\t", header=T)
p6 <- read.csv2("data/outgroup/8171.tsv", sep="\t", header=T)

p1_t <-as.data.frame(table(p1$Subcategory))
p2_t <-as.data.frame(table(p2$Subcategory))
p3_t <-as.data.frame(table(p3$Subcategory))
p4_t <-as.data.frame(table(p4$Subcategory))
p5_t <-as.data.frame(table(p5$Subcategory))
p6_t <-as.data.frame(table(p6$Subcategory))

p1_t$sample <- "ASF"
p2_t$sample <- "14961.tsv"
p3_t$sample <- "2890142.tsv"
p4_t$sample <- "3164353.tsv"
p5_t$sample <- "562374.tsv"
p6_t$sample <- "8171.tsv"

test_count <- as.data.frame(rbind(YL27_t, YL45_t, YL44_t, YL32_t, I48_t, YL58_t, YL31_t, I46_t, I49_t, KB1_t, p1_t, p2_t, p3_t, p4_t, p5_t, p6_t))
test <- dcast(data = test_count,formula = sample~ Var1,fun.aggregate = sum,value.var = "Freq")

test2 <- test[-c(7, 8, 9, 10, 11, 12, 13, 14, 15, 16), ]  
rownames(test2) <- test2$sample
pred <- predict(rf, test2)


