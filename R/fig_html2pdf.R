#' Uses system call to pandoc to convert html to pdf
#'
#' HTML to PDF conversion via pandoc system call. Writes new
#' file with old filename but upodates extension to .pdf
#'
#' @param filename Filename of html file
#' @return Returns filename for new file
#' @export
#'
#' @examples
#' \dontrun{
#' fig_html2pdf("myfile.html")
#' }
#'


fig_html2pdf <- function(filename){
  if (fs::path_ext(filename) != "html") stop("Needs an html file")
  output <- fs::path_ext_set(filename, "pdf")
  system(glue::glue("pandoc -s {filename} -o {output}"))
  output
}
