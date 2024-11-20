box::use(
  random.cdisc.data[radsl, radtte],
  dplyr[mutate, filter],
)

#' @export
get_adtte <- function() {
  adsl <- radsl()
  adtte <- radtte(adsl)
  adtte |>
    mutate(is_event = CNSR == 0)
}

#' @export
filter_endpoint <- function(adtte, endpoint) {
  filter(adtte, PARAM == endpoint)
}
