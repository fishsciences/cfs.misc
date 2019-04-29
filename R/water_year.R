#' Get water year from date-time object.
#'
#' @md
#' @param x A date-time object.
#'
#' @export
#' @examples
#' x = c("2016-12-31", "2017-01-01", "2017-09-30", "2017-10-01")
#' water_year(as.Date(x))
#' water_year(as.Date(x)) == format(as.Date(x), "%Y")

water_year <- function(x){
  as.integer(format(x, "%Y")) + ifelse(as.integer(format(x, "%m")) >= 10L, 1L, 0L)
}
