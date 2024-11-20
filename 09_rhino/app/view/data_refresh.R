box::use(
  shiny[...],
)
box::use(
  app / logic / data_utils[get_adtte],
)

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
