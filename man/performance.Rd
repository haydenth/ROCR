\name{performance}
\alias{performance}

\title{Function to create performance objects}
\description{All kinds of predictor evaluations are performed using
  this function.
}

\usage{
performance(prediction.obj, measure, x.measure="cutoff", \dots)
}

\arguments{
  \item{prediction.obj}{An object of class \code{prediction}.}
  \item{measure}{Performance measure to use for the evaluation. A
    complete list of the performance measures that are available for \code{measure}
    and \code{x.measure} is given in the 'Details' section.}
  \item{x.measure}{A second performance measure. If different from the
    default, a two-dimensional curve, with \code{x.measure} taken to be the
    unit in direction of the x axis, and \code{measure} to be the unit in
    direction of the y axis, is created. This curve is parametrized with
    the cutoff.}
  \item{...}{Optional arguments (specific to individual performance
    measures).}
}


\details{Here is the list of available performance measures. Let Y and
  \eqn{\hat{Y}}{Yhat} be random variables representing the class and the prediction for
  a randomly drawn sample, respectively. We denote by
  \eqn{\oplus}{+} and \eqn{\ominus}{-} the positive and
  negative class, respectively. Further, we use the following
  abbreviations for empirical quantities: P (\# positive
  samples), N (\# negative samples), TP (\# true positives), TN (\# true
  negatives), FP (\# false positives), FN (\# false negatives).
  
  \describe{
    \item{\code{acc}:}{Accuracy. \eqn{P(\hat{Y}=Y)}{P(Yhat = Y)}. Estimated
    as: \eqn{\frac{TP+TN}{P+N}}{(TP+TN)/(P+N)}.}
    \item{\code{err}:}{Error rate. \eqn{P(\hat{Y}\ne Y)}{P(Yhat !=
	Y)}. Estimated as: \eqn{\frac{FP+FN}{P+N}}{(FP+FN)/(P+N)}.}
    \item{\code{fpr}:}{False positive rate. \eqn{P(\hat{Y}=\oplus | Y =
	\ominus)}{P(Yhat = + | Y = -)}. Estimated as:
      \eqn{\frac{FP}{N}}{FP/N}.}
    \item{\code{fall}:}{Fallout. Same as \code{fpr}.}
    \item{\code{tpr}:}{True positive
      rate. \eqn{P(\hat{Y}=\oplus|Y=\oplus)}{P(Yhat = + | Y = +)}. Estimated
      as: \eqn{\frac{TP}{P}}{TP/P}.}
    \item{\code{rec}:}{Recall. Same as \code{tpr}.}
    \item{\code{sens}:}{Sensitivity. Same as \code{tpr}.}
    \item{\code{fnr}:}{False negative
      rate. \eqn{P(\hat{Y}=\ominus|Y=\oplus)}{P(Yhat = - | Y =
	+)}. Estimated as: \eqn{\frac{FN}{P}}{FN/P}.}
    \item{\code{miss}:}{Miss. Same as \code{fnr}.}
    \item{\code{tnr}:}{True negative rate. \eqn{P(\hat{Y} =
	\ominus|Y=\ominus)}{P(Yhat = - | Y = -)}.}
    \item{\code{spec}:}{Specificity. Same as \code{tnr}.}
    \item{\code{ppv}:}{Positive predictive
      value. \eqn{P(Y=\oplus|\hat{Y}=\oplus)}{P(Y = + | Yhat =
	+)}. Estimated as: \eqn{\frac{TP}{TP+FP}}{TP/(TP+FP)}.}
    \item{\code{prec}:}{Precision. Same as \code{ppv}.}
    \item{\code{npv}:}{Negative predictive
      value. \eqn{P(Y=\ominus|\hat{Y}=\ominus)}{P(Y = - | Yhat =
	-)}. Estimated as: \eqn{\frac{TN}{TN+FN}}{TN/(TN+FN)}.}
    \item{\code{pcfall}:}{Prediction-conditioned
      fallout. \eqn{P(Y=\ominus|\hat{Y}=\oplus)}{P(Y = - | Yhat =
	+)}. Estimated as: \eqn{\frac{FP}{TP+FP}}{FP/(TP+FP)}.}
    \item{\code{pcmiss}:}{Prediction-conditioned
      miss. \eqn{P(Y=\oplus|\hat{Y}=\ominus)}{P(Y = + | Yhat =
	-)}. Estimated as: \eqn{\frac{FN}{TN+FN}}{FN/(TN+FN)}.}
    \item{\code{rpp}:}{Rate of positive predictions. \eqn{P( \hat{Y} =
	\oplus)}{P(Yhat = +)}. Estimated as: (TP+FP)/(TP+FP+TN+FN).}
    \item{\code{rnp}:}{Rate of negative predictions. \eqn{P( \hat{Y} =
	\ominus)}{P(Yhat = -)}. Estimated as: (TN+FN)/(TP+FP+TN+FN).}
    \item{\code{phi}:}{Phi correlation coefficient. \eqn{\frac{TP \cdot
	  TN - FP \cdot FN}{\sqrt{ (TP+FN) \cdot (TN+FP) \cdot (TP+FP)
	    \cdot (TN+FN)}}}{(TP*TN -
	FP*FN)/(sqrt((TP+FN)*(TN+FP)*(TP+FP)*(TN+FN)))}. Yields a
      number between -1 and 1, with 1 indicating a perfect
      prediction, 0 indicating a random prediction. Values below 0
      indicate a worse than random prediction.}
    \item{\code{mat}:}{Matthews correlation coefficient. Same as \code{phi}.}
    \item{\code{mi}:}{Mutual information. \eqn{I(\hat{Y},Y) := H(Y) -
	H(Y|\hat{Y})}{I(Yhat, Y) := H(Y) - H(Y | Yhat)}, where H is the
      (conditional) entropy. Entropies are estimated naively (no bias
      correction).}
    \item{\code{chisq}:}{Chi square test statistic. \code{?chisq.test}
      for details. Note that R might raise a warning if the sample size
      is too small.}
    \item{\code{odds}:}{Odds ratio. \eqn{\frac{TP \cdot TN}{FN \cdot
	  FP}}{(TP*TN)/(FN*FP)}. Note that odds ratio produces
      Inf or NA values for all cutoffs corresponding to FN=0 or
      FP=0. This can substantially decrease the plotted cutoff region.}
    \item{\code{lift}:}{Lift
      value. \eqn{\frac{P(\hat{Y}=\oplus|Y=\oplus)}{P(\hat{Y}=\oplus)}}{P(Yhat = + |
	Y = +)/P(Yhat = +)}.}
    \item{\code{f}:}{Precision-recall F measure (van Rijsbergen, 1979). Weighted
      harmonic mean of precision (P) and recall (R). \eqn{F =
	\frac{1}{\alpha \frac{1}{P} + (1-\alpha)\frac{1}{R}}}{F = 1/
	(alpha*1/P + (1-alpha)*1/R)}. If
      \eqn{\alpha=\frac{1}{2}}{alpha=1/2}, the mean is balanced. A
      frequent equivalent formulation is
      \eqn{F = \frac{(\beta^2+1) \cdot P \cdot R}{R + \beta^2 \cdot
	  P}}{F = (beta^2+1) * P * R / (R + beta^2 * P)}. In this formulation, the mean is
      balanced if \eqn{\beta=1}{beta=1}. Currently, ROCR only accepts the
      alpha version
      as input (e.g. \eqn{\alpha=0.5}{alpha=0.5}). If no value for alpha is given, the mean will be
      balanced by default.}
    \item{\code{rch}:}{ROC convex hull. A ROC (=\code{tpr} vs \code{fpr}) curve with concavities
      (which represent suboptimal choices of cutoff) removed (Fawcett 2001). Since the
      result is already a parametric performance curve, it cannot be
      used in combination with other measures.}
    \item{\code{auc}:}{Area under the ROC curve. This is equal to the value of the
      Wilcoxon-Mann-Whitney test statistic and also the probability that the
      classifier will score are randomly drawn positive sample higher than a
      randomly drawn negative sample. Since the output of
      \code{auc} is cutoff-independent, this
      measure cannot be combined with other measures into a parametric
      curve. The partial area under the ROC curve up to a given false
      positive rate can be calculated by passing the optional parameter
    \code{fpr.stop=0.5} (or any other value between 0 and 1) to \code{performance}.}
    \item{\code{prbe}:}{Precision-recall break-even point. The cutoff(s) where
      precision and recall are equal. At this point, positive and negative
      predictions are made at the same rate as their prevalence in the
      data. Since the output of
      \code{prbe} is just a cutoff-independent scalar, this
      measure cannot be combined with other measures into a parametric curve.}
    \item{\code{cal}:}{Calibration error. The calibration error is the
      absolute difference between predicted confidence and actual reliability. This
      error is estimated at all cutoffs by sliding a window across the
      range of possible cutoffs. The default window size of 100 can be
      adjusted by passing the optional parameter \code{window.size=200}
      to \code{performance}. E.g., if for several
      positive samples the output of the classifier is around 0.75, you might
      expect from a well-calibrated classifier that the fraction of them
      which is correctly predicted as positive is also around 0.75. In a
      well-calibrated classifier, the probabilistic confidence estimates
      are realistic. Only for use with
      probabilistic output (i.e. scores between 0 and 1).}
    \item{\code{mxe}:}{Mean cross-entropy. Only for use with
      probabilistic output. \eqn{MXE :=-\frac{1}{P+N}( \sum_{y_i=\oplus}
	ln(\hat{y}_i) + \sum_{y_i=\ominus} ln(1-\hat{y}_i))}{MXE := - 1/(P+N) \sum_{y_i=+}
	ln(yhat_i) + \sum_{y_i=-} ln(1-yhat_i)}. Since the output of
      \code{mxe} is just a cutoff-independent scalar, this
      measure cannot be combined with other measures into a parametric curve.}
    \item{\code{rmse}:}{Root-mean-squared error. Only for use with
      numerical class labels. \eqn{RMSE:=\sqrt{\frac{1}{P+N}\sum_i (y_i
	  - \hat{y}_i)^2}}{RMSE := sqrt(1/(P+N) \sum_i (y_i -
	yhat_i)^2)}. Since the output of
      \code{rmse} is just a cutoff-independent scalar, this
      measure cannot be combined with other measures into a parametric curve.}
    \item{\code{sar}:}{Score combinining performance measures of different
      characteristics, in the attempt of creating a more "robust"
      measure (cf. Caruana R., ROCAI2004):
      SAR = 1/3 * ( Accuracy + Area under the ROC curve + Root
      mean-squared error ).}
    \item{\code{ecost}:}{Expected cost. For details on cost curves,
      cf. Drummond&Holte 2000,2004. \code{ecost} has an obligatory x
      axis, the so-called 'probability-cost function'; thus it cannot be
    combined with other measures. While using \code{ecost} one is
    interested in the lower envelope of a set of lines, it might be
    instructive to plot the whole set of lines in addition to the lower
    envelope. An example is given in \code{demo(ROCR)}.}
    \item{\code{cost}:}{Cost of a classifier when
      class-conditional misclassification costs are explicitly given.
      Accepts the optional parameters \code{cost.fp} and
      \code{cost.fn}, by which the costs for false positives and
      negatives can be adjusted, respectively. By default, both are set
      to 1.}
  }
}

\value{An S4 object of class performance.}

\references{A detailed list of references can be found on the ROCR
  homepage at \url{http://rocr.bioinf.mpi-sb.mpg.de}.}

\author{Tobias Sing \email{tobias.sing@mpi-sb.mpg.de},
  Oliver Sander \email{osander@mpi-sb.mpg.de}}

\note{Here is how to call 'performance' to create some standard
  evaluation plots:

  \describe{
    \item{ROC curves:}{measure="tpr", x.measure="fpr".}
    \item{Precision/recall graphs:}{measure="prec", x.measure="rec".}
    \item{Sensitivity/specificity plots:}{measure="sens", x.measure="spec".}
    \item{Lift charts:}{measure="lift", x.measure="rpp".}
  }
}

\seealso{\code{\link{prediction}}, \code{\link{prediction-class}},
  \code{\link{performance-class}}, \code{\link{plot.performance}} } 

\examples{
## computing a simple ROC curve (x-axis: fpr, y-axis: tpr)
library(ROCR)
data(ROCR.simple)
pred <- prediction( ROCR.simple$predictions, ROCR.simple$labels)
perf <- performance(pred,"tpr","fpr")
plot(perf)

## precision/recall curve (x-axis: recall, y-axis: precision)
perf1 <- performance(pred, "prec", "rec")
plot(perf1)

## sensitivity/specificity curve (x-axis: specificity,
## y-axis: sensitivity)
perf1 <- performance(pred, "sens", "spec")
plot(perf1)
}
\keyword{classif}
