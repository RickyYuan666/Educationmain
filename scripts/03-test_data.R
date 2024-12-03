#### Preamble ####
# Purpose: Test the cleaned data for correctness and consistency
# Author: Ricky Yuan
# Date: 21 November 2024
# Contact: ricky.yuan@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(arrow)

#### Test data ####

# Read the data
data <- read_parquet("data/analysisdata/econ_clean.parquet")

# Check for correct columns
required_columns <- c("idade", "escolaridade_transf", "gênero", "decl_racial")
if (!all(required_columns %in% names(data))) {
  stop("Data frame does not have the correct columns.")
}

# Check for correct types
if (!is.numeric(data$idade)) {
  stop("idade is not numeric.")
}
if (!is.numeric(data$escolaridade_transf)) {
  stop("escolaridade_transf is not numeric.")
}
if (!is.factor(data$gênero)) {
  stop("gênero is not a factor.")
}
if (!is.factor(data$decl_racial)) {
  stop("decl_racial is not a factor.")
}

# Check for expected levels in factors
expected_levels_gender <- c("male", "female")
if (!all(expected_levels_gender %in% levels(data$gênero))) {
  stop("gênero does not have the expected levels.")
}

expected_levels_decl_racial <- c("white", "black", "indigenous", "asian", "other")
if (!all(expected_levels_decl_racial %in% levels(data$decl_racial))) {
  stop("decl_racial does not have the expected levels.")
}

# Check numeric variables for expected range
if (any(data$idade < 0 | data$idade > 120, na.rm = TRUE)) {
  stop("idade contains values outside the expected range (0-120).")
}
if (any(data$escolaridade_transf < 0, na.rm = TRUE)) {
  stop("escolaridade_transf contains negative values.")
}

# Check for missing values
if (any(!complete.cases(data))) {
  stop("There are missing values in the data.")
}

# If the script gets to this point without stopping, all tests passed
print("All tests passed!")
