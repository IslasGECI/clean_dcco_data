all_islets_path <- "/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv"
california_path <- "/workdir/tests/data/conteo_alto_nidos_cormoran_golfo_california.csv"
california_data <- readr::read_csv(california_path, show_col_types = FALSE)
all_islets_data <- readr::read_csv(all_islets_path, show_col_types = FALSE)
describe("🪙 Concatenate conteo máximo de nidos por temporada con el conteo de todas las islas", {
  it("concatenate_maximum_california_gulf", {
    obtained <- concatenate_maximum_california_gulf(all_islets_data, california_data)
    expected <- readr::read_csv("/workdir/tests/data/concatenated_california_data.csv", col_types = "cccic", show_col_types = FALSE)
    expect_equal(obtained, expected)
  })
})
describe("Delete historical data", {
  historical_data_path <- "/workdir/tests/data/conteo_nidos_cormoran_todas_islas_with_historical_data.cs"
  historical_data <- readr::read_csv(historical_data_path, show_col_types = FALSE)
  it("Remove registers for Coronado Sur and Norte", {
    obtained <- select_pacific_islands_without_histoical_data(historical_data)
    islet <- c("Coronado Norte", "Coronado Sur")
    are_any_there <- any(islet %in% obtained$Isla)
    expect_false(are_any_there)
  })
})
describe("Eliminar registros de islas en el golfo", {
  it("Tirar registros por isla", {
    obtained <- select_pacific_islands(all_islets_data)
    obtained_columns <- names(obtained)
    expected_column <- "Isla"
    expect_true(expected_column %in% obtained_columns)
    islet <- c("Alcatraz", "Bledos", "Pajaros", "Patos")
    are_any_there <- any(islet %in% obtained$Isla)
    expect_false(are_any_there)
  })
})
describe("Eliminar registros de islas del pacífico", {
  it("Tirar registros por isla", {
    obtained <- select_california_islands(all_islets_data)
    islet <- c("Alcatraz", "Bledos", "Pajaros", "Patos")
    are_any_there <- any(islet %in% obtained$Isla)
    expect_true(are_any_there)
  })
})
describe("Agregar registros altos", {
  it("Seleccionar nombre temporada", {
    obtained <- select_initial_year(california_data)
    expected <- c("2018")
    expect_equal(obtained$Temporada[1], expected)
    expect_equal(obtained$Temporada[2], "2019")
  })
  it("Concatenar registros altos", {
    california_data <- tibble::tibble(
      Nidos_altos_por_temporada = c(1, 2),
      Temporada = c("a", "b"),
      "mas notas" = c("n1", "n2")
    )
    all_islets_data <- tibble::tibble(Nidos_activos_por_visita = c(3, 4), Temporada = c("c", "d"))
    expected <- tibble::tibble(Nidos_activos_por_visita = c(1, 2, 3, 4), Temporada = c("a", "b", "c", "d"))
    obtained <- concatenate_california_and_all_islets(california_data, all_islets_data)
    expect_equal(obtained, expected)
  })
})
