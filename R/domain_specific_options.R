#' Get domain-specific CLI options
#'
#' Defines and returns the command-line options for the domain-specific options.
#'
#' @return A named list of parsed CLI options with keys `data-path`,
#'   `island`, `figure-path`, and `output-path`.
#'
#' @export
get_domain_specific_options <- function() {
  data_path <- gecioptparse::character_option(c("-d", "--data-path"), default = "/workdir/data.csv", help = "Path from data input")
  island <- gecioptparse::character_option(c("-i", "--island"), default = "Alcatraz", help = "Island")
  figure_path <- gecioptparse::character_option(c("-f", "--figure-path"), default = "figures/alcatraz_population_trend.png", help = "Path from population trend figure")
  output_path <- gecioptparse::character_option(c("-o", "--output-path"), default = "/workdir/non-tabular/alcatraz_figure_metadata.json", help = "Path from JSON output")
  option_names <- c(data_path, island, figure_path, output_path)
  gecioptparse::get_options_from_vec(option_names)
}
