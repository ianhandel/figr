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


fig_label <- function(label = "home") {
  cat(glue::glue('<a id=\"{label}\"></a>'))
}


#' Create a named link - defaults to 'home'
#'
#' This function creates a link tag manually, defaulting
#' to 'home'. Likely to be used to give a return link from
#' figures,
#'
#' @param label The link tag
#' @param text The text to display (deafults to 'back')
#' @param newline If TRUE inserts newline before link
#' @return Returns nothing, sideeffect is printing link
#' @export
#'
#' @examples
#' \dontrun{
#' fig_link()
#' }
#'


fig_link <- function(label = "home", text = "back", newline = TRUE) {
  if (newline) cat("\n")
  cat(glue::glue("[{text}](#{label})"))
}
