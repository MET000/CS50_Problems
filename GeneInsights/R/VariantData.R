variant_data <- function(gene_symbol){
  message('Your data is being loaded, this may take a couple of minutes. Thank you for your patience!')
  snpmart = useEnsembl(biomart = "snp", dataset="hsapiens_snp", mirror = "www")

  data <- getBM(attributes = c('refsnp_id',
                               'allele',
                               'sift_score',
                               'polyphen_score',
                               'consequence_type_tv',
                               'ensembl_peptide_allele',
                               'ensembl_transcript_stable_id',
                               'clinical_significance',
                               'translation_start'),
              filters = c('ensembl_gene'),
              values = list(gene_symbol),
              mart = snpmart)

  variants_count <- data |>
    group_by(consequence_type_tv) |>
    summarize(count = n())

  missense_variants_data <- data |>
    filter(consequence_type_tv == 'missense_variant') |>
    dplyr::select(
      refsnp_id,
      allele,
      ensembl_peptide_allele,
      position = translation_start,
      sift_score,
      polyphen_score,
      clinical_significance
    ) |>
    arrange(position)

  return(list(variants_count, missense_variants_data))
}
