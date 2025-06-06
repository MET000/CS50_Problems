load("zelda.RData")

zelda <- zelda |>
  group_by(title) |>
  slice_min(order_by = year) |>
  arrange(year, title, system) |>
  ungroup()

save(zelda, file = "3.RData")
