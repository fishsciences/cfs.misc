# not exported

torso <- function(d, n=4L) {
  stopifnot(length(n) == 1L)
  left <- as.integer(nrow(d)/2 - n/2)
  d[ seq_len(n) + left - 1L, ]
}
