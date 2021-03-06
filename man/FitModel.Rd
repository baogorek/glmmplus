% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis_functions.R
\name{FitModel}
\alias{FitModel}
\title{Forward Selection for Generalized (Mixed) Linear Models with Missing Data}
\usage{
FitModel(formula, data, family = gaussian, ts.model = NULL)
}
\arguments{
\item{formula}{A formula which may contain random effects according to the
lme4 package's specification.}

\item{data}{Either a mids object from the mice package, or a data frame.}

\item{family}{Any family accepted by glm or lmer. Do not use quotation marks.}

\item{ts.model}{a time series residual structure from the lme package,
currently only "ar1" is implemented}
}
\description{
Creates a generalized fitted object.
}
\examples{
# A sample data set with testdata values
head(testdata)

# creating a Muliply Imputed Data Set (mids) object
my.mids <- ImputeData(testdata, m = 5, maxit = 5)

# a single imputation
complete1 <- complete(my.mids)

# Backwards elimination for fixed effect models
FitModel(y ~ x + w + z, data = complete1)
FitModel(y ~ x + w + z, data = my.mids)

# Backwards elimination for mixed (fixed and random) models
FitModel(y ~ (1 | factor.1) + x + w + z, data = complete1)
FitModel(y ~ (1 | factor.1) + x + w + z, data = my.mids)
}
\references{
Douglas Bates and Martin Maechler (2010).
  lme4: Linear mixed-effects models using S4 classes. R package
 version 0.999375-37. http://CRAN.R-project.org/package=lme4

Stef van Buuren, Karin Groothuis-Oudshoorn (2011).
mice: Multivariate Imputation by Chained Equations in R. Journal of
Statistical Software, 45(3), 1-67. URL http://www.jstatsoft.org/v45/i03/.
}
