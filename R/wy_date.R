#' Water year date
#'
#' Get date for day of water year
#'
#' @md
#' @param x Day of water year
#' @param y Water year
#'
#' @export
#' @examples
#' wy_date(x = seq(1, 361, 60), y = 2011)
#'

wy_date <- function(x, y){
  as.Date(paste0(y - 1, "-10-01")) + (x - 1)
}

