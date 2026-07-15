describe("Compute maximum nests from data for the same island and season", {
  it("First example", {
    nests_counts <- readr::read_csv("/workdir/tests/data/conteo_nidos_cormoran_todas_islas.csv")
    obtained <- compute_maximum_nests(nests_counts)
    print(obtained)
    expected_rows <- 31
    expect_equal(nrow(obtained), expected_rows)
    obtained_columns <- colnames(obtained)
    expected_column <- "Nidos_activos_por_visita"
    expect_true(expected_column %in% obtained_columns)
    obtained_patos_2018_maximum <- obtained[[obtained$Isla == "Patos" & obtained$Temporada == 2018, expected_column]]
    expect_equal(obtained_patos_2018_maximum, 445)
  })
})
