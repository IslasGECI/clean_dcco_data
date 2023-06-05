read_from_all_islets <- function(all_islets_path) {
  data <- readr::read_csv(all_islets_path, show_col_types = FALSE)
  wanted_islet <- !data$Isla %in% c("Alcatraz", "Bledos")
  data %>%
    dplyr::filter(wanted_islet)
}
