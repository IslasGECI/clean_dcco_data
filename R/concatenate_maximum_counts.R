select_pacific_islands <- function(data) {
  california_islands <- c("Alcatraz", "Bledos", "Pajaros", "Patos")
  drop_islands(data, california_islands)
}

select_california_islands <- function(data) {
  california_islands <- c("Alcatraz", "Bledos", "Pajaros", "Patos")
  select_islands(data, california_islands)
}

select_pacific_islands_without_historical_data <- function(data) {
  islands_with_historical_data <- c("Coronado Norte", "Coronado Sur")
  drop_islands(data, islands_with_historical_data) |>
    select_pacific_islands()
}

drop_islands <- function(data, california_islands) {
  wanted_islet <- !data$Isla %in% california_islands
  data |>
    dplyr::filter(wanted_islet)
}

select_islands <- function(data, california_islands) {
  not_wanted_islet <- data$Isla %in% california_islands
  data |>
    dplyr::filter(not_wanted_islet)
}

select_initial_year <- function(california_data) {
  california_data |> tidyr::separate(Temporada, c("Temporada", NA), "/")
}

concatenate_california_and_all_islets <- function(california_data, all_islets_data) {
  california_data |>
    dplyr::rename(Nidos_activos_por_visita = "Nidos_altos_por_temporada") |>
    dplyr::select(-c("mas notas")) |>
    rbind(all_islets_data)
}
concatenate_maximum_california_gulf <- function(all_islets_data, california_data) {
  no_california_islands <- all_islets_data |>
    select_pacific_islands()
  california_single_year_season <- california_data |>
    select_initial_year()
  concatenate_california_and_all_islets(california_single_year_season, no_california_islands)
}
