read_from_all_islets <- function(data, not_wanted_islets = c("Alcatraz", "Bledos", "Pajaros", "Patos")) {
  wanted_islet <- !data$Isla %in% not_wanted_islets
  data %>%
    dplyr::filter(wanted_islet)
}

select_initial_year <- function(california_data) {
  california_data %>% tidyr::separate(Temporada, c("Temporada", NA), "/")
}

concatenate_california_and_all_islets <- function(california_data, all_islets_data) {
  california_data %>%
    dplyr::rename(Nidos_activos_por_visita = "Nidos_altos_por_temporada") %>%
    dplyr::select(-c("mas notas")) %>%
    rbind(all_islets_data)
}
