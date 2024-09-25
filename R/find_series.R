#' Find a series in the AMECO data
#'
#' @param data A data.frame
#' @param text A string
#' @param field An integer (1-4)
#'
#' @return A data.frame
#' @export
#'
#' @examples
#' ZUTN <- find_series(AMECO_spring_2024, "zutn", field = 1)
find_series <- function(data, text, field){
  if(field==1){
    # Search for CODE
    result <- data[grep(text, data$CODE, ignore.case = TRUE),]
  }else if(field==2){
    # Search for COUNTRY
    result <- data[grep(text, data$COUNTRY, ignore.case = TRUE),]
  }else if(field==3){
    # Search for SUB-CHAPTER
    result <- data[grep(text, data$`SUB-CHAPTER`, ignore.case = TRUE),]
  }else if(field==4){
    # Search for TITLE
    result <- data[grep(text, data$TITLE, ignore.case = TRUE),]
  }
  return(result)
}
