options <- list(
  left_data = "/workdir/tests/data/conteo_alto_nidos_cormoran_golfo_california.csv",
  right_data = "/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv",
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
