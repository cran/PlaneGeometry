#' @title R6 class representing a hyperbola
#'
#' @description A hyperbola is given by two intersecting asymptotes, named
#'   \code{L1} and \code{L2}, and a point on this hyperbola, named \code{M}.
#'
#' @export
#' @importFrom R6 R6Class
Hyperbola <- R6Class(

  "Hyperbola",

  private = list(
    .L1 = NULL,
    .L2 = NULL,
    .M = c(NA_real_, NA_real_),
    .O = c(NA_real_, NA_real_),
    .A = c(NA_real_, NA_real_),
    .B = c(NA_real_, NA_real_),
    .a = NA_real_,
    .b = NA_real_,
    .c = NA_real_,
    .e = NA_real_
  ),

  active = list(
    #' @field L1 get or set the asymptote \code{L1}
    L1 = function(value) {
      if(missing(value)) {
        private[[".L1"]]
      } else {
        L1 <- value
        stopifnot(
          inherits(L1, "Line")
        )
        private[[".L1"]] <- L1
      }
    },

    #' @field L2 get or set the asymptote \code{L2}
    L2 = function(value) {
      if(missing(value)) {
        private[[".L2"]]
      } else {
        L2 <- value
        stopifnot(
          inherits(L2, "Line")
        )
        private[[".L2"]] <- L2
      }
    },

    #' @field M get or set the point \code{M}
    M = function(value) {
      if(missing(value)) {
        private[[".M"]]
      } else {
        M <- as.vector(value)
        stopifnot(
          is.numeric(M),
          length(M) == 2L,
          !any(is.na(M)),
          all(is.finite(M))
        )
        private[[".M"]] <- M
      }
    }
  ),

  public = list(
    #' @description Create a new \code{Hyperbola} object.
    #' @param L1,L2 two intersecting lines given as \code{Line} objects, the
    #'   asymptotes
    #' @param M a point on the hyperbola
    #' @return A new \code{Hyperbola} object.
    initialize = function(L1, L2, M) {
      stopifnot(
        inherits(L1, "Line")
      )
      stopifnot(
        inherits(L2, "Line")
      )
      M <- as.vector(M)
      stopifnot(
        is.numeric(M),
        length(M) == 2L,
        !any(is.na(M)),
        all(is.finite(M))
      )
      if(L1$isEqual(L2)) {
        stop("`L1` and `L2` are equal.")
      }
      if(L1$isParallel(L2)) {
        stop("`L1` and `L2` are parallel.")
      }
      if(L1$includes(M)) {
        stop("`M` is on `L1`.")
      }
      if(L2$includes(M)) {
        stop("`M` is on `L2`.")
      }
      private[[".L1"]] <- L1
      private[[".L2"]] <- L2
      private[[".M"]] <- M
      # OAB in private
      O <- self$center()
      # equation O + t f1 + 1/t f2
      theta1 <- L1$directionAndOffset()$direction
      theta2 <- L2$directionAndOffset()$direction
      f10 <- c(sin(theta1), -cos(theta1))
      f20 <- c(sin(theta2), -cos(theta2))
      invMAT <- rbind(
        c(-cos(theta2), -sin(theta2)),
        c(cos(theta1), sin(theta1))
      ) / sin(theta2 - theta1)
      lambdas <- invMAT %*% (M - O)
      f1 <- lambdas[1L] * f10
      f2 <- lambdas[2L] * f20
      # first equation O +/- g1 cosh(t) + g2 sinh(t)
      g1 <- M - O
      g2 <- f1 - f2
      # vertex V1 = O + A
      t0 <- log(c(crossprod(g1-g2)) / c(crossprod(g1+g2))) / 4
      A <- cosh(t0) * g1 + sinh(t0) * g2
      # |f1|=|f2|
      lambdaEq <- c(crossprod(invMAT[1L, ], A))
      f1eq <- lambdaEq * f10
      f2eq <- lambdaEq * f20
      # tangent at v1
      tgV1 <- lambdaEq*(f10 - f20)
      # parametric representation  O +/- cosh(t) A + sinh(t) B
      B <- tgV1
      #
      private[[".O"]] <- O
      private[[".A"]] <- A
      private[[".B"]] <- B
      #
      # a,b,c,e
      a2 <- c(crossprod(A))
      a  <- sqrt(a2)
      V1 <- O + A
      L <- Line$new(V1, V1 + B)
      I <- intersectionLineLine(L1, L)
      b2 <- c(crossprod(V1 - I))
      c <- sqrt(a2 + b2)
      private[[".a"]] <- a
      private[[".b"]] <- sqrt(b2)
      private[[".c"]] <- c
      private[[".e"]] <- c / a

    },

    #' @description Center of the hyperbola.
    #' @return The center of the hyperbola, i.e. the point where
    #'   the two asymptotes meet each other.
    "center" = function() {
      intersectionLineLine(private[[".L1"]], private[[".L2"]])
    },

    #' @description Parametric equation \eqn{O \pm cosh(t) A + sinh(t) B}
    #'   representing the hyperbola.
    #' @return The point \code{O} and the two vectors \code{A} and \code{B}
    #'   in a list.
    #' @examples
    #' L1 <- LineFromInterceptAndSlope(0, 2)
    #' L2 <- LineFromInterceptAndSlope(-2, -0.5)
    #' M <- c(4, 3)
    #' hyperbola <- Hyperbola$new(L1, L2, M)
    #' hyperbola$OAB()
    "OAB" = function() {
      list(
        "O" = private[[".O"]],
        "A" = private[[".A"]],
        "B" = private[[".B"]]
      )
    },

    #' @description Vertices of the hyperbola.
    #' @return The two vertices \code{V1} and \code{V2} in a list.
    "vertices" = function() {
      O <- private[[".O"]]
      A <- private[[".A"]]
      list("V1" = O + A, "V2" = O - A)
    },

    #' @description The numbers \code{a} (semi-major axis, i.e. distance
    #'   from center to vertex),
    #'   \code{b} (semi-minor axis),
    #'   \code{c} (linear eccentricity)
    #'   and \code{e} (eccentricity)
    #'   associated to the hyperbola.
    #' @return The four numbers \code{a}, \code{b}, \code{c} and \code{e}
    #'   in a list.
    "abce" = function() {
      list(
        "a" = private[[".a"]],
        "b" = private[[".b"]],
        "c" = private[[".c"]],
        "e" = private[[".e"]]
      )
    },

    #' @description Foci of the hyperbola.
    #' @return The two foci \code{F1} and \code{F2} in a list.
    "foci" = function() {
      O <- private[[".O"]]
      e <- private[[".e"]]
      A <- private[[".A"]]
      list("F1" = O + e * A, "F2" = O - e * A)
    },

    #' @description Plot hyperbola.
    #' @param add Boolean, whether to add this plot to the current plot
    #' @param ... named arguments passed to \code{\link[graphics]{lines}}
    #' @return Nothing, called for plotting.
    #' @examples
    #' L1 <- LineFromInterceptAndSlope(0, 2)
    #' L2 <- LineFromInterceptAndSlope(-2, -0.5)
    #' M <- c(4, 3)
    #' hyperbola <- Hyperbola$new(L1, L2, M)
    #' plot(hyperbola, lwd = 2)
    #' points(t(M), pch = 19, col = "blue")
    #' O <- hyperbola$center()
    #' points(t(O), pch = 19)
    #' draw(L1, col = "red")
    #' draw(L2, col = "red")
    #' vertices <- hyperbola$vertices()
    #' points(rbind(vertices$V1, vertices$V2), pch = 19)
    #' majorAxis <- Line$new(vertices$V1, vertices$V2)
    #' draw(majorAxis, lty = "dashed")
    #' foci <- hyperbola$foci()
    #' points(rbind(foci$F1, foci$F2), pch = 19, col = "green")
    "plot" = function(add = FALSE, ...) {
      O <- private[[".O"]]
      A <- private[[".A"]]
      B <- private[[".B"]]
      if(!add) {
        b <- private[[".b"]]
        foci <- self$foci()
        u <- B / sqrt(c(crossprod(B)))
        P1 <- foci$F1 + b * u
        Q1 <- foci$F1 - b * u
        P2 <- foci$F2 - b * u
        Q2 <- foci$F2 + b * u
        pts <- rbind(P1, Q1, P2, Q2)
        plot(
          pts, type = "n", asp = 1, xlab = "x", ylab = "y"
        )
      }
      xmin <- par("usr")[1L]
      xmax <- par("usr")[2L]
      ymin <- par("usr")[3L]
      ymax <- par("usr")[4L]
      t <- .good_t(self, xmin, xmax, ymin, ymax)
      if(t == 0) {
        warning("The hyperbola is not visible.")
        return(invisible())
      }
      t_ <- seq(-t, t, length.out = 100L)
      H1 <- t(vapply(t_, function(t) {
        O + cosh(t) * A + sinh(t) * B
      }, numeric(2L)))
      lines(H1, lwd = 2)
      H2 <- t(vapply(t_, function(t) {
        O - cosh(t) * A + sinh(t) * B
      }, numeric(2L)))
      lines(H2, lwd = 2)
      # points(t(O), pch = 19, col="black")
      # draw(self$L1, col = "red")
      # draw(self$L2, col = "red")
      invisible()
    },

    #' @description Whether a point belongs to the hyperbola.
    #' @param P a point
    #' @return A Boolean value.
    #' @examples
    #' L1 <- LineFromInterceptAndSlope(0, 2)
    #' L2 <- LineFromInterceptAndSlope(-2, -0.5)
    #' M <- c(4, 3)
    #' hyperbola <- Hyperbola$new(L1, L2, M)
    #' hyperbola$includes(M)
    "includes" = function(P) {
      stopifnot(.isPoint(P))
      O <- private[[".O"]]
      A <- private[[".A"]]
      B <- private[[".B"]]
      isTRUE(all.equal(
        det(cbind(P-O, B))^2,
        det(cbind(A, P-O))^2 + det(cbind(A, B))^2,
        check.attributes = FALSE
      ))
    },

    #' @description Implicit quadratic equation of the hyperbola
    #' \ifelse{html}{\out{A<sub>xx</sub>x<sup>2</sup> + 2A<sub>xy</sub>xy + A<sub>yy</sub>y<sup>2</sup> + 2B<sub>x</sub>x + 2B<sub>y</sub>y + C = 0}}{\eqn{A_{xx} x^2 + 2A_{xy} xy + A_{yy} y^2 + 2B_x x + 2B_y y + C = 0}{A_{xx}*x^2 + 2A_{xy}*x*y + A_{yy}*y^2 + 2B_x*x + 2B_y*y + C = 0}}
    #' @return The coefficients of the equation in a named list.
    #' @examples
    #' L1 <- LineFromInterceptAndSlope(0, 2)
    #' L2 <- LineFromInterceptAndSlope(-2, -0.5)
    #' M <- c(4, 3)
    #' hyperbola <- Hyperbola$new(L1, L2, M)
    #' eq <- hyperbola$equation()
    #' x <- M[1]; y <- M[2]
    #' with(eq, Axx*x^2 + 2*Axy*x*y + Ayy*y^2 + 2*Bx*x + 2*By*y + C)
    #' V1 <- hyperbola$vertices()$V1
    #' x <- V1[1]; y <- V1[2]
    #' with(eq, Axx*x^2 + 2*Axy*x*y + Ayy*y^2 + 2*Bx*x + 2*By*y + C)
    "equation" = function() {
      O <- private[[".O"]]
      A <- private[[".A"]]
      B <- private[[".B"]]
      Axx <- B[2L]^2 - A[2L]^2
      Axy <- A[1L]*A[2L] - B[1L]*B[2L]
      Ayy <- B[1L]^2 - A[1L]^2
      Bx <- -(Axx*O[1L] + Axy*O[2L])
      By <- -(Ayy*O[2L] + Axy*O[1L])
      x <- O[1L] + A[1L]
      y <- O[2L] + A[2L]
      C <- -(Axx*x^2 + 2*Axy*x*y + Ayy*y^2 + 2*Bx*x + 2*By*y)
      list(Axx = Axx, Axy = Axy, Ayy = Ayy, Bx = Bx, By = By, C = C)
    }
  )
)

