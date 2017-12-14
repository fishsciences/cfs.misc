#' Get water year classifications from CDEC webpage
#'
#' @md
#'
#' @export
#' @examples
#' df = get_water_year_type()

get_water_year_type <- function(){
  # fragile function with hard-coded elements
  # also a bit slow
  url <- 'http://cdec.water.ca.gov/cgi-progs/iodir/WSIHIST'
  webpage <- xml2::read_html(url)
  node = rvest::html_nodes(webpage, "pre")
  txt = rvest::html_text(node)[[1]]
  txt.start = stringr::str_locate_all(txt, pattern = "1901")[[1]][1,1] # more than one occurrence
  txt.end = stringr::str_locate_all(txt, pattern = "\nmin")[[1]][1,1] # more than one occurrence
  txt.sub = stringr::str_sub(txt, start = txt.start, end = txt.end-2) # need to subtract a couple of characters because of how end of line is treated (/n) [or my misunderstanding of that]
  ff = tempfile()
  write.table(x = txt.sub, file = ff, col.names = FALSE, row.names = FALSE, quote = FALSE) # not sure if necessary to write and then read, but couldn't figure out how to read directly
  full.df = read.fwf(file = ff, widths = c(4, rep(8,4), 6, 10, rep(8,3), 7, 6)) # used text to columns tool in Excel to get estimates of column widths
  df = full.df[,c("V1", "V6", "V11")] # WARNING: hard-coded columns
  names(df) = c("Year", "SAC", "SJR")
  df$SAC = gsub(df$SAC, pattern = " ", replacement = "") # clean up any extra spaces
  df$SJR = gsub(df$SJR, pattern = " ", replacement = "")
  return(df)
}
