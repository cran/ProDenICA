\name{G1}
\alias{G1}
\alias{G0}
\title{
FastICA contrast functions.
}
\description{
contrast functions for computing the negentropy criteria used in
FastICA; see references.
}
\usage{
G1(s, a=1)
G0(s, a=1)
}
\arguments{
  \item{s}{estimated independent component}
  \item{a}{additional tuning parameter (only used in \code{G1})}
}
\value{
  a list with components
  \item{Gs}{contrast function evaluated at values of x. \code{mean(Gs)}
    is measure of negentropy.}
  \item{gs}{estimated first derivative of \code{Gs} at x}
  \item{gps}{estimated second derivative of \code{Gs} at x}
  }
\references{Hyvarinen, A., Karhunen, J. and Oja, E. (2001). Independent Component
  Analysis, Wiley, New York\cr
  Hastie, T. and Tibshirani, R. (2003) \emph{Independent Component Analysis
  through Product Density Estimation} in \emph{Advances in Neural Information
  Processing Systems 15} (Becker, S. and Obermayer, K., eds), MIT Press,
  Cambridge, MA. pp 649-656\cr
Hastie, T., Tibshirani, R. and Friedman, J. (2009) Elements of
Statistical Learning (2nd edition), Springer.\cr
\url{https://hastie.su.domains/ElemStatLearn/printings/ESLII_print12_toc.pdf}
}
\author{
Trevor Hastie and Rob Tibshirani
}
\seealso{
\code{GPois} and \code{ProDenICA}
}
\examples{p=2
### Can use letters a-r below for dist
dist="n" 
N=1024
A0<-mixmat(p)
s<-scale(cbind(rjordan(dist,N),rjordan(dist,N)))
x <- s \%*\% A0
fit=ProDenICA(x,Gfunc=G1, whiten=TRUE)
}
\keyword{distribution}
