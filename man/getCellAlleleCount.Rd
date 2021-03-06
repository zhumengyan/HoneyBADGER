% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepareData.R
\name{getCellAlleleCount}
\alias{getCellAlleleCount}
\title{Get alternative allele count for positions of interest for multiple cells from one bam}
\usage{
getCellAlleleCount(gr, bamFile, indexFile, cellBarcodes, verbose = FALSE,
  n.cores = 1)
}
\arguments{
\item{gr}{GenomicRanges object for positions of interest}

\item{bamFile}{bam file containing all cells indexed by barcode (such as 10X)}

\item{indexFile}{bai index file}

\item{cellBarcodes}{vector of valid cell barcodes annotated as CB in the bam}

\item{verbose}{Boolean of whether or not to print progress and info}

\item{n.cores}{Number of cores; Can parallelize across cells}
}
\value{
refCount reference allele count information for each position of interest
  altCount alternative allele count information for each position of interest
}
\description{
Get alternative allele count for positions of interest for multiple cells from one bam
}
\examples{
\dontrun{
## Get putative hets from ExAC
load(system.file("ExAC", "ExAC_chr1.RData", package = "HoneyBADGER"))
head(snps)
cov <- getCoverage(snps, bamFile, indexFile, verbose=TRUE)
## for the sites with coverage, get all cells
vi <- cov>0
snps.cov <- snps[vi,]
barcodes <- c('AAACATACAAAACG-1', 'AAACATACAAAAGC-1', 'AAACATACAAACAG-1')
mats.chr1 <- getCellAlleleCount(snps.cov, bamFile, indexFile, barcodes, verbose=TRUE, n.cores=10)
}

}
