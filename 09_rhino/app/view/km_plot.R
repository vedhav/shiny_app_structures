box::use(
  shiny[...],
)
box::use(
  app / logic / data_utils[filter_endpoint],
  app / logic / plot[plot_km],
)

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
