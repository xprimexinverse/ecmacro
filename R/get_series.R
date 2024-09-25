#' Get a series from the AMECO data
#'
#' @param ameco A data.frame
#' @param code A string
#'
#' @return A ts object
#' @export
#'
#' @examples
#' IRL_ZUTN <- get_series(AMECO_spring_2024, "IRL.1.0.0.0.ZUTN")
get_series <- function(ameco, code){
  idx <- which(ameco$CODE == code)
  start_date <- 1960
  data <- as.numeric(ameco[idx, 6:ncol(ameco)])
  ts_object <- stats::ts(data, start = start_date, frequency = 1)
  # Basic plot (TODO: upgrade to plotly chart with Y-diff and Y-on-Y)
  stats::plot.ts(ts_object, main = paste(code, ameco$TITLE[idx], sep="\n"), ylab = ameco$UNIT[idx], xlab="", las=1)
  return(ts_object)
}
