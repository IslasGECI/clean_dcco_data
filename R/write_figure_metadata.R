construct_figure_metadata <- function(clean_data, island, figure_path) {
  seasons <- extract_season_column_by_island(clean_data, island)
  converted_island <- stringr::str_replace(island, "_", " y ")
  list("island" = converted_island, "figure_path" = figure_path, "first_season" = min(seasons), "last_season" = max(seasons))
}

extract_season_column_by_island <- function(clean_data, island) {
  clean_data |>
    gecitools::filter_by_island(island) |>
    dplyr::pull(Temporada)
}
