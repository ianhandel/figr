#' Writes out a figr table
#'
#' This fucntion will insert a figr table dropping the long filenames
#' unless these are specifically requested
#'
#' @param fig_tbl A figr_table
#' @param show_all If TRUE long filename output too
#' @return Returns fig_tbl, sideeffect is to print it
#' @export
#'
#' @examples
#' \dontrun{
#' fig_table(tbl)
#' }
#'

fig_table <- function(fig_tbl, show_all = FALSE) {

  # prevent global var issue
  index <- NA
  label <- NA
  filenames <- NA
  filenames_short <- NA

  fig_tbl <- dplyr::select(fig_tbl, -label, -index)
  if (show_all) {
    knitr::kable(fig_tbl)
  } else {
    knitr::kable(dplyr::select(
      dplyr::rename(
        fig_tbl,
        file = filenames_short
      ),
      -filenames
    ))
  }
}
