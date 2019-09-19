#' Water year
#'
#' Get water year from date-time object.
#' Warning: uses the system-specific time zone and not the time zone associated with the date-time object.
#'
#' @md
#' @param x A date-time object.
#'
#' @export
#' @examples
#' x <- c("2016-12-31", "2017-01-01", "2017-09-30", "2017-10-01")
#' water_year(as.Date(x))
#' water_year(as.Date(x)) == format(as.Date(x), "%Y")

water_year <- function(x){
  x_lt <- as.POSIXlt(x)
  x_lt$year + 1900L + ifelse(x_lt$mon + 1L >= 10L, 1L, 0L)
}
