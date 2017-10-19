#' A function to convert quoted names of colors in R to their Hex values
#'
#' @md
#' @param color The quoted name of the color whose hex code you want
#'
#' @export
#' @examples
#' col2hex("wheat")
#'

col2hex <- function(color) {

   x <-  col2rgb(color)
  hex <-rgb(x[1], x[2], x[3], maxColorValue = 255)
  return(hex)

}
