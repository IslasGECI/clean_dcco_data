describe("Sum burrows quantity by season", {
  it("sum_by_season", {
    data_by_season_and_islet <- readr::read_csv("/workdir/tests/data/concatenated_california_data.csv", show_col_types = FALSE)
    obtained <- sum_by_season(data_by_season_and_islet)
    obtained_column_length <- ncol(obtained)
    expected_column_length <- 2
    expect_equal(obtained_column_length, expected_column_length)
    obtained_row_length <- nrow(obtained)
    expected_row_length <- 10
    expect_equal(obtained_row_length, expected_row_length)
  })
})
