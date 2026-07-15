write_concatenated_counts <- function(options) {
  historical_data <- readr::read_csv(options[["historic_data_path"]], show_col_types = FALSE)
  high_counts_data <- readr::read_csv(options[["high_counts_path"]], show_col_types = FALSE)
  nests_counts_data <- readr::read_csv(options[["nests_counts_path"]], show_col_types = FALSE)

  maximum_historic_counts <- compute_maximum_nests(historical_data)
  maximum_nests_counts <- nests_counts_data |>
    drop_unreliable_records() |>
    compute_maximum_nests()
  single_year_high_counts_data <- high_counts_data |>
    clean_high_counts_data()

  concatenated_data <- dplyr::bind_rows(maximum_historic_counts, maximum_nests_counts, single_year_high_counts_data)
  readr::write_csv(concatenated_data, options[["output_path"]])
}

drop_unreliable_records <- function(data) {
  data |> dplyr::filter(stringr::str_detect(Notas, "No usar", negate = TRUE) | is.na(Notas))
}

clean_high_counts_data <- function(high_counts_data) {
  single_year_high_counts_data <- high_counts_data |>
    select_initial_year() |>
    drop_unreliable_records() |>
    dplyr::mutate(Temporada = as.integer(Temporada)) |>
    dplyr::rename(Nidos_activos_por_visita = "Nidos_altos_por_temporada") |>
    dplyr::filter(!is.na(Nidos_activos_por_visita))
}
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
  pacific_islands <- select_pacific_islands_without_historical_data(all_islets_data)
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

#' @export
write_figure_metadata <- function(options) {
  clean_data <- readr::read_csv(options[["data-path"]], show_col_types = FALSE)
  figure_metadata_list <- construct_figure_metadata(clean_data, options[["island"]], options[["figure-path"]])
  readr::write_lines(
    jsonlite::toJSON(figure_metadata_list, pretty = TRUE, auto_unbox = TRUE),
    options[["output-path"]]
  )
}
