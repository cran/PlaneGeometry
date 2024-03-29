% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Ellipse.R
\name{EllipseFromEquation}
\alias{EllipseFromEquation}
\title{Ellipse from its implicit equation}
\usage{
EllipseFromEquation(A, B, C, D, E, F)
}
\arguments{
\item{A, B, C, D, E, F}{the coefficients of the equation}
}
\value{
An \code{Ellipse} object.
}
\description{
Return an ellipse from the coefficients of its implicit equation.
}
\details{
The implicit equation of the ellipse is
\code{Ax² + Bxy + Cy² + Dx + Ey + F = 0}. This function returns the ellipse
given A, B, C, D, E and F.
}
\examples{
ell <- Ellipse$new(c(2,3), 5, 4, 30)
cf <- ell$equation()
ell2 <- EllipseFromEquation(cf[1], cf[2], cf[3], cf[4], cf[5], cf[6])
ell$isEqual(ell2)
}
