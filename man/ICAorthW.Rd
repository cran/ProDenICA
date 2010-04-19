\name{ICAorthW}
\alias{ICAorthW}
\title{turn a matrix W into an orthogonal matrix
}
\description{
use the SVD to orthogonalize a matrix
}
\usage{
ICAorthW(W)
}
\arguments{
  \item{W}{input matrix}
}
\details{simply replace the D matrix of the SVD of W by the identity}
\value{
orthogonalized version of W
}
\author{
Trevor Hastie
}
\note{
  If W=UDV', then returns UV'
}
\examples{W0 <- matrix(rnorm(2*2), 2, 2)
W0 <- ICAorthW(W0)
}
\keyword{multivariate}
