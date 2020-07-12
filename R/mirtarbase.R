#' Retrieve miRNA-disease information from mirTarBase
#'
#' Queries mirTarBase for miRNAs associated with the specified disease, then outputs
#' a tibble with the specified information.
#'
#' @param disease A string corresponding to the disease you want to query.
#'
#'
#' @return A tibble containing the miRNAs associated with the specified disease.
#' @export
#'
#' @examples
#'
#' get_mirtar_disease("carcinoma")
get_mirtar_disease <- function(disease) {
  base <- "http://mirtarbase.cuhk.edu.cn/php/search.php?opt=disease_intermediate_mirna&disease_mirna="
  url <- paste0(base, disease)
  result <- make_request(url)
  result %>%
    rvest::html_table() %>%
    "[["(1)
}
