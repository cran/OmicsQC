% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cosine.similarity.iterative.R
\name{cosine.similarity.iterative}
\alias{cosine.similarity.iterative}
\title{Tests the accumulated quality scores for outliers using cosine similarity}
\usage{
cosine.similarity.iterative(
  quality.scores,
  no.simulations,
  distribution = c("lnorm", "weibull", "norm", "gamma", "exp", "cauchy", "logis"),
  trim.factor = 0.05,
  alpha.significant = 0.05
)
}
\arguments{
\item{quality.scores}{A dataframe with columns 'Sum' (of scores) and 'Sample', i.e. the output of accumulate.zscores}

\item{no.simulations}{The number of datasets to simulate}

\item{distribution}{A distribution to test, will default to 'lnorm'}

\item{trim.factor}{What fraction of values of each to trim to get parameters without using extremes}

\item{alpha.significant}{Alpha value for significance}
}
\value{
Results in the form of a named list
\describe{
\item{no.outliers}{Number of nominated outliers}
\item{outlier.labels}{Outlier IDs, corresponding to \code{Sample} column of \code{quality.scores}}
}
}
\description{
This function takes quality.scores, trims it and fits it to the distribution given.
It then iteratively tests the largest datapoint compared a null distribution of size
no.simulations. If the largest datapoint has a significant p-value it tests the 2nd largest
one and so on. The function supports the following distributions:
\itemize{
\item 'weibull'
\item 'norm'
\item 'gamma'
\item 'exp'
\item 'lnorm'
\item 'cauchy'
\item 'logis'
}
}
