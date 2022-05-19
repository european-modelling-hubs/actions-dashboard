#' Get all workflow badges from a GitHub repository
#'
#' @param repo Full name of the GitHub repo (`org/project` format)
#'
#' @return
#' A vector of URLs to workflow badges for the `repo`.
#'
#' @examples
#' get_repo_bages("epiforecasts/covidregionaldata")
#'
#' @export
get_repo_badges <- function(repo) {

  gh::gh("/repos/{repo}/actions/workflows", repo = repo) |>
    purrr::keep(~ .x[["state"]] == "active") |>
    purrr::map_chr("badge_url")

}
