\name{gene_data}
\alias{gene_data}
\title{Retrieve Gene-Related Information using Ensembl BiomaRt}
\description{
  This function retrieves gene-related information for a given gene symbol from the Ensembl database. It extracts various attributes such as Ensembl gene ID, canonical transcript ID, peptide ID, chromosome name, gene description, and CDS length of the canonical transcript. It also counts the number of transcripts associated with the given gene.
}
\usage{
gene_data(gene_symbol)
}
\arguments{
  \item{gene_symbol}{
    A character string representing the gene symbol to query in the Ensembl database.
  }
}
\details{
  The function uses the Ensembl BioMart service to fetch data attributes related to the specified gene symbol. It identifies the canonical transcript for the gene and calculates its protein sequence length in amino acids. The function also returns descriptive information about the gene, such as its name, chromosome location, and number of transcripts.
}
\value{
  A character vector with the following elements:
  \itemize{
    \item Ensembl Gene ID
    \item Gene Name
    \item Ensembl Peptide ID (protein name)
    \item Canonical Transcript ID
    \item Protein Sequence Length of The Canonical Transcript (in amino acids)
    \item Chromosome Name
    \item Gene Description
    \item Number of Transcripts
  }
}
\examples{
# Example usage:
library(biomaRt)
library(tidyverse)

# Retrieve gene data of a gene
gene_data <- gene_data("TP53")

# View the data of interest
print(gene_data)
}
\seealso{
  \code{\link[biomaRt]{useEnsembl}}, \code{\link[biomaRt]{getBM}}
}
