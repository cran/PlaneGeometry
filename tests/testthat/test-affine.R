context("Affine transformations")

test_that("Transform several points", {
  f <- Affine$new(rbind(c(3.5,2),c(0,4)), c(-1, 1.25))
  Ms <- matrix(rpois(6, 10), 3L, 2L)
  Ps <- f$transform(Ms)
  expect_equal(Ps[1L,], f$transform(Ms[1L,]))
  expect_equal(Ps[2L,], f$transform(Ms[2L,]))
  expect_equal(Ps[3L,], f$transform(Ms[3L,]))
})

test_that("AffineMappingThreePoints", {
  P1 <- c(1,2); P2 <- c(3,4); P3 <- c(7,7)
  Q1 <- c(2,1); Q2 <- c(4,4); Q3 <- c(-7,7)
  f <- AffineMappingThreePoints(P1, P2, P3, Q1, Q2, Q3)
  expect_equal(Q1, f$transform(P1))
  expect_equal(Q2, f$transform(P2))
  expect_equal(Q3, f$transform(P3))
})

test_that("Rotation as affine transformation", {
  R <- Rotation$new(30, c(2,3))
  f <- R$asAffine()
  P1 <- c(1,2); P2 <- c(3,4); P3 <- c(7,7)
  expect_equal(R$rotate(P1), f$transform(P1))
  expect_equal(R$rotate(P2), f$transform(P2))
  expect_equal(R$rotate(P3), f$transform(P3))
})
