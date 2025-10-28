construct_figure_metadata <- function(clean_data, island) {
  seasons <- extract_season_column_by_island(clean_data, island)
  list("island" = island, "figure_path" = NULL, "first_season" = min(seasons), "last_season" = max(seasons))
}

extract_season_column_by_island <- function(clean_data, island) {
  clean_data |>
    rater::filter_by_island(island) |>
    dplyr::pull(Temporada)
}
