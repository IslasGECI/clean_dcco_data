#' @export
cli_concatenate <- function(options) {
  california_data <- readr::read_csv(options[["right_data"]], show_col_types = FALSE)
  all_islets_data <- readr::read_csv(options[["left_data"]], show_col_types = FALSE)
  obtained <- concatenate_maximum_california_gulf(all_islets_data, california_data)
  readr::write_csv(obtained, options[["output_path"]])
}

select_pacific_islands_cli <- function(options) {
  all_islets_data <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  pacific_islands <- drop_california_islands(all_islets_data)
  readr::write_csv(pacific_islands, options[["output_path"]])
}
