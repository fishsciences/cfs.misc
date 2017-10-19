#' Get water year based on numeric year and numeric month
#'
#' @md
#' @param y Numeric year
#' @param m Numeric month (i.e., 1 = Jan, 2 = Feb, etc.)
#'
#' @export
#' @examples
#' water_year(2016, 9)
#' water_year(2016, 10)
#'

water_year <- function(y, m){
  y + ifelse(m >= 10, 1, 0)
}
