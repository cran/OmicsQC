## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = '#>'
  );

## ----load_dependencies, echo=FALSE, message=FALSE, warning = FALSE------------
library(kableExtra);
library(dplyr);

## ----echo=FALSE, out.width='80%'----------------------------------------------
knitr::include_graphics('omicsQCFlowchart.png')

## ----setup, warning = FALSE, message = FALSE----------------------------------
library(OmicsQC);

# Loading Data
data('example.qc.dataframe'); # Metric scores across samples
data('sign.correction'); # The directionality of metrics
data('ylabels'); # Formatted metric labels for heatmap

## ----print_example_data, echo=FALSE-------------------------------------------
head(example.qc.dataframe) %>%
  kbl() %>%
  kable_styling()

## ----calculate_zscores--------------------------------------------------------
zscores <- zscores.from.metrics(qc.data = example.qc.dataframe);

## ----print_calculated_zscores, echo=FALSE-------------------------------------
head(zscores) %>%
  kbl() %>%
  kable_styling()

## ----print_sign_correction_dataframe, echo=FALSE------------------------------
head(sign.correction) %>%
  kbl() %>%
  kable_styling()

## ----correct_zscores----------------------------------------------------------
zscores.corrected <- correct.zscore.signs(
  zscores = zscores,
  signs.data = sign.correction,
  metric.col.name = 'Metric',
  signs.col.name = 'Sign'
  );

## ----print_corrected_zscores, echo=FALSE--------------------------------------
head(zscores.corrected) %>%
  kbl() %>%
  kable_styling()

## ----accumulate_zscores-------------------------------------------------------
quality.scores <- accumulate.zscores(zscores.corrected = zscores.corrected);

## ----print_accumulated_zscores, echo=FALSE------------------------------------
head(quality.scores) %>%
  kbl() %>%
  kable_styling()

## ----fit_distributions--------------------------------------------------------
fit.results <- fit.and.evaluate(
    quality.scores = quality.scores,
    trim.factor = 0.15
    );

## ----print_fit_distribution_results, echo=FALSE-------------------------------
fit.results %>%
  kbl() %>%
  kable_styling()

## ----cosine_similarity_iterative----------------------------------------------
outlier.detect.iterative.res <- cosine.similarity.iterative(
    quality.scores = quality.scores,
    distribution = 'lnorm',
    no.simulations = 1000,
    trim.factor = 0.15,
    alpha.significant = 0.05
    );

## ----print_iterative_number_outliers------------------------------------------
print(outlier.detect.iterative.res$no.outliers);

## ----print_iterative_outliers-------------------------------------------------
print(outlier.detect.iterative.res$outlier.labels);

## ----cosine_similarity_cutoff-------------------------------------------------
outlier.detect.cutoff.res <- cosine.similarity.cutoff(
    quality.scores = quality.scores,
    distribution = 'lnorm',
    no.simulations = 1000,
    trim.factor = 0.15,
    alpha.significant = 0.05
    );

## ----cutoff-------------------------------------------------------------------
print(outlier.detect.cutoff.res$cutoff);

## ----cutoff_number_outliers---------------------------------------------------
print(outlier.detect.cutoff.res$no.outliers);

## ----cutoff_outliers----------------------------------------------------------
print(outlier.detect.cutoff.res$outlier.labels);

## ----barplot_with_cutoff------------------------------------------------------
qc.barplot <- get.qc.barplot(
    quality.scores = quality.scores,
    abline.h = - outlier.detect.cutoff.res$cutoff
    );

## ----print_barplot, echo=FALSE, out.width='80%'-------------------------------
knitr::include_graphics('barplot.png');

## ----heatmap------------------------------------------------------------------
qc.heatmap <- get.qc.heatmap(
  zscores = zscores.corrected,
  quality.scores = quality.scores,
  yaxis.lab = ylabels
  );

## ----print_heatmap, echo=FALSE, out.width='80%'-------------------------------
knitr::include_graphics('heatmap.png');

## ----multipanelplot, eval=FALSE-----------------------------------------------
#  qc.multipanel <- get.qc.multipanelplot(
#    barplot = qc.barplot,
#    heatmap = qc.heatmap
#    );

## ----print_multipanelplot, echo=FALSE, out.width='80%'------------------------
knitr::include_graphics('multipanelplot.png');

