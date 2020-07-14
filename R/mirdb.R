.get_mirdb_net <- function(mirna) {
  url <- paste0("http://mirdb.org/cgi-bin/search.cgi?searchType=miRNA&searchBox=", mirna)

  make_request(url) %>%
    rvest::html_table(header = TRUE) %>%
    "[["(2) %>%
    dplyr::select(-`Target Detail`)
}

#' Retrieve miRNA-gene interaction from miRDB
#'
#' Queries miRDB for predicted miRNA-target interactions, returning a dataframe.
#' Supports same species miRDB supports, such as Homo sapiens, Mus musculus and
#' Rattus norvegicus. Each miRNA has to be preceeded by it's 3-letter species id.
#'
#' @param mirna A string corresponding to a microRNA ID, must be preceded by the 3-letter
#' species code, e.g. 'hsa' or 'mmu'.
#'
#' @export
#'
#' @examples
#'
#' get_mirdb_net("mmu-mir-100-3p")
#' get_mirdb_net("hsa-miR-101-2-5p")
get_mirdb_net <- memoise::memoise(.get_mirdb_net)
