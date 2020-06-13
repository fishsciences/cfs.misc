#' Water year classifications
#'
#' Get water year classifications
#'
#' @md
#' @param  water_year  numeric vector of water years
#' @param  valley      Sacramento or San Joaquin valley (options: SAC or SJR)
#'
#' @export
#' @examples
#' get_water_year_type(1900:1906)
#' get_water_year_type(1900:1906, "SJR")
#' get_water_year_type(2014:2020)

get_water_year_type <- function(water_year, valley = c("SAC", "SJR")){
  valley <- match.arg(valley)
  tmp <- water_year_type[water_year_type$Valley == valley, ]
  tmp$WaterYearType[match(water_year, tmp$WaterYear)]
}
