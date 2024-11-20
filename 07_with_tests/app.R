box::use(
  shiny[...],
)
box::use(
  modules / data[data_ui, data_srv],
  modules / plot[km_ui, km_srv],
)

ui <- fluidPage(
  includeCSS("style.css"),
  data_ui("data"),
  km_ui("os"),
  km_ui("pfs"),
  km_ui("efs")
)

server <- function(input, output) {
  adtte <- data_srv("data")
  km_srv("os", adtte, "Overall Survival")
  km_srv("pfs", adtte, "Progression Free Survival")
  km_srv("efs", adtte, "Event Free Survival")
}

shinyApp(ui = ui, server = server)
