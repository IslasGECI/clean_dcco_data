describe("Sum burrows quantity by season", {
  it("sum_by_season", {
    data_by_season_and_islet <- read_csv("tests/data/concatenated_california_data.csv", show_col_types = FALSE)
    sum_by_season(data_by_season_and_islet)
  })
})
