#' Get day of water year from date-time object.
#'
#' @md
#' @param x A date-time object.
#'
#' @export
#' @examples
#' wy_yday(as.Date(c("2016-01-01", "2016-10-01", "2017-01-01")))
#' wy_yday(as.Date(c("2016-03-01", "2017-03-01"))) # 2016 was a leap year
#'

wy_yday <- function(x){
  oct1 = as.Date(paste0(water_year(x) - 1, "-10-01"))
  as.numeric(difftime(x, oct1, units = "days")) + 1
}
