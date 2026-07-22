describe("construct_figure_metadata", {
  clean_data_all_islets <- readr::read_csv("/workdir/tests/data/cormorant_all_islets_clean_data.csv")
  island <- "Alcatraz"
  figure_path <- "figures/cormorant_population_trend_alcatraz.png"
  obtained <- construct_figure_metadata(clean_data_all_islets, island, figure_path)
  it("construct json", {
    expected_keys <- c("island", "figure_path", "first_season", "last_season")
    obtained_keys <- names(obtained)
    expect_equal(obtained_keys, expected_keys)
  })
  it("Fill keys from data", {
    obtained_island <- obtained[["island"]]
    expect_equal(obtained_island, island)

    obtained_first_season <- obtained[["first_season"]]
    expected_first_season <- 2000
    expect_equal(obtained_first_season, expected_first_season)

    obtained_last_season <- obtained[["last_season"]]
    expected_last_season <- 2022
    expect_equal(obtained_last_season, expected_last_season)

    obtained_figure_path <- obtained[["figure_path"]]
    expect_equal(obtained_figure_path, figure_path)
  })
  it("Fill island key when there is two islands", {
    islands <- "Bledos_Patos"
    obtained <- construct_figure_metadata(clean_data_all_islets, islands, figure_path)
    obtained_island <- obtained[["island"]]
    expected_island_key <- "Bledos-Patos"
    expect_equal(obtained_island, expected_island_key)
  })
})
