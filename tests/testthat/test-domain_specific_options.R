describe("get_domain_specific_options", {
  it("Defines domain specific options", {
    obtained_options <- get_domain_specific_options()
    expected_options <- c("data-path", "island", "figure-path", "output-path", "historical-data-path", "high-counts-path", "nests-counts-path")
    expect_true(all(expected_options %in% names(obtained_options)))
  })
})
