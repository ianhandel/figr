#' Write a file including list of links, figures and labels
#'
#' This function is given a data.frame of filenames, links and labels. It writes out
#' a mardkdown, pdf or html file including the figures, labels and a table
#'  of links
#'
#' @param tbl A data.frame with full paths, links and labels
#' @param filename A path to a directory of image files
#' @param author Author text for output file
#' @param date Date text for output file
#' @return Returns tbl, side effect is to write output.
#'
#' @examples
#' \dontrun{
#' fig_write(tbl = mydata, filename = "myfilename.md")
#' }
#'

fig_write <- function(tbl, filename,
                      author = NULL,
                      date = NULL){
  if (fs::file_exists(filename)) stop(glue::glue("{filename} already exists)"))

  # markdown file headers
  fs::file_create(filename)
  readr::write_lines(path = filename, "---", append = TRUE)
  if (!is.null(author)){
    readr::write_lines(path = filename, "author: \"{author}\"", append = TRUE)
  }
  if (!is.null(date)){
    readr::write_lines(path = filename, "date: \"{date}\"", append = TRUE)
  }
  readr::write_lines(path = filename, "output: md_document", append = TRUE)
  readr::write_lines(path = filename, "---", append = TRUE)

}

