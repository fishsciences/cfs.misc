#' Computes weighted means triangular weighting function
#'
#' @md
#' @param x   A numeric vector
#' @param win Time window , e.g., if win = 3 then weighting = c(1, 2, 3, 0, 3, 2, 1)
#'
#' @export
#' @examples
#' x = 1:100
#' x[seq(20, 80, 10)] = NA
#' fill_missing(x)
#'

fill_missing <- function(x, win = 5) {
  n <- length(x)							                          # number of data points in time series
  w <- c(1:win, 0, win:1)							                  # weighting function: tiangular with +/- win data points
  ww <- matrix(0, n + 2*win, n)					                # build matrix for weights
  for (i in 1:n){
    ww[i:(i+length(w)-1), i] <- w                       # fill matrix with weights
    }
  ww <- ww[-c(1:win, (n + win + 1):(n + 2*win)), ]			# trim first and last win rows
  ww[is.na(x)] <- NA						                        # cancel weights where data is missing (x = NA)
  w.m <- colSums(x*ww, na.rm=T)/colSums(ww, na.rm=T)	  # compute weighted means
  x[is.na(x)]	<- w.m[is.na(x)]					                # replace weighted means for missing data
  x
}
