# This file is used to suppress NOTEs from R CMD check regarding
# 'no visible binding for global variable' when using non-standard
# evaluation (NSE) tools like the 'dplyr::case_when' or 'dplyr::mutate'
# functions, specifically when using the dot-data pronoun (.data).

utils::globalVariables(c(
  ".data" # This tells R CMD check that we intentionally use '.data'
))
