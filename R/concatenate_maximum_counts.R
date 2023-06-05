read_from_all_islets <- function(all_islets_path, not_wanted_islets = c("Alcatraz", "Bledos", "Pajaros", "Patos")) {
  data <- readr::read_csv(all_islets_path, show_col_types = FALSE)
  wanted_islet <- !data$Isla %in% not_wanted_islets
  data %>%
    dplyr::filter(wanted_islet)
}

select_initial_year <- function(california_data) {
  california_data %>% tidyr::separate(Temporada, c("Temporada", NA), "/")
}

concatenate_california_and_all_islets <- function(california_data, all_islets_data) {}
