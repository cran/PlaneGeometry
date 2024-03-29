% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Line.R
\name{Line}
\alias{Line}
\title{R6 class representing a line}
\description{
A line is given by two distinct points,
named \code{A} and \code{B}, and two logical values \code{extendA}
and \code{extendB}, indicating whether the line must be extended
beyond \code{A} and \code{B} respectively. Depending on \code{extendA}
and \code{extendB}, the line is an infinite line, a half-line, or a segment.
}
\examples{

## ------------------------------------------------
## Method `Line$new`
## ------------------------------------------------

l <- Line$new(c(1,1), c(1.5,1.5), FALSE, TRUE)
l
l$A
l$A <- c(0,0)
l

## ------------------------------------------------
## Method `Line$print`
## ------------------------------------------------

Line$new(c(0,0), c(1,0), FALSE, TRUE)

## ------------------------------------------------
## Method `Line$includes`
## ------------------------------------------------

A <- c(0,0); B <- c(1,2); M <- c(3,6)
l <- Line$new(A, B, FALSE, FALSE)
l$includes(M, strict = TRUE)
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{A}}{get or set the point A}

\item{\code{B}}{get or set the point B}

\item{\code{extendA}}{get or set \code{extendA}}

\item{\code{extendB}}{get or set \code{extendB}}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Line-new}{\code{Line$new()}}
\item \href{#method-Line-print}{\code{Line$print()}}
\item \href{#method-Line-length}{\code{Line$length()}}
\item \href{#method-Line-directionAndOffset}{\code{Line$directionAndOffset()}}
\item \href{#method-Line-isEqual}{\code{Line$isEqual()}}
\item \href{#method-Line-isParallel}{\code{Line$isParallel()}}
\item \href{#method-Line-isPerpendicular}{\code{Line$isPerpendicular()}}
\item \href{#method-Line-includes}{\code{Line$includes()}}
\item \href{#method-Line-perpendicular}{\code{Line$perpendicular()}}
\item \href{#method-Line-parallel}{\code{Line$parallel()}}
\item \href{#method-Line-projection}{\code{Line$projection()}}
\item \href{#method-Line-distance}{\code{Line$distance()}}
\item \href{#method-Line-reflection}{\code{Line$reflection()}}
\item \href{#method-Line-rotate}{\code{Line$rotate()}}
\item \href{#method-Line-translate}{\code{Line$translate()}}
\item \href{#method-Line-invert}{\code{Line$invert()}}
\item \href{#method-Line-clone}{\code{Line$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-new"></a>}}
\if{latex}{\out{\hypertarget{method-Line-new}{}}}
\subsection{Method \code{new()}}{
Create a new \code{Line} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$new(A, B, extendA = TRUE, extendB = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{A, B}}{points}

\item{\code{extendA, extendB}}{logical values}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{Line} object.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{l <- Line$new(c(1,1), c(1.5,1.5), FALSE, TRUE)
l
l$A
l$A <- c(0,0)
l
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-print"></a>}}
\if{latex}{\out{\hypertarget{method-Line-print}{}}}
\subsection{Method \code{print()}}{
Show instance of a line object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$print(...)}\if{html}{\out{</div>}}
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
\preformatted{Line$new(c(0,0), c(1,0), FALSE, TRUE)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-length"></a>}}
\if{latex}{\out{\hypertarget{method-Line-length}{}}}
\subsection{Method \code{length()}}{
Segment length, returns the length of the segment joining
  the two points defining the line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$length()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-directionAndOffset"></a>}}
\if{latex}{\out{\hypertarget{method-Line-directionAndOffset}{}}}
\subsection{Method \code{directionAndOffset()}}{
Direction (angle between 0 and 2pi)
  and offset (positive number) of the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$directionAndOffset()}\if{html}{\out{</div>}}
}

\subsection{Details}{
The equation of the line is
  \ifelse{html}{\out{cos(&theta;)x+sin(&theta;)y=d}}{\eqn{\cos(\theta)x+\sin(\theta)y=d}{cos(theta)x+sin(theta)y=d}}
  where \ifelse{html}{\out{&theta;}}{\eqn{\theta}{theta}} is the direction
  and \ifelse{html}{\out{d}}{\eqn{d}{d}} is the offset.
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-isEqual"></a>}}
\if{latex}{\out{\hypertarget{method-Line-isEqual}{}}}
\subsection{Method \code{isEqual()}}{
Check whether the reference line equals a given line,
without taking into account \code{extendA} and \code{extendB}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$isEqual(line)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{line}}{a \code{Line} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\code{TRUE} or \code{FALSE}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-isParallel"></a>}}
\if{latex}{\out{\hypertarget{method-Line-isParallel}{}}}
\subsection{Method \code{isParallel()}}{
Check whether the reference line is parallel to a given line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$isParallel(line)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{line}}{a \code{Line} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\code{TRUE} or \code{FALSE}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-isPerpendicular"></a>}}
\if{latex}{\out{\hypertarget{method-Line-isPerpendicular}{}}}
\subsection{Method \code{isPerpendicular()}}{
Check whether the reference line is perpendicular to a given line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$isPerpendicular(line)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{line}}{a \code{Line} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\code{TRUE} or \code{FALSE}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-includes"></a>}}
\if{latex}{\out{\hypertarget{method-Line-includes}{}}}
\subsection{Method \code{includes()}}{
Whether a point belongs to the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$includes(M, strict = FALSE, checkCollinear = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{the point for which we want to test whether it belongs to the
line}

\item{\code{strict}}{logical, whether to take into account \code{extendA}
and \code{extendB}}

\item{\code{checkCollinear}}{logical, whether to check the collinearity of
\code{A}, \code{B}, \code{M}; set to \code{FALSE} only if you are sure
that \code{M} is on the line \code{(AB)} in case if you use
\code{strict=TRUE}}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\code{TRUE} or \code{FALSE}.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{A <- c(0,0); B <- c(1,2); M <- c(3,6)
l <- Line$new(A, B, FALSE, FALSE)
l$includes(M, strict = TRUE)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-perpendicular"></a>}}
\if{latex}{\out{\hypertarget{method-Line-perpendicular}{}}}
\subsection{Method \code{perpendicular()}}{
Perpendicular line passing through a given point.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$perpendicular(M, extendH = FALSE, extendM = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{the point through which the perpendicular passes.}

\item{\code{extendH}}{logical, whether to extend the perpendicular line
beyond the meeting point}

\item{\code{extendM}}{logical, whether to extend the perpendicular line
beyond the point \code{M}}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Line} object; its two points are the
meeting point and the point \code{M}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-parallel"></a>}}
\if{latex}{\out{\hypertarget{method-Line-parallel}{}}}
\subsection{Method \code{parallel()}}{
Parallel to the reference line passing through a given point.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$parallel(M)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{a point}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-projection"></a>}}
\if{latex}{\out{\hypertarget{method-Line-projection}{}}}
\subsection{Method \code{projection()}}{
Orthogonal projection of a point to the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$projection(M)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{a point}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A point.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-distance"></a>}}
\if{latex}{\out{\hypertarget{method-Line-distance}{}}}
\subsection{Method \code{distance()}}{
Distance from a point to the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$distance(M)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{a point}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A positive number.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-reflection"></a>}}
\if{latex}{\out{\hypertarget{method-Line-reflection}{}}}
\subsection{Method \code{reflection()}}{
Reflection of a point with respect to the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$reflection(M)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{M}}{a point}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A point.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-rotate"></a>}}
\if{latex}{\out{\hypertarget{method-Line-rotate}{}}}
\subsection{Method \code{rotate()}}{
Rotate the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$rotate(alpha, O, degrees = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{alpha}}{angle of rotation}

\item{\code{O}}{center of rotation}

\item{\code{degrees}}{logical, whether \code{alpha} is given in degrees}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-translate"></a>}}
\if{latex}{\out{\hypertarget{method-Line-translate}{}}}
\subsection{Method \code{translate()}}{
Translate the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$translate(v)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{v}}{the vector of translation}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-invert"></a>}}
\if{latex}{\out{\hypertarget{method-Line-invert}{}}}
\subsection{Method \code{invert()}}{
Invert the reference line.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$invert(inversion)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{inversion}}{an \code{Inversion} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{Circle} object or a \code{Line} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Line-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Line-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Line$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
