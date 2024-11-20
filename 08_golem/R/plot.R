#' @export
filter_endpoint <- function(adtte, endpoint) {
  dplyr::filter(adtte, PARAM == endpoint)
}

#' @export
plot_km <- function(plot_data, tte = "AVAL", is_event = "is_event", arm = "ARMCD") {
  tern::g_km(
    df = plot_data,
    variables = list(tte = tte, is_event = is_event, arm = arm)
  )
}

#' @export
km_ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("km_plot"))
}

#' @export
km_srv <- function(id, adtte, endpoint) {
  moduleServer(id, function(input, output, session) {
    output$km_plot <- renderPlot({
      plot_km(filter_endpoint(adtte(), endpoint))
    })
  })
}
