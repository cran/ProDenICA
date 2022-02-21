\name{rjordan}
\alias{rjordan}
\alias{djordan}
\title{
Generate source densities for ICA
}
\description{
Functions for generating the source densities used in Bach and Jordan
(2002), and reused in Hastie and Tibshirani (2003)}
\usage{
rjordan(letter, n, ...)
djordan(letter, x, ...)
}
\arguments{
  \item{letter}{one of the 18 letters \code{a-r}; see Figure 14.42 on page 569 of 'Elements of Statistical Learning'
}
\item{n}{number of samples}
\item{x}{ordinates at which to compute density}
  \item{\dots}{place filler for additional arguments}
}
\details{
This function produces the example densities used in Bach and Jordan
(2002), and copied by Hastie and Tibshirani (2003). They include the
't', uniform, mixtures of exponentials and many mixtures of gaussian
densities. Each are standardized to have mean zero and variance 1.
}
\value{
Either a vector of density values the length of \code{x} for
\code{djordan}, or a vector of \code{n} draws for \code{rjordan}
}
\references{
Bach, F. and Jordan, M. (2002). Kernel independent component analysis,
Journal of Machine Learning Research 3: 1-48\cr
Hastie, T. and Tibshirani, R. (2003) \emph{Independent Component Analysis
  through Product Density Estimation} in \emph{Advances in Neural Information
  Processing Systems 15} (Becker, S. and Obermayer, K., eds), MIT Press,
  Cambridge, MA. pp 649-656\cr
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
s<-scale(cbind(rjordan(dist,N),rjordan(dist,N)))
}
\keyword{distribution}
