% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis_functions.R
\name{complete}
\alias{complete}
\title{A generic version of mice's complete function}
\usage{
complete(df, i)
}
\arguments{
\item{df}{a data.frame or mids object}

\item{i}{index for the multiply imputed data set within a mids object. Does
nothing if the first argument is a data.frame}
}
\description{
This allows applying complete() to a mids object or a data.frame
}
