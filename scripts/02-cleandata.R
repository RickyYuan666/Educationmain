#### Preamble ####
# Purpose: Downloads and processes the research data
# Author: Ricky Yuan
# Date: 21 November 2024
# Contact: ricky.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


# Load necessary libraries
library(tidyverse)

# Load the dataset
data <- read.csv("data/rawdata/econ.csv", stringsAsFactors = FALSE)

# View the first few rows of the dataset
head(data)

# Rename columns for clarity
colnames(data) <- make.names(colnames(data), unique = TRUE)

# Filter out any metadata rows (like the first row of descriptions)
data_clean <- data[-1, ]

# Convert relevant columns to appropriate data types
data_clean <- data_clean %>%
  mutate(
    idade = as.numeric(idade),
    escolaridade_transf = as.numeric(escolaridade_transf),
    gênero = as.factor(gênero),
    decl_racial = as.factor(decl_racial)
  )

# Handle missing values (example: replacing NA with median for numerical data)
data_clean <- data_clean %>%
  mutate(
    idade = ifelse(is.na(idade), median(idade, na.rm = TRUE), idade),
    escolaridade_transf = ifelse(is.na(escolaridade_transf), median(escolaridade_transf, na.rm = TRUE), escolaridade_transf)
  )

# Save cleaned data
write_parquet(
  data_clean,
  "data/analysisdata/econ_clean.parquet"
)

write_csv(
  data_clean,
  "data/rawdata/econ_clean.csv"
)