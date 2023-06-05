read_from_all_islets <- function(all_islets_path) {
  data <- readr::read_csv(all_islets_path, show_col_types = FALSE)
  not_wanted_islets <- c("Alcatraz", "Bledos")
  wanted_islet <- !data$Isla %in% not_wanted_islets
  data %>%
    dplyr::filter(wanted_islet)
}
