#' Write concatenated maximum counts
#'
#' Reads historical, high-counts, and nests-counts data from CSV files,
#' computes the maximum active nests per season and island, cleans the
#' high-counts data, and writes the concatenated result to a single CSV file.
#'
#' @param options A named list with the following keys:
#'   \describe{
#'     \item{historic_data_path}{Path to the historical counts CSV.}
#'     \item{high_counts_path}{Path to the high counts CSV.}
#'     \item{nests_counts_path}{Path to the nests counts CSV.}
#'     \item{output_path}{Path where the concatenated CSV will be written.}
#'   }
#'
#' @return Invisible `NULL`. Called for its side effect of writing a CSV file.
#'
#' @export
write_concatenated_counts <- function(options) {
  historical_data <- readr::read_csv(options[["historical-data-path"]], show_col_types = FALSE)
  high_counts_data <- readr::read_csv(options[["high-counts-path"]], show_col_types = FALSE)
  nests_counts_data <- readr::read_csv(options[["nests-counts-path"]], show_col_types = FALSE)

  maximum_historic_counts <- compute_maximum_nests(historical_data)
  maximum_nests_counts <- nests_counts_data |>
    drop_unreliable_records() |>
    compute_maximum_nests()
  single_year_high_counts_data <- high_counts_data |>
    clean_high_counts_data()

  concatenated_data <- dplyr::bind_rows(maximum_historic_counts, maximum_nests_counts, single_year_high_counts_data)
  readr::write_csv(concatenated_data, options[["output-path"]])
}

#' Concatenate California and all-islets maximum counts
#'
#' Reads all-islets data and California-only data from CSV files,
#' selects the initial year for California records, and concatenates
#' both datasets. The result is written to a CSV file.
#'
#' @param options A named list with the following keys:
#'   \describe{
#'     \item{right_data}{Path to the California counts CSV.}
#'     \item{left_data}{Path to the all-islets counts CSV.}
#'     \item{output_path}{Path where the concatenated CSV will be written.}
#'   }
#'
#' @return Invisible `NULL`. Called for its side effect of writing a CSV file.
#'
#' @export
cli_concatenate <- function(options) {
  california_data <- readr::read_csv(options[["right_data"]], show_col_types = FALSE)
  all_islets_data <- readr::read_csv(options[["left_data"]], show_col_types = FALSE)
  obtained <- concatenate_maximum_california_gulf(all_islets_data, california_data)
  readr::write_csv(obtained, options[["output_path"]])
}

#' Select Pacific islands without historical data
#'
#' Reads an all-islets CSV and filters to retain only Pacific islands
#' that do not have associated historical data (excludes Coronado Norte
#' and Coronado Sur). The result is written to a CSV file.
#'
#' @param options A named list with the following keys:
#'   \describe{
#'     \item{data_path}{Path to the all-islets CSV.}
#'     \item{output_path}{Path where the filtered CSV will be written.}
#'   }
#'
#' @return Invisible `NULL`. Called for its side effect of writing a CSV file.
#'
#' @export
select_pacific_islands_cli <- function(options) {
  all_islets_data <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  pacific_islands <- select_pacific_islands_without_historical_data(all_islets_data)
  readr::write_csv(pacific_islands, options[["output_path"]])
}

#' Select California islands
#'
#' Reads an all-islets CSV and filters to retain only the California
#' islands (Alcatraz, Bledos, Pajaros, Patos). The result is written
#' to a CSV file.
#'
#' @param options A named list with the following keys:
#'   \describe{
#'     \item{data_path}{Path to the all-islets CSV.}
#'     \item{output_path}{Path where the filtered CSV will be written.}
#'   }
#'
#' @return Invisible `NULL`. Called for its side effect of writing a CSV file.
#'
#' @export
select_california_islands_cli <- function(options) {
  all_islets_data <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  california_islands <- select_california_islands(all_islets_data)
  readr::write_csv(california_islands, options[["output_path"]])
}

#' Write summary of active nests by season
#'
#' Reads per-season, per-island counts from a CSV, aggregates the
#' active nest counts across all islands for each season, and writes
#' the summary to a CSV file.
#'
#' @param options A named list with the following keys:
#'   \describe{
#'     \item{data_path}{Path to the per-season per-island CSV.}
#'     \item{output_path}{Path where the summary CSV will be written.}
#'   }
#'
#' @return Invisible `NULL`. Called for its side effect of writing a CSV file.
#'
#' @export
write_summary_by_season <- function(options) {
  data_by_season_and_islets <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  summary_by_season <- sum_by_season(data_by_season_and_islets)
  readr::write_csv(summary_by_season, options[["output_path"]])
}

#' Write figure metadata JSON
#'
#' Reads cleaned count data from a CSV, extracts the first and last
#' season for a given island, and writes a JSON file containing the
#' island name, figure path, and season range.
#'
#' @param options A named list with the following keys:
#'   \describe{
#'     \item{data-path}{Path to the cleaned counts CSV.}
#'     \item{island}{Name of the island to filter by.}
#'     \item{figure-path}{Path to the population trend figure.}
#'     \item{output-path}{Path where the JSON metadata will be written.}
#'   }
#'
#' @return Invisible `NULL`. Called for its side effect of writing a JSON file.
#'
#' @export
write_figure_metadata <- function(options) {
  clean_data <- readr::read_csv(options[["data-path"]], show_col_types = FALSE)
  figure_metadata_list <- construct_figure_metadata(clean_data, options[["island"]], options[["figure-path"]])
  readr::write_lines(
    jsonlite::toJSON(figure_metadata_list, pretty = TRUE, auto_unbox = TRUE),
    options[["output-path"]]
  )
}
