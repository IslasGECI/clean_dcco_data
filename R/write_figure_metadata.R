construct_figure_metadata <- function(clean_data, island) {
  first_season <- clean_data |>
    dplyr::filter(Isla == island) |>
    dplyr::pull(Temporada) |>
    min()

  list("island" = island, "figure_path" = NULL, "first_season" = first_season, "last_season" = NULL)
}
