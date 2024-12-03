#### Preamble ####
# Purpose: Simulates data for gender and income disparity analysis
# Author: Ricky Yuan
# Date: 21 November 2024
# Contact: ricky.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None



#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
# Set seed for reproducibility
set.seed(909)

# Number of observations
n <- 1000

# Simulate Gender: 'Mulher' (Female), 'Homem' (Male)
Gender <- factor(
  sample(c("Mulher", "Homem"), n, replace = TRUE, prob = c(0.5, 0.5)),
  levels = c("Mulher", "Homem")
)

# Simulate Age: Depends on Gender
Age <- ifelse(
  Gender == "Homem", 
  round(rnorm(n, mean = 50, sd = 10)),  # Males have a higher mean age
  round(rnorm(n, mean = 40, sd = 8))   # Females have a lower mean age
)
Age <- pmax(pmin(Age, 60), 20)  # Constrain ages to be between 20 and 60

# Simulate Education Level: Higher age increases likelihood of higher education
Education <- factor(
  sample(
    c("Ensino Médio", "Superior (incompleto)", "Pós graduação"), 
    n, 
    replace = TRUE, 
    prob = case_when(
      Age < 30 ~ c(0.6, 0.3, 0.1),       # Younger individuals are more likely to have lower education
      Age >= 30 & Age < 50 ~ c(0.3, 0.5, 0.2),  # Middle-aged have balanced probabilities
      Age >= 50 ~ c(0.2, 0.4, 0.4)       # Older individuals are more likely to have higher education
    )
  ),
  levels = c("Ensino Médio", "Superior (incompleto)", "Pós graduação"),
  ordered = TRUE
)

# Simulate Career Field: Education influences the likelihood of career choice
CareerField <- sample(
  c("Humanas", "Exatas", "Saúde"), 
  n, 
  replace = TRUE, 
  prob = case_when(
    Education == "Ensino Médio" ~ c(0.5, 0.3, 0.2),
    Education == "Superior (incompleto)" ~ c(0.3, 0.4, 0.3),
    Education == "Pós graduação" ~ c(0.2, 0.4, 0.4)
  )
)

# Simulate Race: Correlation with Education
Race <- sample(
  c("Branco", "Não Branco"), 
  n, 
  replace = TRUE, 
  prob = ifelse(Education == "Pós graduação", c(0.8, 0.2), c(0.6, 0.4))
)

# Simulate Income: Depends on Gender, Education, CareerField, and Age
Income <- round(
  30 + 
    5 * (Gender == "Homem") +                          # Male has higher base income
    10 * as.numeric(Education) +                      # Higher education increases income
    7 * (CareerField == "Exatas") +                   # Engineering (Exatas) has highest boost
    5 * (CareerField == "Saúde") +                    # Health (Saúde) has moderate boost
    0.2 * Age +                                       # Older age slightly increases income
    rnorm(n, mean = 0, sd = 5),                       # Random noise
  2
)

# Create Data Frame
simulated_data <- tibble(
  Gender = Gender,
  Age = Age,
  Education = Education,
  CareerField = CareerField,
  Race = Race,
  Income = Income
)

# Display the first few rows of the simulated data
head(simulated_data)

# Save Simulated Data
write_csv(simulated_data, "simulated_gender_income_data.csv")

