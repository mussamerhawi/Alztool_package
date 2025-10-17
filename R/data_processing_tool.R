#' @title Classify BMI to WHO Categories
#' @description This function takes a data frame containing a 'bmi' column and adds a
#'   new ordered factor variable, 'bmi_category', classifying the BMI
#'   according to World Health Organization (WHO) standards.
#' @param df A data frame that must contain a numeric or character column named 'bmi'.
#' @return The original data frame with one new ordered factor column: 'bmi_category'.
#' @export
#' @importFrom dplyr mutate
#' @examples
#' # --- Test Data Setup ---
#' test_data <- data.frame(
#'   subject_id = 1:5,
#'   bmi = c(17.2, 22.5, 26.8, 33.0, 41.5)
#' )
#'
#' # --- Example Usage ---
#' # The result should show the new 'bmi_category' column:
#' classify_bmi(test_data)
classify_bmi <- function(df) {

  # Note: The native R pipe |> is used and requires no external package import.

  # The entire data processing must happen inside the piped dplyr::mutate() call.
  # The .data$bmi syntax is maintained for package stability.
  df_processed <- df |>

    # 1. Mutate the data frame to ensure 'bmi' is numeric and create 'bmi_category'.
    dplyr::mutate(

      # Ensure BMI is Numeric (replaces the original column value)
      bmi = as.numeric(as.character(.data$bmi)),

      # Create the new categorical column (bmi_category)
      bmi_category = cut(
        x = .data$bmi,
        # CRITICAL FIX: The break must end in Inf to capture the highest BMI values.
        breaks = c(-Inf, 18.5, 25, 30, 35, Inf),
        labels = c("underweight", "normalweight", "overweight", "obese", "morbidly obese"),
        right = TRUE,
        ordered_result = TRUE
      )
    )

  return(df_processed)
}


#' @title Classify Cognitive Status from MMSE Score
#' @description This function takes a raw MMSE score and classifies cognitive status
#'   (Impaired/Not Impaired) using a common clinical cutoff (MMSE < 24 is Impaired).
#' @param df A data frame that must contain a numeric column named 'mmse'.
#' @return The original data frame with one new character column: 'cognitive_status'.
#' @export
#' @importFrom dplyr mutate case_when
#' @examples
#' # --- Test Data Setup ---
#' test_data_mmse <- data.frame(
#'   subject_id = 1:5,
#'   mmse = c(28, 26, 23, 19, 15)
#' )
#'
#' # --- Example Usage for MMSE ---
#' standardize_mmse(test_data_mmse)
standardize_mmse <- function(df) {

  df_processed <- df |>

    dplyr::mutate(
      # The .data$mmse ensures proper scoping within the package.
      cognitive_status = dplyr::case_when(
        .data$mmse >= 24 ~ "Not Impaired", # MMSE 24-30 is typically normal
        .data$mmse < 24 ~ "Impaired",     # MMSE < 24 suggests cognitive decline
        is.na(.data$mmse) ~ "Missing",
        .default = "Error"
      )
    )

  return(df_processed)
}
