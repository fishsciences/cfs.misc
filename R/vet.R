#' Quickly "vet" a dataframe by previewing rows throughout the length of the dataframe
#'
#' @md
#' @param d A data frame object
#' @param n The number of rows you want to view from each section. The three sections that rows will be displayed from are the head of the dataframe, the middle (torso),  and the tail.  Default is 4 rows from each section.
#'
#' @export
#' @examples
#' vet(iris)
#'

vet <- function(d, n=4L) {
  rbind(head(d, n), torso(d, n), tail(d, n))
}
