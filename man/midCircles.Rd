% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Circle.R
\name{midCircles}
\alias{midCircles}
\title{Mid-circle(s)}
\usage{
midCircles(circ1, circ2)
}
\arguments{
\item{circ1, circ2}{\code{Circle} objects}
}
\value{
A \code{Circle} object, or a \code{Line} object, or a list of two
such objects.
}
\description{
Return the mid-circle(s) of two circles.
}
\details{
A mid-circle of two circles is a generalized circle (i.e. a circle
or a line) such that the inversion on this circle swaps the two circles.
The case of a line appears only when the two circles have equal radii.
}
\examples{
circ1 <- Circle$new(c(5,4),2)
circ2 <- Circle$new(c(6,4),1)
midcircle <- midCircles(circ1, circ2)
inversionFromCircle(midcircle)
inversionSwappingTwoCircles(circ1, circ2)
}
\seealso{
\code{\link{inversionSwappingTwoCircles}}
}
