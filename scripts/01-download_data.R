#### Preamble ####
# Purpose: Downloads and processes the research data
# Author: Ricky Yuan
# Date: 21 November 2024
# Contact: ricky.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(arrow)


#### Download data ####
econ <-
  read_csv(
    here::here("data/rawdata/econ.csv"),
    show_col_types = FALSE
  )

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_parquet(
  econ, 
  "data/rawdata/econ.parquet"
)
write_csv(
  econ, 
  "data/rawdata/econ.csv"
)