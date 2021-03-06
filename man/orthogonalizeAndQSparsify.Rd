% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multiscaleSVDxpts.R
\name{orthogonalizeAndQSparsify}
\alias{orthogonalizeAndQSparsify}
\title{sparsify a matrix}
\usage{
orthogonalizeAndQSparsify(v, sparsenessQuantile = 0.5,
  positivity = "either")
}
\arguments{
\item{v}{input matrix}

\item{sparsenessQuantile}{quantile to control sparseness - higher is sparser}

\item{positivity}{restrict to positive or negative solution (beta) weights.
choices are positive, negative or either as expressed as a string.}
}
\value{
matrix
}
\description{
This implements a quantile based sparsification operation
}
\examples{

mat<-replicate(100, rnorm(20))
mat = orthogonalizeAndQSparsify( mat )

}
\author{
Avants BB
}
