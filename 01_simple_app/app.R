library(random.cdisc.data)
library(tern)
library(shiny)

print(getwd())

ui <- fluidPage(
  actionButton("refresh", "Refresh Data"),
  selectInput("endpoint", "Endpoint", c("OS", "EFS", "PFS")),
  plotOutput("km_plot")
)

server <- function(input, output) {
  plot_data <- reactive({
    input$refresh
    adsl <- random.cdisc.data::radsl()
    adtte <- random.cdisc.data::radtte(adsl)
    adtte |>
      dplyr::mutate(is_event = CNSR == 0)
  })
  output$km_plot <- renderPlot({
    g_km(
      df = plot_data() |> dplyr::filter(PARAMCD == input$endpoint),
      variables = list(tte = "AVAL", is_event = "is_event", arm = "ARMCD")
    )
  })
}

shinyApp(ui = ui, server = server, options = list(port = 1001))
