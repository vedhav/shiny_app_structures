interested_endpoints <- c("Overall Survival", "Event Free Survival", "Progression Free Survival")

get_adtte <- function() {
  adsl <- random.cdisc.data::radsl()
  adtte <- random.cdisc.data::radtte(adsl)
  adtte |>
    dplyr::mutate(is_event = CNSR == 0)
}

filter_endpoint <- function(adtte, endpoint) {
  dplyr::filter(adtte, PARAM == endpoint)
}
