#' Recalibrated Globorisk cardiovascular risk (Mexico)
#'
#' Computes recalibrated 10-year cardiovascular risk based on the
#' Globorisk model with parameters specific for Mexico recalibrated
#' using data from the Mexico City Prospective Study.
#'
#' Authors: Daniel Ramírez-García, Omar Yaxmehen Bello-Chavolla and
#' Neftali Eduardo Antonio-Villa
#'
#' Study source: https://doi.org/10.1016/j.lana.2026.101403
#'
#' @param sex Numeric vector (0 = male, 1 = female)
#' @param age Numeric vector (years)
#' @param sbp Numeric vector (systolic blood pressure)
#' @param tcol_mmol Numeric vector (total cholesterol, mmol/L)
#' @param diab Numeric vector (0 = no, 1 = yes)
#' @param smoke Numeric vector (0 = no, 1 = yes)
#'
#' @return Numeric vector with recalibrated risk (%) rounded to 3 decimals
#'
#' @details
#' This function wraps the \code{globorisk::globorisk()} model and applies
#' sex-specific recalibration coefficients.
#'
#' @examples
#' globorisk_recalib(
#'   sex = c(0,1),
#'   age = c(50,60),
#'   sbp = c(120,140),
#'   tcol_mmol = c(5,6),
#'   diab = c(0,1),
#'   smoke = c(1,0)
#' )
#'
#' @export
#'

globorisk_recalib <- function(sex, age, sbp, tcol_mmol, diab, smoke) {

  vars <- list(sex = sex, age = age, sbp = sbp,
               tcol_mmol = tcol_mmol, diab = diab, smoke = smoke)

  non_numeric <- names(vars)[!vapply(vars, is.numeric, logical(1))]
  if (length(non_numeric)) {
    stop("These variables should be numeric: ",
         paste(non_numeric, collapse = ", "), call. = FALSE)
  }

  check_binary <- function(x, name) {
    if (any(!x %in% c(0, 1))) {
      stop(name, " must be coded as 0/1", call. = FALSE)
    }
  }

  check_binary(sex, "sex")
  check_binary(diab, "diab")
  check_binary(smoke, "smoke")

  score <- globorisk::globorisk(
    sex = sex,
    age = age,
    sbp = sbp,
    tc  = tcol_mmol,
    dm  = diab,
    smk = smoke,
    iso = "MEX",
    year = 2020,
    version = "fatal",
    type = "risk"
  )

  alpha <- ifelse(sex == 1, -0.881977, -0.8639137)
  beta  <- ifelse(sex == 1,  1.002298,  0.7745622)

  surv_model   <- 1 - score
  log_recalib  <- alpha + beta * log(-log(surv_model))
  surv_recalib <- exp(-exp(log_recalib))
  risk         <- 1 - surv_recalib

  round(risk * 100, 3)
}
