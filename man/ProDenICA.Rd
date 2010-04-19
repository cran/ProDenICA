\name{ProDenICA}
\alias{ProDenICA}
\title{Product Density Independent Component Analysis}
\description{
Fits an ICA model by directly estimating the densities of the
independent components using Poisson GAMs. The densities have the form
of tilted Gaussians, and hense directly estimate the contrast functions
that lead to negentropy measures. This function supports Section 14.7.4
of 'Elements of Statistical Learning (Hastie, Tibshirani and Friedman,
2009, 2nd Edition)'. Models include 'FastICA'. 
}
\usage{
ProDenICA(x, k = p, W0 = NULL, whiten = FALSE, maxit = 20, thresh = 1e-07,
restarts = 0, trace = FALSE, Gfunc = GPois, eps.rank = 1e-07, ...)
}

\arguments{
  \item{x}{input matrix}
  \item{k}{Number of components required, less than or equal to the
  number of columns of x}
  \item{W0}{Optional initial matrix (for comparing algorithms)}
  \item{whiten}{Logical variable - should x be whitened. If TRUE, the SVD of X=UDV' is computed, and U is used (up to
  rank(X) columns). Also k is reduced to min(k,rank(X)). If FALSE (default), it is
  assumed that the user has pre-whitened x (and if not, the function may
  not perform properly)}
  \item{maxit}{Maximum number of iterations; default is 20}
  \item{thresh}{Convergence threshold, in terms of relative change in
  Amari metric; dfault is 1e-7}
  \item{restarts}{Number of random restarts; default is 0}
  \item{trace}{Trace iterations; default is FALSE}
  \item{Gfunc}{Contrast functional which is basis for negentropy
  measure. Default is \code{'GPois'} which fits a tilted Gaussian density using
  a Poisson GAM. Other options are \code{'G1'} (cosh negentropy) and
  \code{'G0'} (kurtosis negentropy)}
  \item{eps.rank}{Threshold for deciding rank of x if option
  \code{whiten=TRUE}. Any singular value less than \code{eps.thresh}
  smaller than the largest is treated as zero}
  \item{\dots}{Additional arguments for \code{Gfunc} areguments}
}
\details{See Section 14.7.4
of \emph{Elements of Statistical Learning} (Hastie, Tibshirani and Friedman,
2009, 2nd Edition)}
\value{
An object of S3 class \code{"ProDenICA"} is returned, with the following components:
\item{W}{Orthonormal matrix that takes the whitened version of x to the
  independent components}
\item{negentropy}{The total negentropy measure of this solution}
\item{s}{the matrix of k independent components}
\item{whitner}{if \code{whiten=TRUE}, the matrix that whitens \code{x},
  else \code{NULL}}
\item{call}{the call that produced this object}
\item{density}{If \code{Gfunc=GPois}, an list of length \code{k} with the density
  estimates for each component}
}
\references{
Hastie, T. and Tibshirani, R. (2003) \emph{Independent Component Analysis
  through Product Density Estimation} in \emph{Advances in Neural Information
  Processing Systems 15} (Becker, S. and Obermayer, K., eds), MIT Press,
  Cambridge, MA. pp 649-656\cr
Hastie, T., Tibshirani, R. and Friedman, J. (2009) Elements of
Statistical Learning (2nd edition), Springer.\cr
\url{http://www-stat.stanford.edu/~hastie/Papers/ESLII.pdf}
}
\author{
Trevor Hastie and Rob Tibshirani
}
\seealso{
\code{GPois}, \code{G1} and \code{plot} method.
}
\examples{
p=2
### Can use letters a-r below for dist
dist="n" 
N=1024
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
par(mfrow=c(2,1))
plot(fit)
}
\keyword{multivariate}
\keyword{distribution}
