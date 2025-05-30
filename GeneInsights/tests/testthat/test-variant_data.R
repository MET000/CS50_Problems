test_that("variant_data returns a list with two tibbles for a valid gene", {
  # Use a known valid gene Ensembl id
  valid_ensembl_gene_id <- "ENSG00000012048"
  result <- variant_data(valid_ensembl_gene_id)

  # Expect a list with 2 elements
  expect_type(result, "list")
  expect_length(result, 2)

  # Check that each element is a data frame
  expect_true(inherits(result[[1]], "data.frame"))
  expect_true(inherits(result[[2]], "data.frame"))

  # Expected columns for the summary frequency table
  expected_freq_cols <- c("consequence_type_tv", "count")
  expect_true(all(expected_freq_cols %in% colnames(result[[1]])))

  # Expected columns for the detailed missense variants table
  expected_missense_cols <- c("refsnp_id", "allele", "ensembl_peptide_allele",
                              "position", "sift_score", "polyphen_score", "clinical_significance")
  expect_true(all(expected_missense_cols %in% colnames(result[[2]])))
})
