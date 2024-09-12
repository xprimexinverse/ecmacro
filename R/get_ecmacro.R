#' Download the latest AMECO data
#'
#' @param url A string
#'
#' @return A data.frame
#' @export
#'
#' @examples
get_ecmacro <- function(url){

  if(missing(url)){
  # All zipped text files URL
    url <- "https://ec.europa.eu/economy_finance/db_indicators/ameco/documents/ameco0.zip"
  }

  # Create .zip temp file
  temp <- tempfile(fileext = ".zip")

  # Download the file
  download.file(url = url, destfile = temp)

  # Get the names of the zip files
  zipped_files <- unzip(temp, list=TRUE)

  # Read the text files into a list of lists
  AMECO_dataset_raw <- lapply(zipped_files$Name, function(x){
    read.csv(unz(temp, x), header=TRUE, sep=";", stringsAsFactors = FALSE, check.names = FALSE, na.strings = "NA", strip.white = TRUE)
  })
  names(AMECO_dataset_raw) <- zipped_files$Name

  # Flatten the list of lists to a list object
  AMECO_dataset <- do.call("rbind", AMECO_dataset_raw)
  # rownames(AMECO_dataset) <- NULL
  AMECO_dataset <- AMECO_dataset[,-ncol(AMECO_dataset)]

  # Delete the temporary file
  unlink(temp)

  return(AMECO_dataset)
}
