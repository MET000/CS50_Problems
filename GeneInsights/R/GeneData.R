gene_data <- function(gene_symbol){


    ensembl <- useEnsembl(biomart = 'ensembl', dataset = "hsapiens_gene_ensembl")

    if (!gene_symbol %in% getBM(attributes = 'external_gene_name', mart=ensembl)$external_gene_name){
      stop("Invalid gene name or empty input!", call. = FALSE)
    }

    data <- getBM(attributes = c('ensembl_transcript_id',
                                 'transcript_is_canonical',
                                 'ensembl_peptide_id',
                                 'chromosome_name',
                                 'external_gene_name',
                                 'description',
                                 'ensembl_gene_id'),
                      filters = c('external_gene_name'),
                      values = list(gene_symbol),
                      mart = ensembl)



    number_transcripts <- summarize(group_by(data, external_gene_name), n_t = n())$n_t
    ensembl_gene_id <- data$ensembl_gene_id[1]
    canonical_transcript <- subset(data, transcript_is_canonical == 1)$ensembl_transcript_id
    chromosome_name <- data$chromosome_name[1]
    gene_name <- data$external_gene_name[1]
    desc <- data$description[1]
    ensembl_peptide_id <- data$ensembl_peptide_id[1]

    cds_lengths <- getBM(attributes = c('cds_length', 'ensembl_transcript_id'),
                  filters = c('ensembl_transcript_id'),
                  values = list(canonical_transcript),
                  mart = ensembl)

    protein_length_canonical <- ((subset(cds_lengths, ensembl_transcript_id == canonical_transcript)$cds_length) / 3) - 1

    table <- data.frame(
      "Gene_name" = gene_name,
      "Gene_Ensembl_ID" = ensembl_gene_id,
      "Canonical_Transcript" = canonical_transcript,
      "Number_of_Transcripts" = as.numeric(number_transcripts),
      "Chromosome" = chromosome_name,
      "Protein_Name" = ensembl_peptide_id,
      "Protein_Length" = as.numeric(protein_length_canonical)
    )

    return(tibble(table))
}
