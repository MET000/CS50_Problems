test_that("Function returns a ggplot object", {
  # Prepare sample data
  test_data <- data.frame(
    variant = c("Missense", "Nonsense", "Synonymous"),
    count   = c(50, 30, 20)
  )

  output_plot <- treemap_plot(data = test_data,
                                    x = test_data$variant,
                                    y = test_data$count)

  # Verify that the output is a ggplot object
  expect_s3_class(output_plot, "ggplot")
})

test_that("Function creates a correctly formatted 'new' column", {
  # Create a simple dataset
  test_data <- data.frame(
    variant = c("Missense"),
    count   = c(100)
  )

  output_plot <- treemap_plot(data = test_data,
                                    x = test_data$variant,
                                    y = test_data$count)

  # Expected label construction
  expected_label <- paste0("Missense (", 100, " - ", round(100 / 100 * 100, digits = 2), "%", ")")

  # Check that the new column in the ggplot data contains the expected label
  expect_true(expected_label %in% output_plot$data$new)
})

test_that("Function handles zero counts without error", {
  # Create data where all counts are zero
  zero_data <- data.frame(
    variant = c("Missense", "NoVariant"),
    count   = c(0, 0)
  )

  # The function should still return a plot, even if percentages are NaN.
  # Calculate expected percentage: 0/0 will yield NaN, but check that the plot is generated.
  output_plot <- treemap_plot(data = zero_data,
                                    x = zero_data$variant,
                                    y = zero_data$count)

  expect_s3_class(output_plot, "ggplot")
})