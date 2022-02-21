\name{amari}
\alias{amari}
\title{
Compute the 'Amari' distance between two matrices
}
\description{
The Amari distance is a measure between two nonsingular matrices. Useful for
checking for convergence in ICA algorithms, and for comparing solutions.
}
\usage{
amari(V, W, orth = FALSE)
}
\arguments{
  \item{V}{
first matrix
}
  \item{W}{
second matrix
}
  \item{orth}{
are the matrices orthogonal; default is \code{orth=FALSE}
}
}
\details{
Formula is given in second reference below, page 570.
}
\value{a numeric distance  metween 0 and 1}
\references{
Bach, F. and Jordan, M. (2002). Kernel independent component analysis,
Journal of Machine Learning Research 3: 1-48\cr
Hastie, T., Tibshirani, R. and Friedman, J. (2009) Elements of
Statistical Learning (2nd edition), Springer.\cr
\url{https://hastie.su.domains/ElemStatLearn/printings/ESLII_print12_toc.pdf}
}
\author{
Trevor Hastie
}
\seealso{\code{ProDenICA}
}
\examples{
dist="n" 
N=1024
p=2
A0<-mixmat(p)
s<-scale(cbind(rjordan(dist,N),rjordan(dist,N)))
x <- s \%*\% A0
###Whiten the data
x <- scale(x, TRUE, FALSE)
sx <- svd(x)	### orthogonalization function
x <- sqrt(N) * sx$u
target <- solve(A0)
target <- diag(sx$d) \%*\% t(sx$v) \%*\% target/sqrt(N)
W0 <- matrix(rnorm(2*2), 2, 2)
W0 <- ICAorthW(W0)
W1 <- ProDenICA(x, W0=W0,trace=TRUE,Gfunc=G1)$W
fit=ProDenICA(x, W0=W0,Gfunc=GPois,trace=TRUE, density=TRUE)
W2 <- fit$W
#distance of FastICA from target
amari(W1,target)
#distance of ProDenICA from target
amari(W2,target)
}
\keyword{multivariate}

