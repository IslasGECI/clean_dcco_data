#' @export
cli_concatenate <- function(options) {
  california_data <- readr::read_csv(options[["right_data"]], show_col_types = FALSE)
  all_islets_data <- readr::read_csv(options[["left_data"]], show_col_types = FALSE)
  obtained <- concatenate_maximum_california_gulf(all_islets_data, california_data)
  readr::write_csv(obtained, options[["output_path"]])
}

#' @export
select_pacific_islands_cli <- function(options) {
  all_islets_data <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  pacific_islands <- select_pacific_islands(all_islets_data)
  readr::write_csv(pacific_islands, options[["output_path"]])
}

#' @export
select_california_islands_cli <- function(options) {
  all_islets_data <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  california_islands <- select_california_islands(all_islets_data)
  readr::write_csv(california_islands, options[["output_path"]])
}

#' @export
write_summary_by_season <- function(options) {
  data_by_season_and_islets <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  summary_by_season <- sum_by_season(data_by_season_and_islets)
  readr::write_csv(summary_by_season, options[["output_path"]])
}
