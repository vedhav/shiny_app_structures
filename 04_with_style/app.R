# Make sure that you run this from the app folder as working directory.
source("dependencies.R")
source("data.R")
source("plot.R")

ui <- fluidPage(
  includeCSS("style.css"),
  actionButton("refresh", "Refresh Data", class = "purple-button"),
  plotOutput("km_plot_os"),
  plotOutput("km_plot_pfs"),
  plotOutput("km_plot_efs")
)

server <- function(input, output) {
  adtte <- reactive({
    input$refresh
    get_adtte()
  })

  output$km_plot_os <- renderPlot({
    plot_km(filter_endpoint(adtte(), "Overall Survival"))
  })
  output$km_plot_pfs <- renderPlot({
    plot_km(filter_endpoint(adtte(), "Progression Free Survival"))
  })
  output$km_plot_efs <- renderPlot({
    plot_km(filter_endpoint(adtte(), "Event Free Survival"))
  })
}

shinyApp(ui = ui, server = server)
