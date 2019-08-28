#' Water year week
#'
#' Get week in water year from a date-time object.
#'
#' Returns the number of complete seven day periods that have occurred between the date and October 1st, plus one. Based on lubridate::week().
#'
#' @md
#' @param x A date-time object.
#'
#' @export
#' @examples
#' wy_week(as.Date(c("2016-10-01", "2017-01-01")))
#'

wy_week <- function(x){
  (wy_yday(x) - 1) %/% 7 + 1
}
