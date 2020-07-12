#' Title
#'
#' @param entity
#'
#' @return
#' @export
#'
#' @examples
get_hmdd_causality <- function(entity) {
  if (startsWith(entity, "hsa")) {
    url <- make_hmdd_url("causality", entity, "a3")
  } else {
    encoded_disease <- URLencode(tools::toTitleCase(entity))
    url <- make_hmdd_url("causality", encoded_disease, "a4")
  }
  result <- get_hmdd_content(url, '//*[@id="browsedownload"]')
  table <- readr::read_tsv(result[2:length(result)]) %>%
    dplyr::mutate(entity_name = gsub("miRNA name:\t|Disease name:\t", "", result[1]))
}

#' Title
#'
#' @param entity
#'
#' @return
#' @export
#'
#' @examples
get_hmdd_net <- function(entity) {
  if (startsWith(entity, "hsa")) {
    url <- make_hmdd_url("browse_net", tolower(entity), "n1")
  } else {
    encoded_disease <- URLencode(tools::toTitleCase(entity))
    url <- make_hmdd_url("browse_net", encoded_disease, "n2")
  }
  result <- get_hmdd_content(url, "/html/body/p/b/span[2]/a") %>%
    readr::read_tsv()
}
