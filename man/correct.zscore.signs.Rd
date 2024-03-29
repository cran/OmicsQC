% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/correct.zscore.signs.R
\name{correct.zscore.signs}
\alias{correct.zscore.signs}
\title{Corrects the z-scores signs according to the metrics}
\usage{
correct.zscore.signs(
  zscores,
  signs.data,
  metric.col.name = "Metric",
  signs.col.name = "Sign",
  filename = NULL
)
}
\arguments{
\item{zscores}{A dataframe whose rows are samples and each column a QC metric, entries are z-scores}

\item{signs.data}{A dataframe of two columns, the metric names and the sign of the metric}

\item{metric.col.name}{The name of the column in signs.data that stores the metric name}

\item{signs.col.name}{The name of the column in signs.data that stores sign as 'neg' or 'pos'}

\item{filename}{A filename where to save data. If NULL data will not be saved to file}
}
\value{
A dataframe whose rows are the QC metrics, and columns are samples with the z-scores if they are negative
}
\description{
For some metrics a high z-score is good, while for others a low
one is good. This function corrects for that so that a negative z-score
is a poor score for every metric. It then sets all positive scores
to zero.
}
