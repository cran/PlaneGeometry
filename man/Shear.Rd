% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Shear.R
\name{Shear}
\alias{Shear}
\title{R6 class representing a shear transformation}
\description{
A shear is given by a vertex, two perpendicular vectors,
and an angle.
}
\examples{
P <- c(0,0); w <- c(1,0); ratio <- 1; angle <- 45
shear <- Shear$new(P, w, ratio, angle)
wt <- ratio * c(-w[2], w[1])
Q <- P + w; R <- Q + wt; S <- P + wt
A <- shear$transform(P)
B <- shear$transform(Q)
C <- shear$transform(R)
D <- shear$transform(S)
plot(0, 0, type = "n", asp = 1, xlim = c(0,1), ylim = c(0,2))
lines(rbind(P,Q,R,S,P), lwd = 2) # unit square
lines(rbind(A,B,C,D,A), lwd = 2, col = "blue") # image by the shear


## ------------------------------------------------
## Method `Shear$new`
## ------------------------------------------------

Shear$new(c(1,1), c(1,3), 0.5, 30)

## ------------------------------------------------
## Method `Shear$getMatrix`
## ------------------------------------------------

S <- Shear$new(c(1,1), c(1,3), 0.5, 30)
S$getMatrix()

## ------------------------------------------------
## Method `Shear$asAffine`
## ------------------------------------------------

Shear$new(c(0,0), c(1,0), 1, atan(30), FALSE)$asAffine()
}
\references{
R. Goldman,
\emph{An Integrated Introduction to Computer Graphics and Geometric Modeling}.
CRC Press, 2009.
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{vertex}}{get or set the vertex}

\item{\code{vector}}{get or set the first vector}

\item{\code{ratio}}{get or set the ratio between the length of \code{vector}
and the length of the second vector, perpendicular to the first one}

\item{\code{angle}}{get or set the angle}

\item{\code{degrees}}{get or set the \code{degrees} field}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Shear-new}{\code{Shear$new()}}
\item \href{#method-Shear-print}{\code{Shear$print()}}
\item \href{#method-Shear-transform}{\code{Shear$transform()}}
\item \href{#method-Shear-getMatrix}{\code{Shear$getMatrix()}}
\item \href{#method-Shear-asAffine}{\code{Shear$asAffine()}}
\item \href{#method-Shear-clone}{\code{Shear$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Shear-new"></a>}}
\if{latex}{\out{\hypertarget{method-Shear-new}{}}}
\subsection{Method \code{new()}}{
Create a new \code{Shear} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Shear$new(vertex, vector, ratio, angle, degrees = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{vertex}}{a point}

\item{\code{vector}}{a vector}

\item{\code{ratio}}{a positive number, the ratio between the length of \code{vector}
and the length of the second vector, perpendicular to the first one}

\item{\code{angle}}{an angle strictly between -90 degrees and 90 degrees}

\item{\code{degrees}}{logical, whether \code{angle} is given in degrees}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{Shear} object.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{Shear$new(c(1,1), c(1,3), 0.5, 30)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Shear-print"></a>}}
\if{latex}{\out{\hypertarget{method-Shear-print}{}}}
\subsection{Method \code{print()}}{
Show instance of a \code{Shear} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Shear$print(...)}\if{html}{\out{</div>}}
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
\if{html}{\out{<a id="method-Shear-transform"></a>}}
\if{latex}{\out{\hypertarget{method-Shear-transform}{}}}
\subsection{Method \code{transform()}}{
Transform a point or several points by the reference shear.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Shear$transform(M)}\if{html}{\out{</div>}}
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
\if{html}{\out{<a id="method-Shear-getMatrix"></a>}}
\if{latex}{\out{\hypertarget{method-Shear-getMatrix}{}}}
\subsection{Method \code{getMatrix()}}{
Augmented matrix of the shear.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Shear$getMatrix()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A 3x3 matrix.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{S <- Shear$new(c(1,1), c(1,3), 0.5, 30)
S$getMatrix()
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Shear-asAffine"></a>}}
\if{latex}{\out{\hypertarget{method-Shear-asAffine}{}}}
\subsection{Method \code{asAffine()}}{
Convert the reference shear to an \code{Affine} object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Shear$asAffine()}\if{html}{\out{</div>}}
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{Shear$new(c(0,0), c(1,0), 1, atan(30), FALSE)$asAffine()
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Shear-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Shear-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Shear$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
