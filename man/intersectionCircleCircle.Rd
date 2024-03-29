% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Intersections.R
\name{intersectionCircleCircle}
\alias{intersectionCircleCircle}
\title{Intersection of two circles}
\usage{
intersectionCircleCircle(circ1, circ2, epsilon = sqrt(.Machine$double.eps))
}
\arguments{
\item{circ1, circ2}{two \code{Circle} objects}

\item{epsilon}{a small positive number used for the numerical accuracy}
}
\value{
\code{NULL} if there is no intersection,
a point if the circles touch, a list of two points if the circles meet at
two points, a circle if the two circles are identical.
}
\description{
Return the intersection of two circles.
}
