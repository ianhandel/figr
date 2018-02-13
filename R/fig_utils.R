#' Create a named label - defaults to 'home'
#'
#' This function creates an html label tag manually, defaulting
#' to 'home'. Likely to be used to give a return location from
#' figures,
#'
#' @param label The label tag
#' @return Returns nothing, sideeffect is printing label
#' @export
#'
#' @examples
#' \dontrun{
#' fig_label()
#' }
#'


fig_label <- function(label = "home"){
  cat(glue::glue('<a id=\"{label}\"></a>'))
}
