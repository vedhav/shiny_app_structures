#' @export
get_adtte <- function() {
  adsl <- random.cdisc.data::radsl()
  adtte <- random.cdisc.data::radtte(adsl)
  adtte |>
    dplyr::mutate(is_event = CNSR == 0)
}

#' @export
data_ui <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("refresh"), "Refresh Data", class = "purple-button")
  )
}

#' @export
data_srv <- function(id) {
  moduleServer(id, function(input, output, session) {
    reactive({
      input$refresh
      get_adtte()
    })
  })
}
