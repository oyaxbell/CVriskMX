test_that("output length matches input", {
  res <- globorisk_recalib(
    sex = c(0,1),
    age = c(50,60),
    sbp = c(120,140),
    tcol_mmol = c(5,6),
    diab = c(0,1),
    smoke = c(1,0)
  )

  expect_length(res, 2)
})

test_that("values are between 0 and 100", {
  res <- globorisk_recalib(0, 50, 120, 5, 0, 1)
  expect_true(res >= 0 && res <= 100)
})

test_that("invalid binary input errors", {
  expect_error(
    globorisk_recalib(2, 50, 120, 5, 0, 1)
  )
})

test_that("non-numeric input errors", {
  expect_error(
    globorisk_recalib("male", 50, 120, 5, 0, 1)
  )
})
