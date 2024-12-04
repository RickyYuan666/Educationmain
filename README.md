# Comprehensive Analysis of Educational and Demographic Factors: Insights into Inequality and Opportunity

## Overview

Understanding the dynamics of income disparities and career choices through the lens of gender is critical for solving inequalities in economic opportunities and outcomes. This study focuses on analyzing gendered patterns in education and career choices and their impact on income levels using a Bayesian approach. The dataset used in this analysis is derived from real-world survey data（https://osf.io/48pqu/?view_only=） and preprocessed to test these relationships.

A Bayesian-ordered logistic regression model is employed to uncover insights from the data, focusing on how gender influences educational degrees, career field choices, and income disparities. The data was collected, cleaned, and analyzed using custom R scripts.


## File Structure

The repo is structured as:

-   `data/raw_data` Contains the raw data files obtained from https://osf.io/48pqu/?view_only=.
-   `data/analysis_data` Contains the cleaned and processed datasets used for the analysis.
-   `model` Includes fitted Bayesian models and related diagnostics.
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper and datasheet. 
-   `scripts` contains the R scripts used to simulate, download, clean and model data.


## Statement on LLM usage

Parts of the analysis, paper, and code were developed with assistance from ChatGPT. The entire chat history, documenting this collaboration, is available in the file other/llm/usage.txt. This ensures transparency and traceability of the development process.
