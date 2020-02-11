% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Translation.R
\name{Translation}
\alias{Translation}
\title{R6 class representing a translation}
\description{
A translation is given by a vector \code{v}.
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{v}}{get or set the vector of translation}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Translation$new()}}
\item \href{#method-print}{\code{Translation$print()}}
\item \href{#method-project}{\code{Translation$project()}}
\item \href{#method-transform}{\code{Translation$transform()}}
\item \href{#method-translateLine}{\code{Translation$translateLine()}}
\item \href{#method-transformLine}{\code{Translation$transformLine()}}
\item \href{#method-translateEllipse}{\code{Translation$translateEllipse()}}
\item \href{#method-transformEllipse}{\code{Translation$transformEllipse()}}
\item \href{#method-getMatrix}{\code{Translation$getMatrix()}}
\item \href{#method-asAffine}{\code{Translation$asAffine()}}
\item \href{#method-clone}{\code{Translation$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\subsection{Method \code{new()}}{
Create a new \code{Translation} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$new(v)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{v}}{a numeric vector of length two, the vector of translation}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{Translation} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\subsection{Method \code{print()}}{
Show instance of a translation object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$print(...)}\if{html}{\out{</div>}}
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
\if{html}{\out{<a id="method-project"></a>}}
\subsection{Method \code{project()}}{
Transform a point or several points by the reference
translation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$project(M)}\if{html}{\out{</div>}}
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
\if{html}{\out{<a id="method-transform"></a>}}
\subsection{Method \code{transform()}}{
An alias of \code{translate}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$transform(M)}\if{html}{\out{</div>}}
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
\if{html}{\out{<a id="method-translateLine"></a>}}
\subsection{Method \code{translateLine()}}{
Translate a line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$translateLine(line)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{line}}{a \code{Line} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-transformLine"></a>}}
\subsection{Method \code{transformLine()}}{
An alias of \code{translateLine}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$transformLine(line)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{line}}{a \code{Line} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-translateEllipse"></a>}}
\subsection{Method \code{translateEllipse()}}{
Translate a circle or an ellipse.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$translateEllipse(ell)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{ell}}{an \code{Ellipse} object or a \code{Circle} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
An \code{Ellipse} object or a \code{Circle} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-transformEllipse"></a>}}
\subsection{Method \code{transformEllipse()}}{
An alias of \code{translateEllipse}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$transformEllipse(ell)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{ell}}{an \code{Ellipse} object or a \code{Circle} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
An \code{Ellipse} object or a \code{Circle} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-getMatrix"></a>}}
\subsection{Method \code{getMatrix()}}{
Augmented matrix of the translation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$getMatrix()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A 3x3 matrix.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-asAffine"></a>}}
\subsection{Method \code{asAffine()}}{
Convert the reference translation to an \code{Affine}
object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$asAffine()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Translation$clone(deep = FALSE)}\if{html}{\out{</div>}}
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