describe("Sum maximum nest of two Islands", {
  maximum_nest_counts_by_month <- tibble::tibble(
    year_month = c("Nov/2021", "Nov/2021", "Nov/2021", "Dic/2021", "Dic/2021", "Dic/2022"),
    Isla = c("Bledos", "Patos", "Alcatraz", "Bledos", "Patos", "Patos"),
    Temporada = c(2021, 2021, 2021, 2021, 2021, 2022),
    Nidos_activos_por_visita = c(1, 2, 999, 100, 200, 300)
  )
  obtained <- sum_monthly_maximum_nest_counts_of_two_islands(maximum_nest_counts_by_month, "Bledos", "Patos")
  print(obtained)
  it("assert shape", {
    expected_rows <- 3
    obtained_rows <- nrow(obtained)
    expect_equal(obtained_rows, expected_rows)
  })
  it("assert sum is by given islands", {
    obtained_sum <- obtained$Nidos_activos_por_visita[year_month == "Nov/2021"]
    expected_sum <- 3
    expect_equal(obtained_sum, expected_sum)
  })
})
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
  obtained <- compute_maximum_nests_by_month_and_island(nest_counts, max_nest_count)
  it("Assert shape", {
    obtained_rows <- nrow(obtained)
    expected_rows <- 5
    expect_equal(obtained_rows, expected_rows)
  })
  it("Assert maximum per month", {
    obtained_maximum_patos_2021 <- obtained$Nidos_activos_por_visita[obtained$Isla == "Patos" & obtained$Temporada == 2021]
    expect_equal(obtained_maximum_patos_2021, 300)
  })
})
describe("Compute maximum nests from data for the same island and season", {
  it("First example", {
    nests_counts <- readr::read_csv("/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv")
    obtained <- compute_maximum_nests_by_season(nests_counts)
    expected_rows <- 26
    expect_equal(nrow(obtained), expected_rows)
    obtained_columns <- colnames(obtained)
    expected_column <- "Nidos_activos_por_visita"
    expect_true(expected_column %in% obtained_columns)
    obtained_patos_2018_maximum <- obtained$Nidos_activos_por_visita[obtained$Isla == "Patos" & obtained$Temporada == 2018]
    expect_equal(obtained_patos_2018_maximum, 445)
  })
})
