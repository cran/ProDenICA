\name{mixmat}
\alias{mixmat}
\title{
Generate a random mixing matrix with
condition number between 1 and 2
}
\description{
A simple function for generating a 'well behaved' random square mixing matrix}
\usage{
mixmat(p = 2)
}
\arguments{
  \item{p}{dimnesion of matrix}
}
\details{
Generates a random matrix by constructing its SVD. The singular values
are drawn from a uniform on [1,2], hence guaranteeing a condition number
between 1 and 2}
\value{
a pxp matrix
}
\author{
Trevor Hastie
}
\keyword{multivariate}

