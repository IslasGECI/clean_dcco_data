filter_by_island <- function(data, island) {
  data |> dplyr::filter(Isla == island)
}
