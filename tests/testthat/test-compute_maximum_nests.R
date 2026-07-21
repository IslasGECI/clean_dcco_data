describe("Compute maximum nests of two Islands", {
  max_nest_count <- tibble::tibble(
    Fecha = c("02/Nov/2020", "02/Nov/2021", "02/Nov/2020"),
    Isla = c(rep("Bledos", 2), "Patos"),
    Temporada = c("2020/2021", "2021/2022", "2020/2021"),
    Nidos_altos_por_temporada = c(10, 20, 30)
  )
  nest_counts <- tibble::tibble(
    Fecha = c("01/Nov/2019", "10/Dic/2021", "15/Dic/2021"),
    Isla = c("Bledos", rep("Patos", 2)),
    Temporada = c(2019, 2021, 2021),
    Nidos_activos_por_visita = c(100, 200, 300)
  )
  obtained <- concatenate_two_islands(nest_counts, max_nest_count)
  it("Assert shape", {
    obtained_rows <- nrow(obtained)
    expected_rows <- 6
    expect_equal(obtained_rows, expected_rows)
  })
})
describe("Compute maximum nests from data for the same island and season", {
  it("First example", {
    nests_counts <- readr::read_csv("/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv")
    obtained <- compute_maximum_nests(nests_counts)
    expected_rows <- 26
    expect_equal(nrow(obtained), expected_rows)
    obtained_columns <- colnames(obtained)
    expected_column <- "Nidos_activos_por_visita"
    expect_true(expected_column %in% obtained_columns)
    obtained_patos_2018_maximum <- obtained$Nidos_activos_por_visita[obtained$Isla == "Patos" & obtained$Temporada == 2018]
    expect_equal(obtained_patos_2018_maximum, 445)
  })
})
