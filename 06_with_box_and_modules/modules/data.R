box::use(
  shiny[...],
  random.cdisc.data[radsl, radtte],
  dplyr[mutate],
)

#' @export
get_adtte <- function() {
  adsl <- radsl()
  adtte <- radtte(adsl)
  adtte |>
    mutate(is_event = CNSR == 0)
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
