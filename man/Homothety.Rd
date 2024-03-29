% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Homothety.R
\name{Homothety}
\alias{Homothety}
\title{R6 class representing a homothety}
\description{
A homothety is given by a center and a scale factor.
}
\examples{

## ------------------------------------------------
## Method `Homothety$new`
## ------------------------------------------------

Homothety$new(c(1,1), 2)

## ------------------------------------------------
## Method `Homothety$getMatrix`
## ------------------------------------------------

H <- Homothety$new(c(1,1), 2)
P <- c(1,5)
H$transform(P)
H$getMatrix() \%*\% c(P,1)
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{center}}{get or set the center}

\item{\code{scale}}{get or set the scale factor of the homothety}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Homothety-new}{\code{Homothety$new()}}
\item \href{#method-Homothety-print}{\code{Homothety$print()}}
\item \href{#method-Homothety-transform}{\code{Homothety$transform()}}
\item \href{#method-Homothety-transformCircle}{\code{Homothety$transformCircle()}}
\item \href{#method-Homothety-getMatrix}{\code{Homothety$getMatrix()}}
\item \href{#method-Homothety-asAffine}{\code{Homothety$asAffine()}}
\item \href{#method-Homothety-clone}{\code{Homothety$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Homothety-new"></a>}}
\if{latex}{\out{\hypertarget{method-Homothety-new}{}}}
\subsection{Method \code{new()}}{
Create a new \code{Homothety} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Homothety$new(center, scale)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{center}}{a point, the center of the homothety}

\item{\code{scale}}{a number, the scale factor of the homothety}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{Homothety} object.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{Homothety$new(c(1,1), 2)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Homothety-print"></a>}}
\if{latex}{\out{\hypertarget{method-Homothety-print}{}}}
\subsection{Method \code{print()}}{
Show instance of a \code{Homothety} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Homothety$print(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{ignored}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Homothety-transform"></a>}}
\if{latex}{\out{\hypertarget{method-Homothety-transform}{}}}
\subsection{Method \code{transform()}}{
Transform a point or several points by the reference homothety.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Homothety$transform(M)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{a point or a two-column matrix of points, one point per row}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Homothety-transformCircle"></a>}}
\if{latex}{\out{\hypertarget{method-Homothety-transformCircle}{}}}
\subsection{Method \code{transformCircle()}}{
Transform a circle by the reference homothety.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Homothety$transformCircle(circ)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{circ}}{a \code{Circle} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Circle} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Homothety-getMatrix"></a>}}
\if{latex}{\out{\hypertarget{method-Homothety-getMatrix}{}}}
\subsection{Method \code{getMatrix()}}{
Augmented matrix of the homothety.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Homothety$getMatrix()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A 3x3 matrix.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{H <- Homothety$new(c(1,1), 2)
P <- c(1,5)
H$transform(P)
H$getMatrix() \%*\% c(P,1)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Homothety-asAffine"></a>}}
\if{latex}{\out{\hypertarget{method-Homothety-asAffine}{}}}
\subsection{Method \code{asAffine()}}{
Convert the reference homothety to an \code{Affine} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Homothety$asAffine()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Homothety-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Homothety-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Homothety$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
