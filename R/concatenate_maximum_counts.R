read_from_all_islets <- function(all_islets_path) {
  data <- readr::read_csv(all_islets_path, show_col_types = FALSE)
  data %>%
    dplyr::filter(!(Isla %in% c("Alcatraz", "Bledos")))
}
