#' Retrieve causal miRNA-disease associations from HMDD3
#'
#' Queries HMDD3 causal associations of a specified entity, which can be either a disease or a microRNA,
#' then retrieves a tibble with the information.
#'
#' @param entity A string corresponding to a disease or a microRNA ID. If the latter,
#' there must be an "hsa-" prefix.
#'
#'
#' @return A tibble containing the information queried.
#' @export
#'
#' @examples
#'
#' get_hmdd_causality("sepsis")
#' get_hmdd_causality("hsa-mir-101")
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

#' Retrieve miRNA-target networks from HMDD3
#'
#' Queries HMDD3 miRNA-target interactions for a specified entity,
#' which can be either a disease or a microRNA, then retrieves an
#' edgelist tibble with the information.
#'
#' @param entity A string corresponding to a disease or a microRNA ID. If the latter,
#' there must be an "hsa-" prefix.
#'
#'
#' @return An edgelist tibble containing the information queried.
#' @export
#'
#' @examples
#'
#' get_hmdd_net("silicosis")
#' get_hmdd_net("hsa-mir-101")
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
