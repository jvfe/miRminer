#' HMDD content acquisition
#'
#' Utility function to scrape HMDD pages and acquire relevant information,
#' primarily the href attribute corresponding to the downloadable table,
#' which is then read.
#'
#' @param url A string corresponding to the url where to acquire the information.
#' @param obj_xpath A string referring to the element xpath.
#'
#' @noRd
get_hmdd_content <- function(url, obj_xpath) {
  tryCatch(
    {
      req <- make_request(url) %>%
        rvest::html_node(xpath = obj_xpath) %>%
        rvest::html_attr("href")
      paste0("http://www.cuilab.cn", req) %>%
        readLines()
    },
    error = function(cond) {
      message("Couldn't find the required information!")
      message(paste("The original error message was:", cond))
      return(NULL)
    }
  )
}

#' Web request with sensible messages
#'
#' @param url A string corresponding to the url.
#'
#' @noRd
#' @return List of the html content.
make_request <- function(url) {
  tryCatch(
    {
      message("Processing the request...")
      xml2::read_html(url, options = "NOWARNING")
    },
    error = function(cond) {
      message(paste("The URL does not seem to exist:", url))
      return(NULL)
    }
  )
}

#' Builds HMDD url
#'
#' @param info_type A string containing the type of information you want to
#'   acquire from HMDD, network, e.g. browse_net, or causality.
#' @param id A string referring to the entity ID, which can be either a microRNA or a disease name
#' @param extra_id A string referring to the terminal id, which differs between types of information
#'
#' @noRd
#' @return A string corresponding to the url.
make_hmdd_url <- function(info_type, id, extra_id) {
  sprintf("http://www.cuilab.cn/hmdd3app/%s/%s_%s/", info_type, id, extra_id)
}
