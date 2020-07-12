#' Title
#'
#' @param disease
#'
#' @return
#' @export
#'
#' @examples
get_mirtar_disease <- function(disease) {
  base <- "http://mirtarbase.cuhk.edu.cn/php/search.php?opt=disease_intermediate_mirna&disease_mirna="
  url <- paste0(base, disease)
  result <- make_request(url)
  result %>%
    rvest::html_table() %>%
    "[["(1)
}
