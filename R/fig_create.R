#' Create a label and link table from a file list or directory
#'
#' This fucntion is given either a list of filenames or pointed to a directory.
#' It will creat a table with formatted link and label text for inclusion
#' in a RMarkdown document. Filenames are filtered to only include those
#' with specified file extensions.
#'
#' @param filenames A character vector of filenames
#' @param dir A path to a directory of image files
#' @param desc If TRUE table is sorted on descending filename or sort key
#' @param extensions Regex to filter file extensions
#' @return Returns a table with column of text links and text labels.
#' @export
#'
#' @examples
#' \dontrun{
#' fig_create(dir = ".", desc = TRUE)
#' }
#'

fig_create <- function(filenames = NULL,
                       dir = NULL,
                       desc = FALSE,
                       extensions = ".(tif|png)$") {

  # prevent global var warnings
  `.` <- NA
  index <- NA

  if (!xor(is.null(filenames), is.null(dir))) {
    stop("Either filenames OR dir must be specified, not both")
  }
  if (length(dir) > 1) {
    stop("dir should be length 1 - have you given filenames instead?")
  }
  if (!is.null(dir)) {
    filenames <- fs::dir_ls(dir)
  }

  filenames <- filenames[stringr::str_detect(filenames, extensions)]
  filenames_short <- fs::path_file(filenames)
  #
  tbl <- tibble::tibble(filenames, filenames_short) %>%
    dplyr::mutate(
      index = seq_along(filenames),
      index = stringr::str_pad(index, 3, "left", 0),
      link = glue::glue_data(
        .,
        "<a href=\"#bookmark{index}\">Go to figure {index}</a>"
      ),
      label = glue::glue_data(
        .,
        "<a id=\"bookmark{index}\"></a>"
      )
    ) %>%
    dplyr::arrange(filenames)

  if (desc) {
    tbl <- dplyr::arrange(tbl, dplyr::desc(filenames))
  }

  tbl
}
