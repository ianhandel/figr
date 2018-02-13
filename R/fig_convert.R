#' Convert pdfs to tifs for rendering
#'
#' Given a directory will convert all pdf's to tif's to
#' allow RMarkdown rendering to look pretty. Requires the
#' R magick package to work.
#'
#' @param dir Directory to converts
#' @param silent If FALSE converted pdf list printed
#' @return Returns a table with column of text links and text labels.
#' @export
#'

fig_convert <- function(dir, silent = TRUE) {
  if (length(dir) > 1) {
    stop("dir should be length 1 - have you given filenames instead?")
  }

  pdfs <- fs::dir_ls(dir, glob = "*.pdf")
  purrr::walk(pdfs, convert)
  if(!silent) print(pdfs)
}

convert <- function(filename) {
  img <- magick::image_read(filename)
  filename <- fs::path_ext_set(filename, "tif")
  magick::image_write(img, filename)
}