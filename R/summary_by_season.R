sum_by_season <- function(data_by_season_and_islet) {
  data_by_season_and_islet |>
    dplyr::group_by(Temporada) |>
    dplyr::summarise(Nidos_activos_por_visita = sum(Nidos_activos_por_visita))
}
