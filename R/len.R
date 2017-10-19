#' An abbreviated form of length(unique())
#'
#' @md
#' @param x The object you want to find the number of unique things of
#'
#' @export
#' @examples
#' len(letters)
#'
len <- function(x) {

  length(unique(x))

}


