all_islets_path <- "/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv"
describe("🪙 Concatenate conteo máximo de nidos por temporada con el conteo de todas las islas", {
  it("concatenate_maximum_california_gulf", {
    skip("This is the gold")
    all_islets_data <- readr::read_csv(all_islets_path, show_col_types = FALSE)
    california_path <- "/workdir/tests/data/conteo_alto_nidos_cormoran_golfo_california.csv"
    california_data <- readr::read_csv(california_path, show_col_types = FALSE)
    obtained <- concatenate_maximum_california_gulf(all_islets_data, california_data)
    expected <- readr::read_csv("/workdir/tests/data/concatenated_califoria_data.csv", show_col_types = FALSE)
    expect_equal(obtained, expected)
  })
})
describe("Eliminar registros de islas en el golfo", {
  it("Tirar registros por isla", {
    obtained <- read_from_all_islets(all_islets_path)
    obtained_columns <- names(obtained)
    expected_column <- "Isla"
    expect_true(expected_column %in% obtained_columns)
    islet <- c("Alcatraz", "Bledos")
    expect_false(islet %in% obtained$Isla)
  })
})
describe("Agregar registros altos", {
  it("Seleccionar nombre temporada", {

  })
  it("Concatenar registros altos", {

  })
})
