% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis_functions.R
\name{GetEstimates}
\alias{GetEstimates}
\title{generalized fitted model (gfo) constructor}
\usage{
GetEstimates(data, formula, family, null.model, random.terms, ts.model)
}
\arguments{
\item{data}{a data.frame or mids object}

\item{formula}{a formula that optionally contains random effects lme4 style}

\item{family}{one of the family functions (e.g., binomial), not in quotations}

\item{null.model}{the reduced model to be used in p-value computations}

\item{random.terms}{the vector of random terms from the model formula}

\item{ts.model}{a time series residual structure from the lme package,
currently only "ar1" is implemented}
}
\value{
a gfo S3 object
}
\description{
generalized fitted model (gfo) constructor
}
