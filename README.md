# oligomm infection response

- project report: https://www.overleaf.com/10085180pjxxvvwjxppx

# Table of Contents  
[Analysis 1 (per Category, 3 groups)](#analysis-1)  
[Analysis 2 (per Subcategory, 3 groups)](#analysis-2)  
[Analysis 3 (Random Forest Regression)](#analysis-3)  
[Analysis 4 (per Subsystem, 2 groups A)](#analysis-4)  
[Analysis 5 (per Subsystem, 2 groups B)](#analysis-5)  


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
- [heatmaps](results/analysis1/)
- [FDR corrected P value matrix](results/analysis1/pval_category.txt)

**Reproduce:**

```
source('analysis1.R')
```

# Analysis 2
**Aim:** Fisher test and heat map for every SEED Subsystem

**Results:**
- [heatmaps](results/analysis2/)
- [FDR corrected P value matrix](results/analysis2/pval_subsystem.txt)

**Reproduce:**

```
source('analysis2.R')
```

# Analysis 3
**Aim:** Random forest regression

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
