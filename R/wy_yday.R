#' Day of water year
#'
#' Get day of water year from date-time object.
#' Warning: uses the system-specific time zone and not the time zone associated with the date-time object.
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
  is_leap_year <- function(year){
    (year %% 4 == 0) & ((year %% 100 != 0) | (year %% 400 == 0))
  }
  x_lt <- as.POSIXlt(x)
  x_lt$yday + ifelse(x_lt$mon + 1L < 10L, 93,
                     ifelse(is_leap_year(x_lt$year), -273, -272))
}
