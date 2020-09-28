#' Find a pattern in files
#' @description Find pattern in files and display the results in RStudio viewer.
#'
#' @param ext file extension
#' @param pattern pattern to search
#' @param depth depth of the search; \code{0} for the current directory,
#'   \code{1} for the current directory and its subdirectories, etc, and
#'   \code{NULL} for no limit
#' @param wholeword logical, whether to search the pattern as a whole
#'
#' @importFrom rstudioapi viewer
#' @export
findPatternInFiles <- function(ext, pattern, depth = NULL, wholeword = FALSE){
  args <- c(
    ext,
    shQuote(pattern),
    if(wholeword) "-w",
    if(!is.null(depth)) sprintf("-d %d", depth),
    "--html"
  )
  html <- tempfile(fileext = ".html")
  system2("findPatternInFiles3", args, stdout = html)
  rstudioapi::viewer(html)
}
