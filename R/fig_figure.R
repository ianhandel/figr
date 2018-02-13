#' Insert a figure from a figr table
#'
#' This function is given a figr table and an index or short filename
#' and will then insert the corresponding figure into the html document
#'
#' @param tbl A figr table
#' @param x Either an integer index or short filename
#' @return Returns nothing, sideeffect is inserting figure
#' @export
#'
#' @examples
#' \dontrun{
#' fig_figure(tbl, 7)
#' }
#'

fig_figure <- function(figr_tbl, index){
  if (length(index) > 1) stop("Can only do one figure at a time right now")

  if (is.character(index)){
    index <- match(index, figr_tbl[["filenames_short"]])
  }

  if(is.na(index)) stop("Figure not found")

  if(index > nrow(figr_tbl)) stop("Index is greater than table length")

  cat("![](", figr_tbl$filenames[[index]],")")
}


