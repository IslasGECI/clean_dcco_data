#' @export
cli_concatenate <- function(options) {
  california_data <- readr::read_csv(options[["right_data"]], show_col_types = FALSE)
  all_islets_data <- readr::read_csv(options[["left_data"]], show_col_types = FALSE)
  obtained <- concatenate_maximum_california_gulf(all_islets_data, california_data)
  readr::write_csv(obtained, options[["output_path"]])
}

select_pacific_islands <- function(options) {
  all_islets_data <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  readr::write_csv(all_islets_data, options[["output_path"]])
}
