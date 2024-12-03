#### Preamble ####
# Purpose: Perform Bayesian modeling on cleaned data
# Author: Ricky Yuan
# Date: 21 November 2024
# Contact: ricky.yuan@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(rstanarm) # For Bayesian modeling
library(arrow) # To read Parquet files
library(dplyr) # For data manipulation

#### Read data ####
cleaned_data <- read_parquet("data/analysisdata/econ_clean.parquet")

# Select columns of interest for modeling
data_model <- data_clean %>%
  select(idade, gênero, decl_racial, escolaridade_transf)

# Save the cleaned data for analysis
write.csv(data_model, "cleaned_data.csv", row.names = FALSE)

# Example model - Linear regression (replace with your preferred analysis)
model <- lm(idade ~ gênero + decl_racial + escolaridade_transf, data = data_model)

# Summary of the model
summary(model)

#  the model for future use
saveRDS(model, "linear_model.rds")
