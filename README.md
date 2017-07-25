# oligomm infection response

- project report: https://www.overleaf.com/10085180pjxxvvwjxppx

# Table of Contents  
[Analysis 1 (per Category, 3 groups, old analysis)](#analysis-1)  
[Analysis 2 (per Subcategory, 3 groups, old analysis)](#analysis-2)  
[Analysis 3 (Random Forest Regression)](#analysis-3)  
[Analysis 4 (per Subsystem, 2 groups, depleted + intermediate vs. enriched)](#analysis-4)  
[Analysis 5 (per Subsystem, 2 groups, enriched + intermediate vs. depleted)](#analysis-5)  

# Results
# Analysis 1
**Aim:** Fisher test and heat map for every SEED Category

**Results:**
- [heatmaps](results/analysis1/)
- [FDR corrected P value matrix](results/analysis1/pval_category.txt)

**Reproduce:**

```
source('analysis1.R')
```

# Results
# Analysis 1
**Aim:** Fisher test and heat map for every SEED Category

**Results:**
- [heatmaps](analysis1/)
- [FDR corrected P value matrix](analysis1/pval_category.txt)

**Reproduce:**

```
source('analysis1.R')
```

# Analysis 2
**Aim:** Fisher test and heat map for every SEED Subsystem

**Results:**
- [heatmaps](analysis2/)
- [FDR corrected P value matrix](analysis2/pval_subsystem.txt)

**Reproduce:**

```
source('analysis2.R')
```

# Analysis 3
**Aim:** Random forest regression based on Subsystem annotation with FC as response variable

**Results:**
- random forest model
```
 randomForest(x = df, y = y, ntree = 1000, importance = TRUE) 
               Type of random forest: regression
                     Number of trees: 1000
No. of variables tried at each split: 37

          Mean of squared residuals: 220040.2
                    % Var explained: 15.77
```

- [Node purity plot](results/analysis3/node_purity.pdf)
- [Observed/predicted FC plot](results/analysis3/observed_predicted.pdf)

- predicted FC based on RF model

| Genome                       | predicted FC |
|------------------------------|--------------|
| Clostridium difficile 630    | -204         |
| Salmonella enterica          | -386         |
| Escherichia coli Nissle 1917 | -343         |
| Escherichia coli 536A        | -341         |
| Bacteroides fragilis 638R    | -432         |
| Mucispirillum                | -798         |

**Reproduce:**

```
source('analysis3.R')
```

# Analysis 4
**Aim:** Fisher test and heat map for every SEED Category. (Depleted + Intermediate) vs. Enriched

**Results:**
- heatmaps: see `analysis4` [folder](analysis4/)
- [FDR corrected P value matrix](analysis4/table1.xlsx)

**Reproduce:**

```
source('analysis4.R')
```

# Analysis 5
**Aim:** Fisher test and heat map for every SEED Category. Depleted vs. (Enriched + Intermediate)

**Results:**
- heatmaps: see `analysis5` [folder](analysis5/)
- [FDR corrected P value matrix](analysis5/table2.xlsx)

**Reproduce:**

```
source('analysis5.R')
```
