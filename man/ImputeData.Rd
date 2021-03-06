% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mice_extentions.R
\name{ImputeData}
\alias{ImputeData}
\title{ImputeData - the mice function with a droplist}
\usage{
ImputeData(data, m = 10, maxit = 15, droplist = NULL)
}
\arguments{
\item{data}{A data frame with at least one missing (NA) value.}

\item{m}{The number of complete data sets generated by the imputation procedure}

\item{maxit}{The number of iterations in the Gibbs "chained equations" imputation
procedure. the mice package defaults to 5, but the mice documentation
mentions that 15-20 should be sufficient.}

\item{droplist}{Variables to be excluded from the imputation}
}
\description{
A wrapper around the mice function that provides one additional feature,
a "droplist" that allows certain variables not to be used in the imputation
effort, for instance categorical variables with many levels that would slow
down the imputation
}
\examples{
data(testdata)
head(testdata)

# a multiply imputed data set, or mids object
mids <- ImputeData(testdata)

# a single imputation
complete.1 <- complete(mids, 1)
head(complete.1)

# another imputation
complete.2 <- complete(mids, 2)
head(complete.2)

mids.2 <- ImputeData(testdata, m = 5, maxit = 5, droplist = c("w"))
}
\references{
Stef van Buuren, Karin Groothuis-Oudshoorn (2011). mice: Multivariate
Imputation by Chained Equations in R. Journal of Statistical Software,
45(3), 1-67. URL http://www.jstatsoft.org/v45/i03/.
}
