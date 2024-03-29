% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.qc.multipanelplot.R
\name{get.qc.multipanelplot}
\alias{get.qc.multipanelplot}
\title{Generates the multipanel plot of heatmap and barplot}
\usage{
get.qc.multipanelplot(
  barplot,
  heatmap,
  filename = NULL,
  width = 10,
  height = 8,
  layout.height = 2,
  layout.width = 1,
  plot.objects.heights = c(1, 3),
  y.spacing = -1,
  ylab.axis.padding = -19,
  left.padding = 8,
  main = "QC Summary",
  main.cex = 1,
  ...
)
}
\arguments{
\item{barplot}{A barplot of the samples aggregated score}

\item{heatmap}{A heatmap of the sign-corrected scores for each sample}

\item{filename}{Filename to output to}

\item{width}{Width of resulting file}

\item{height}{Height of resulting file}

\item{layout.height}{how many plots per column}

\item{layout.width}{how many plots per row.}

\item{plot.objects.heights}{Heights of each row of the plot. Must be vector of same size as layout.height}

\item{y.spacing}{vertical spacing between each plot. Can be single value or vector of length layout.height - 1}

\item{ylab.axis.padding}{padding between axis and y label of plots. Can be single value or vector of length layout.width}

\item{left.padding}{padding from the left side of the frame}

\item{main}{main label text}

\item{main.cex}{main label cex}

\item{...}{The function can also take any parameter that BoutrosLab.plotting.general::create.multipanelplot takes}
}
\value{
The multipanelplot or NULL depending if filename is specified
}
\description{
This function takes the barplot and heatmap and returns the multipanel plot
of the two.
}
