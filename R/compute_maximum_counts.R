compute_maximum_nests <- function(nest_counts_df) {
  nest_counts_df |>
    dplyr::group_by(Isla, Temporada) |>
    dplyr::summarise(Nidos_activos_por_visita = dplyr::n())
}
