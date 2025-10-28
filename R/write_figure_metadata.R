construct_figure_metadata <- function(clean_data, island) {
  first_season <- extract_season_column_by_island(clean_data, island) |>
    min()
  last_season <- extract_season_column_by_island(clean_data, island) |>
    max()

  list("island" = island, "figure_path" = NULL, "first_season" = first_season, "last_season" = last_season)
}

extract_season_column_by_island <- function(clean_data, island) {
  clean_data |>
    rater::filter_by_island(island) |>
    dplyr::pull(Temporada)
}
