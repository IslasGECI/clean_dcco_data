describe("write_figure_metadata", {
  clean_data_all_islets <- readr::read_csv("tests/data/cormorant_all_islets_clean_data.csv")
  it("construct json", {
    obtained <- construct_figure_metadata(clean_data_all_islets, "Alcatraz")
  })
})
