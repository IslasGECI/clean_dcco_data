describe("write_figure_metadata", {
  clean_data_all_islets <- readr::read_csv("/workdir/tests/data/cormorant_all_islets_clean_data.csv")
  it("construct json", {
    obtained <- construct_figure_metadata(clean_data_all_islets, "Alcatraz")
    expected_keys <- c("island", "figure_path", "first_season", "last_season")
    obtained_keys <- names(obtained)
    expect_equal(obtained_keys, expected_keys)
  })
})
