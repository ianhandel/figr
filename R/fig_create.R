#' Create a label and link table from a file list or directory
#'
#' This fucntion is given either a list of filenames or pointed to a directory.
#' It will creat a table with formatted link and label text for inclusion
#' in a RMarkdown document.
#'
#' @param filenames A character vector of filenames
#' @param dir A path to a directory of image files
#' @param desc If TRUE table is sorted on descending filename or sort key

#' @return Returns a table with column of text links and text labels.
#'
#' @examples
#' \dontrun{
#' fig_create(dir = ".", desc = TRUE)
#' }
#'

fig_create <- function(filenames = NULL,
           dir = NULL,
           desc = FALSE){
  if (!xor(is.null(filenames), is.null(dir))){
    stop("Either filenames OR dir must be specified, not both")
  }
  if (!is.null(dir)){
    filenames = fs::dir_ls(dir)
  }
  filenames
}

