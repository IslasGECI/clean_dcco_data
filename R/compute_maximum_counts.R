compute_maximum_nests_by_season <- function(nest_counts_df) {
  nest_counts_df |>
    dplyr::filter(!is.na(Nidos_activos_por_visita)) |>
    dplyr::group_by(Isla, Temporada) |>
    dplyr::summarise(Nidos_activos_por_visita = max(Nidos_activos_por_visita, na.rm = TRUE))
}

clean_high_counts_data <- function(high_counts_data) {
  single_year_high_counts_data <- high_counts_data |>
    select_initial_year() |>
    drop_unreliable_records() |>
    dplyr::rename(Nidos_activos_por_visita = "Nidos_altos_por_temporada") |>
    dplyr::filter(!is.na(Nidos_activos_por_visita))
}
drop_unreliable_records <- function(data) {
  data |> dplyr::filter(stringr::str_detect(Notas, "No usar", negate = TRUE) | is.na(Notas))
}

concatenate_high_and_monthly_nest_counts <- function(nest_counts, max_nest_count) {
  processed_max_nest_count <- max_nest_count |>
    select_initial_year() |>
    dplyr::rename(Nidos_activos_por_visita = "Nidos_altos_por_temporada")
  binded_df <- dplyr::bind_rows(processed_max_nest_count, nest_counts)
  binded_df |>
    dplyr::mutate(year_month = substr(Fecha, 4, 12)) |>
    dplyr::group_by(Isla, year_month, Temporada) |>
    dplyr::summarise(
      Nidos_activos_por_visita = max(Nidos_activos_por_visita, na.rm = TRUE)
    ) |>
    dplyr::ungroup()
}
