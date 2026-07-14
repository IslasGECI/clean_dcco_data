describe("Compute maximum nests from data for the same island and season", {
  it("First example", {
    nests_counts <- readr::read_csv("tests/testthat/data/conteo_nidos_cormoran_todas_islas.csv")
    obtained <- compute_maximum_nests(nests_counts)
    expected_rows <- 31
    expect_equal(nrow(obtained), expected_rows)
  })
})
