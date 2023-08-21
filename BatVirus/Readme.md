# Bat Genes and Ebola Analysis

Welcome to the Bat Genes and Ebola Analysis repository. This project/assignment aims to uncover insights into how specific bat genes may impact the likelihood of carrying the Ebola virus. The analysis involves exploring a dataset of bats and their gene expressions.

## Table of Contents

- [Dataset](#dataset)
- [Analysis Steps](#analysis-steps)
  - [Loading and Preprocessing the Data](#loading-and-preprocessing-the-data)
  - [Calculating the Chance of Ebola Carriage](#calculating-the-chance-of-ebola-carriage)
  - [Determining Gene Expression Likelihood](#determining-gene-expression-likelihood)
  - [Assessing Gene-Ebola Relationship](#assessing-gene-ebola-relationship)
- [Conclusion](#conclusion)

## Dataset

The dataset used in this analysis is stored in the `bats.csv` file located in the `Codes/Data/` folder. This file contains information about bat genes and whether a bat carries the Ebola virus.

## Analysis Steps

### 1. Loading and Preprocessing the Data

Load the dataset and convert logical columns to numeric values for analysis.

```R
# Load the DataSet
dfBat <- read.csv("bats.csv")
logical_columns <- c("Gene.1", "Gene.2", "Gene.3", "Gene.4", "Gene.5", "Ebola")
dfBat[logical_columns] <- lapply(dfBat[logical_columns], as.numeric)
```
### 2. Calculating the Chance of Ebola Carriage

Calculate the chance of a random bat carrying the Ebola virus.

```R
TotalEbolaBats <- sum(dfBat$Ebola)
totalBats <- nrow(dfBat)
EbolaChance <- TotalEbolaBats / totalBats

```

### 3. Determining Gene Expression Likelihood

Calculate the likelihood of each gene being expressed in a random bat.

```R
likelihood <- colMeans(dfBat[, c("Gene.1", "Gene.2", "Gene.3", "Gene.4", "Gene.5")])
gene_likelihood_df <- data.frame(Gene = c("Gene.1", "Gene.2", "Gene.3", "Gene.4", "Gene.5"), Likelihood = likelihood)
```
### 4. Assessing Gene-Ebola Relationship

#### Method 1: Proportion Analysis
```R
genes_to_analyze <- c("Gene.1", "Gene.2", "Gene.3", "Gene.4", "Gene.5")

for (gene in genes_to_analyze) {
  # Calculate proportions
  presence_ebola_proportion <- mean(dfBat[dfBat[[gene]] == TRUE, "Ebola"])
  absence_ebola_proportion <- mean(dfBat[dfBat[[gene]] == FALSE, "Ebola"])
  
  # Print results
  cat("Gene:", gene, "\n")
  cat("Proportion of bats carrying Ebola with", gene, "present:", presence_ebola_proportion, "\n")
  cat("Proportion of bats carrying Ebola with", gene, "absent:", absence_ebola_proportion, "\n\n")
}
```

#### Method 2: Binomial Model
```R
# Load the necessary library
library(dplyr)

# Create a new column to represent Ebola as numeric
dfBat$Ebola_numeric <- as.numeric(dfBat$Ebola)

# Fit a logistic regression model
model <- glm(Ebola_numeric ~ Gene.1 + Gene.2 + Gene.3 + Gene.4 + Gene.5,
             data = dfBat, family = binomial)
```

#### Method 3: Chi-Squared Test
```R
genes_to_analyze <- c("Gene.1", "Gene.2", "Gene.3", "Gene.4", "Gene.5")

for (gene in genes_to_analyze) {
  cross_tab <- table(dfBat[[gene]], dfBat$Ebola)
  chi_result <- chisq.test(cross_tab)
  
  cat("Chi-squared test for", gene, "and Ebola:\n")
  print(chi_result)
}
```

## Conclusion
The analysis explores the connection between specific bat genes and the likelihood of carrying the Ebola virus.
