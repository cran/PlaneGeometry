% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Mobius.R
\name{Mobius}
\alias{Mobius}
\title{R6 class representing a Möbius transformation.}
\description{
A Möbius transformation is given by a matrix of complex numbers
with non-null determinant.
}
\examples{

## ------------------------------------------------
## Method `Mobius$print`
## ------------------------------------------------

Mobius$new(rbind(c(1+1i,2),c(0,3-2i)))

## ------------------------------------------------
## Method `Mobius$transform`
## ------------------------------------------------

Mob <- Mobius$new(rbind(c(1+1i,2),c(0,3-2i)))
Mob$transform(c(1,1))
Mob$transform(Inf)
}
\seealso{
\code{\link{MobiusMappingThreePoints}} to create a Möbius
transformation, and also the \code{compose} method of the
\code{\link{Inversion}} R6 class.
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{a}}{get or set \code{a}}

\item{\code{b}}{get or set \code{b}}

\item{\code{c}}{get or set \code{c}}

\item{\code{d}}{get or set \code{d}}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Mobius$new()}}
\item \href{#method-print}{\code{Mobius$print()}}
\item \href{#method-getM}{\code{Mobius$getM()}}
\item \href{#method-compose}{\code{Mobius$compose()}}
\item \href{#method-inverse}{\code{Mobius$inverse()}}
\item \href{#method-power}{\code{Mobius$power()}}
\item \href{#method-gpower}{\code{Mobius$gpower()}}
\item \href{#method-transform}{\code{Mobius$transform()}}
\item \href{#method-transformCircle}{\code{Mobius$transformCircle()}}
\item \href{#method-transformLine}{\code{Mobius$transformLine()}}
\item \href{#method-clone}{\code{Mobius$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\subsection{Method \code{new()}}{
Create a new \code{Mobius} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$new(M)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{the matrix corresponding to the Möbius transformation}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{Mobius} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\subsection{Method \code{print()}}{
Show instance of a \code{Mobius} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$print(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{ignored}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{Mobius$new(rbind(c(1+1i,2),c(0,3-2i)))
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-getM"></a>}}
\subsection{Method \code{getM()}}{
Get the matrix corresponding to the Möbius transformation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$getM()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-compose"></a>}}
\subsection{Method \code{compose()}}{
Compose the reference Möbius transformation with another
Möbius transformation
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$compose(M1, left = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M1}}{a \code{Mobius} object}

\item{\code{left}}{logical, whether to compose at left or at right (i.e.
returns \code{M1 o M0} or \code{M0 o M1})}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Mobius} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-inverse"></a>}}
\subsection{Method \code{inverse()}}{
Inverse of the reference Möbius transformation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$inverse()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A \code{Mobius} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-power"></a>}}
\subsection{Method \code{power()}}{
Power of the reference Möbius transformation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$power(k)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{k}}{an integer, possibly negative}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
The Möbius transformation \code{M^k},
where \code{M} is the reference Möbius transformation.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-gpower"></a>}}
\subsection{Method \code{gpower()}}{
Generalized power of the reference Möbius transformation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$gpower(k)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{k}}{a real number, possibly negative}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Mobius} object, the generalized \code{k}-th power of
the reference Möbius transformation.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-transform"></a>}}
\subsection{Method \code{transform()}}{
Transformation of a point by the reference Möbius transformation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$transform(M)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{a point or \code{Inf}}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A point or \code{Inf}, the image of \code{M}.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{Mob <- Mobius$new(rbind(c(1+1i,2),c(0,3-2i)))
Mob$transform(c(1,1))
Mob$transform(Inf)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-transformCircle"></a>}}
\subsection{Method \code{transformCircle()}}{
Transformation of a circle by the reference Möbius transformation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$transformCircle(circ)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{circ}}{a \code{Circle} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Circle} object or a \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-transformLine"></a>}}
\subsection{Method \code{transformLine()}}{
Transformation of a line by the reference Möbius transformation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$transformLine(line)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{line}}{a \code{Line} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Circle} object or a \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Mobius$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
