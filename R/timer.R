#' A simple timer function.
#'
#' @md
#' @param interval The length of time you want
#' @param units The unit of time you want to use, i.e. "secs", "mins", "hours"
#' @export
#' @examples
#' timer(45, "mins")
#'

timer <- function(interval = 1, units = "secs", sound = 2) {

  t0 <- Sys.time()
  stopwatch <- round(as.double(difftime(Sys.time(), t0, u = units)))

  while(stopwatch < interval){
    stopwatch <- round(as.double(difftime(Sys.time(), t0, u = units)))
  }
  beep(sound)
}
