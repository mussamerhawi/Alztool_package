# Alztool: Reproducible Data Processing for Clinical Research
Welcome to the Alztool package! This project demonstrates reproducible Health Data Science principles by offering standardized functions for transforming raw clinical variables into useful, categorical features for analysis and modeling.

This package is an essential part of a portfolio demonstrating end-to-end R package development, adherence to R CMD check standards, and practical application in clinical informatics.

## 💾 Installation
You can install the development version of Alztool directly from GitHub using the devtools package:

 If you don't have devtools installed:
 install.packages("devtools") 

devtools::install_github("mussamerhawi/Alztool_package")

✨ Core Functions and Usage
Alztool currently contains two essential data processing functions, which use tidyverse syntax (dplyr) for efficiency.

**1. classify_bmi()**
Categorizes body mass index (BMI) according to standard World Health Organization (WHO) cutoffs, which is crucial for cohort analysis.

**BMI Categories**

<18.5  underweight

18.5 - 24.9  normalweight

25.0 - 29.9  overweight

30.0 - 34.9  obese (Class 1)

=>35.0  morbidly obese


Example:

library(Alztool)

raw_data <- data.frame(
  subject_id = 1:3,
  bmi = c(17.2, 26.8, 41.5)
)

classify_bmi(raw_data)

## Expected Output: A data frame with the new 'bmi_category' column.

**2. standardize_mmse()**
Classifies cognitive status based on the Mini-Mental State Examination (MMSE) score, a key assessment in Alzheimer's research.

Cutoff: Scores below 24 are typically categorized as "Impaired."

Example:

library(Alztool)

raw_data <- data.frame(
  subject_id = 1:3,
  mmse = c(28, 23, NA)
)

standardize_mmse(raw_data)
## Expected Output: A data frame with the new 'cognitive_status' column (Not Impaired, Impaired, Missing).

🤝 Contribution and License
This project is licensed under the MIT License (see the LICENSE.md file for full details). Feedback and suggestions are welcome!
