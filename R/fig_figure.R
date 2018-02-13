#' Insert a figure from a figr table
#'
#' This function is given a figr table and an index or short filename
#' and will then insert the corresponding figure into the html document
#' together with a label to permit linking.
#'
#' @param figr_tbl A figr table
#' @param index Either an integer index or short filename
#' @param width Figure width as % of page
#' @param add_titles If TRUE adds filenames
#' @param pagebreak If TRUE inserts pagebreak before figure
#' @return Returns nothing, sideeffect is inserting figure
#' @export
#'
#' @examples
#' \dontrun{
#' fig_figure(tbl, 7)
#' }
#'

fig_figure <- function(figr_tbl, index,
                       width = 70,
                       add_titles = FALSE,
                       pagebreak = TRUE) {
  if (length(index) > 1) stop("Can only do one figure at a time right now")

  if (is.character(index)) {
    index <- match(index, figr_tbl[["filenames_short"]])
  }

  if (is.na(index)) stop("Figure not found")

  if (index > nrow(figr_tbl)) stop("Index is greater than table length")

  if (pagebreak) cat("\\newpage")

  if (add_titles) cat("##", figr_tbl$filenames_short[[index]])

  cat(figr_tbl$label[[index]])

  cat("![](", figr_tbl$filenames[[index]], "){ width=", width, "% }", sep = "")
}
