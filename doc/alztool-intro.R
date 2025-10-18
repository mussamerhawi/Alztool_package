## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(Alztool)
library(dplyr)
library(knitr)

# Simulate a small dataset for demonstration
sim_data <- data.frame(
  patient_id = 101:105,
  bmi = c(17.9, 23.5, 28.1, 32.0, 39.9),
  mmse = c(29, 21, 25, 18, NA),
  # Other columns to match your real dataset structure
  age = c(70, 75, 68, 80, 72) 
)

# Display the starting data
kable(sim_data)

## -----------------------------------------------------------------------------
data_mmse_classified <- sim_data %>%
  standardize_mmse()

# Display the results
kable(data_mmse_classified)


## -----------------------------------------------------------------------------
final_classified_data <- data_mmse_classified %>%
  classify_bmi()

# Select only the key columns for easy viewing
final_classified_data <- final_classified_data %>%
  select(patient_id, bmi, bmi_category, mmse, cognitive_status)

# Display the final results, showing the success of the classification
kable(final_classified_data)

