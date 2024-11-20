box::use(
  shiny[...],
  app / view / km_plot[km_ui, km_srv],
  app / view / data_refresh[data_ui, data_srv],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    data_ui(ns("data")),
    km_ui(ns("os")),
    km_ui(ns("pfs")),
    km_ui(ns("efs"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    adtte <- data_srv("data")
    km_srv("os", adtte, "Overall Survival")
    km_srv("pfs", adtte, "Progression Free Survival")
    km_srv("efs", adtte, "Event Free Survival")
  })
}
