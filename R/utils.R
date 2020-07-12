#' Title
#'
#' @param url
#' @param obj_xpath
#'
#' @return
#' @export
#'
#' @examples
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

#' Title
#'
#' @param url
#'
#' @return
#' @export
#'
#' @examples
make_request <- function(url) {
  tryCatch(
    {
      message("Processing the request...")
      xml2::read_html(url)
    },
    error = function(cond) {
      message(paste("The URL does not seem to exist:", url))
      return(NULL)
    }
  )
}

#' Title
#'
#' @param info_type
#' @param id
#' @param extra_id
#'
#' @return
#' @export
#'
#' @examples
make_hmdd_url <- function(info_type, id, extra_id) {
  sprintf("http://www.cuilab.cn/hmdd3app/%s/%s_%s/", info_type, id, extra_id)
}
