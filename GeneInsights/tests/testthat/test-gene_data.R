test_that("gene_data returns a tibble with expected columns for a valid gene", {
  # Use a known valid gene symbol
  valid_gene <- "BRCA1"
  result <- gene_data(valid_gene)

  # Check that the result is a tibble
  expect_true(is_tibble(result))

  # Check that the result has the correct columns
  expected_cols <- c("Gene_name",
                     "Gene_Ensembl_ID",
                     "Canonical_Transcript",
                     "Number_of_Transcripts",
                     "Chromosome",
                     "Protein_Name",
                     "Protein_Length")

  expect_true(all(expected_cols %in% colnames(result)))

})

test_that("gene_data throws an error for an invalid gene symbol", {
  # Use a gene symbol that is unlikely to be valid
  invalid_gene <- "InvalidGeneSymbol"
  # Use a empty string as input
  empty_string <- ""
  # Check that the function returns an error
  expect_error(gene_data(invalid_gene), "Invalid gene name or empty input!")
  expect_error(gene_data(empty_string), "Invalid gene name or empty input!")
})
