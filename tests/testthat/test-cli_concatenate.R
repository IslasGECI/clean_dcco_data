concatenated_outuput_path <- "/workdir/tests/data/concatenated_output.csv"
options <- list(
  right_data = "/workdir/tests/data/conteo_alto_nidos_cormoran_golfo_california.csv",
  left_data = "/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv",
  output_path = concatenated_outuput_path
)

describe("🪙 Concatenate conteo máximo de nidos por temporada con el conteo de todas las islas", {
  it("concatenate historic, high counts and counts", {
    write_concatenated_counts_options <- list(
      historic_data_path = "/workdir/tests/data/historical_data.csv",
      high_counts_path = "/workdir/tests/data/conteo_alto_nidos_cormoran_golfo_california.csv",
      nests_counts_path = "/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv",
      output_path = "/workdir/tests/concatenated_historic_high_counts_and_counts.csv"
    )

    testtools::if_exist_remove(write_concatenated_counts_options$output_path)
    write_concatenated_counts(write_concatenated_counts_options)
    expect_true(testtools::exist_output_file(write_concatenated_counts_options$output_path))
  })
  it("concatenate_maximum_california_gulf", {
    testtools::if_exist_remove(concatenated_outuput_path)
    cli_concatenate(options)
    expect_true(testtools::exist_output_file(concatenated_outuput_path))
  })
})

describe("Drop pacific islands from csv with all islets", {
  data_without_pacific_islands <- "/workdir/tests/data/droped_pacific_islands.csv"
  options <- list(
    data_path = concatenated_outuput_path,
    output_path = data_without_pacific_islands
  )
  it("select california gulf islands", {
    select_california_islands_cli(options)
    obtained <- readr::read_csv(data_without_pacific_islands, col_types = "cccic", show_col_types = FALSE)
    original_data <- readr::read_csv(concatenated_outuput_path, col_types = "cccic", show_col_types = FALSE)
    obtained_length <- nrow(obtained)
    original_length <- nrow(original_data)
    expect_true(obtained_length < original_length)
  })
})

describe("Drop gulf islands from csv with all islets", {
  data_without_gulf_islands <- "/workdir/tests/data/droped_gulf_islands.csv"
  options <- list(
    data_path = concatenated_outuput_path,
    output_path = data_without_gulf_islands
  )
  it("select pacific gulf islands", {
    select_pacific_islands_cli(options)
    obtained <- readr::read_csv(data_without_gulf_islands, col_types = "cccic", show_col_types = FALSE)
    original_data <- readr::read_csv(concatenated_outuput_path, col_types = "cccic", show_col_types = FALSE)
    obtained_length <- nrow(obtained)
    original_length <- nrow(original_data)
    expect_true(obtained_length < original_length)
  })
})
describe("Summary counts by season", {
  summary_output <- "/workdir/tests/data/summary_by_season.csv"
  input_path <- "/workdir/tests/data/concatenated_california_data.csv"
  options <- list(
    data_path = input_path,
    output_path = summary_output
  )
  it("count_by_season", {
    write_summary_by_season(options)
    obtained <- readr::read_csv(summary_output, show_col_types = FALSE)
    original_data <- readr::read_csv(input_path, show_col_types = FALSE)
    obtained_length <- nrow(obtained)
    original_length <- nrow(original_data)
    expect_true(obtained_length < original_length)
  })
})
describe("Write figure metadata", {
  data_path <- "/workdir/tests/data/cormorant_all_islets_clean_data.csv"
  figure_path <- "figures/cormorant_population_trend_asuncion.png"
  output_path <- "/workdir/tests/asuncion_figure_metadata.json"
  options <- list("data-path" = data_path, "island" = "Asuncion", "figure-path" = figure_path, "output-path" = output_path)
  it("Write json", {
    testtools::if_exist_remove(output_path)
    write_figure_metadata(options)
    expect_true(testtools::exist_output_file(output_path))
  })
})
