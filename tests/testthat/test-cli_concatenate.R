options <- list(
  right_data = "/workdir/tests/data/conteo_alto_nidos_cormoran_golfo_california.csv",
  left_data = "/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv",
  output_path = "/workdir/tests/data/concatenated_output.csv"
)

describe("🪙 Concatenate conteo máximo de nidos por temporada con el conteo de todas las islas", {
  it("concatenate_maximum_california_gulf", {
    cli_concatenate(options)
    obtained <- readr::read_csv("/workdir/tests/data/concatenated_output.csv", col_types = "cccic", show_col_types = FALSE)
    expected <- readr::read_csv("/workdir/tests/data/concatenated_california_data.csv", col_types = "cccic", show_col_types = FALSE)
    expect_equal(obtained, expected)
  })
})

describe("Drop pacific islands from csv with all islets", {
  data_without_pacific_islands <- "/workdir/tests/data/droped_pacific_islands.csv"
  options <- list(
    data_path = "/workdir/tests/data/concatenated_output.csv",
    output_path = data_without_pacific_islands
  )
  it("select california gulf islands", {
    select_california_islands_cli(options)
    obtained <- readr::read_csv(data_without_pacific_islands, col_types = "cccic", show_col_types = FALSE)
    original_data <- readr::read_csv("/workdir/tests/data/concatenated_output.csv", col_types = "cccic", show_col_types = FALSE)
    obtained_length <- nrow(obtained)
    original_length <- nrow(original_data)
    expect_true(obtained_length < original_length)
  })
})

describe("Drop gulf islands from csv with all islets", {
  data_without_gulf_islands <- "/workdir/tests/data/droped_gulf_islands.csv"
  options <- list(
    data_path = "/workdir/tests/data/concatenated_output.csv",
    output_path = data_without_gulf_islands
  )
  it("select pacific gulf islands", {
    select_pacific_islands_cli(options)
    obtained <- readr::read_csv(data_without_gulf_islands, col_types = "cccic", show_col_types = FALSE)
    original_data <- readr::read_csv("/workdir/tests/data/concatenated_output.csv", col_types = "cccic", show_col_types = FALSE)
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