#' @title Hyperbola object from the hyperbola equation.
#' @description Create the \code{Hyperbola} object representing the hyperbola
#'   with the given implicit equation.
#' @param eq named vector or list of the six parameters \code{Axx}, \code{Axy},
#'   \code{Ayy}, \code{Bx}, \code{By}, \code{C}
#' @return A \code{Hyperbola} object.
#' @export
#' @importFrom fitConic AtoG
HyperbolaFromEquation <- function(eq) {
  parA <- c(
    eq[["Axx"]], 2*eq[["Axy"]], eq[["Ayy"]],
    2*eq[["Bx"]], 2*eq[["By"]], eq[["C"]]
  )
  hvabtheta <- AtoG(parA)$parG
  h <- hvabtheta[1L]
  v <- hvabtheta[2L]
  a <- hvabtheta[3L]
  b <- hvabtheta[4L]
  theta <- hvabtheta[5L]
  beta <- atan(a / b)
  alpha <- theta + 3 * pi / 2
  u1 <- c(-sin(alpha), cos(alpha))
  M <- c(h, v) + a * u1 # this is V1
  L1direction <- theta - beta + 2*pi
  L2direction <- theta + beta + pi
  L1offset <- cos(L1direction) * h + sin(L1direction) * v
  L2offset <- cos(L2direction) * h + sin(L2direction) * v
  L1 <- LineFromEquation(cos(L1direction), sin(L1direction), -L1offset)
  L2 <- LineFromEquation(cos(L2direction), sin(L2direction), -L2offset)
  Hyperbola$new(L1, L2, M)
}
