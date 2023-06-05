read_from_all_islets <- function(all_islets_path, not_wanted_islets = c("Alcatraz", "Bledos", "Pajaros", "Patos")) {
  data <- readr::read_csv(all_islets_path, show_col_types = FALSE)
  wanted_islet <- !data$Isla %in% not_wanted_islets
  data %>%
    dplyr::filter(wanted_islet)
}
