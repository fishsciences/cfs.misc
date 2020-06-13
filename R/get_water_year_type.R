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
#' get_water_year_type(1997:2011)

get_water_year_type <- function(water_year, valley = c("SAC", "SJR")){
  valley <- match.arg(valley)
  water_year_type$WaterYearType[water_year_type$WaterYear %in% water_year & water_year_type$Valley == valley]
}
