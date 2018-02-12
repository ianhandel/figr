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

  # write tbl to temporay file
  tempfile <- fs::file_temp()
  readr::write_rds(tbl, path = tempfile)


  fs::file_create(filename)

  # shortcut function to glue and write out
  wr <- function(str){
    readr::write_lines(path = filename, glue::glue(str), append = TRUE)
  }

  # Rmarkdown file headers

  wr("---")
  if (!is.null(author)){
    wr("author: \"{author}\"")
  }
  if (!is.null(date)){
    wr("date: \"{date}\"")
  }
  wr("output: html_document")
  wr("---")

  # read in figure table

  wr("``` {{r}}")
  wr("tbl <- readr::read_rds(\"{tempfile}\")")
  wr("```")

  # writes out figure table
  wr("``` {{r, tidy = FALSE}}")
  wr("knitr::kable(tbl)")
  wr("```")

  # writes out figure labels and plots
  for(ii in seq_along(tbl$filenames)){
    wr("```{{r, results='asis', tidy=FALSE}}")
    wr("cat('{tbl$label[[ii]]}')")
    wr("```")
    wr("```{{r, fig.height = 4, fig.width = 4}}")
    wr('knitr::include_graphics(path = "{tbl$filenames[[ii]]}")')
    wr("```")
  }
}

