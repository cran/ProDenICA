\name{GPois}
\alias{GPois}
\title{
Fit a tilted Gaussian density via a Poisson GAM}
\description{
This is a contrast method for \code{ProDenICA}. It fits a tilted
Gaussian density estimate by multiplying the Gaussian density by an
exponential tilt function using a cubic smoothing spline
}
\usage{
GPois(x, df = 6, B = 500, order = 1, widen = 1.2, density.return = FALSE, ...)
}
\arguments{
  \item{x}{vector of real values}
  \item{df}{degrees of freedom for the smoothing-spline fit; default is 6}
  \item{B}{number of grid points for density estimate; default is 500}
  \item{order}{A robustness parameter to avoid responding to outliers in
    \code{x}. The range of \code{x} is estimated by the  \code{order}th
    and \code{n-order+1}th order statistics. Default is \code{order=1}}
  \item{widen}{an expansion factor to widen the range of \code{x};
    default is \code{widen=1.2}}
  \item{density.return}{logical variable, with default \code{FALSE}. If
    \code{density.return=TRUE}, the estimated density is returned}
  \item{\dots}{additional arguments to GAM;  typically not used}
}
\details{See Section 14.7.4
of 'Elements of Statistical Learning (Hastie, Tibshirani and Friedman,
2009, 2nd Edition)' for details}
\value{
  a list with components
  \item{Gs}{estimated contrast function, which is the log of the tilting
    function, evaluated at the original values of \code{x}. \code{mean(Gs)}
    is measure of negentropy}
  \item{gs}{estimated first derivative of \code{Gs} at \code{x}}
  \item{gps}{estimated second derivative of \code{Gs} at \code{x}}
  \item{density}{if \code{density.return=TRUE}, a list with components
    \code{$x} the grid of B values of \code{x}, and \code{$y} the estimated
    density.}
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
  \code{ProDenICA}, \code{G1} and \code{G0}
}
\examples{
p=2
### Can use letters a-r below for dist
dist="n" 
N=1024
A0<-mixmat(p)
s<-scale(cbind(rjordan(dist,N),rjordan(dist,N)))
x <- s \%*\% A0
fit=ProDenICA(x,Gfunc=GPois, whiten=TRUE, density=TRUE)
par(mfrow=c(2,1))
plot(fit)
}
\keyword{smooth}
\keyword{distribution}
