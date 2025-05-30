\name{variant_data}
\alias{variant_data}
\title{Retrieve Variant Data for a Gene using Ensembl BiomaRt}
\description{
  This function retrieves information about gene variants from the Ensembl database using the SNP BioMart. It provides data on variant alleles, functional scores, consequences, and clinical significance for a specified gene.
}
\usage{
variant_data(gene_symbol)
}
\arguments{
  \item{gene_symbol}{
    A character string representing the Ensembl gene id for which variant data should be queried.
  }
}
\details{
  The function connects to the Ensembl SNP BioMart using \code{useEnsembl} and retrieves various variant-related attributes, including:
  \itemize{
    \item Reference SNP ID
    \item Allele
    \item SIFT Score
    \item PolyPhen Score
    \item Consequence Type
    \item Ensembl Peptide Allele
    \item Ensembl Transcript Stable ID
    \item Clinical Significance
    \item Translation Start Position
  }
  Following data retrieval, the function performs two key operations:
  \itemize{
    \item It calculates \code{count} column by grouping the data by consequence type and counting the number of entries in each group.
    \item It extracts detailed information on missense variants, renaming \code{translation_start} to \code{position} and arranging the rows in ascending order of the translation start position, returning this as \strong{missense_variants_data}.
  }
}
\value{
  A list containing two elements:
  \itemize{
    \item \strong{variants_count}: A data frame summarizing the number of variants grouped by consequence type.
    \item \strong{missense_variants_data}: A data frame with detailed information on missense variants, including reference SNP ID, allele, peptide allele, the translation start position (renamed to \code{position}), SIFT score, PolyPhen score, and clinical significance.
  }
}
\examples{
# Example usage:
library(biomaRt)
library(tidyverse)

# Retrieve variant data for the gene "BRCA1"
result <- variant_data("BRCA1")

# View the summary of variants count
print(result[[1]])

# View detailed data on missense variants
print(result[[2]])
}
}
\seealso{
  \code{\link[biomaRt]{useEnsembl}}, \code{\link[biomaRt]{getBM}}, \code{\link[dplyr]{group_by}}, \code{\link[dplyr]{summarize}}, \code{\link[dplyr]{filter}}, \code{\link[dplyr]{select}}
}
