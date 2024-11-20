library(random.cdisc.data)
library(dplyr)
library(tern)
library(shiny)

interested_endpoints <- c("Overall Survival", "Event Free Survival", "Progression Free Survival")

ui <- fluidPage(
  column(2, style = "margin-top: 25px;", actionButton("refresh", "Refresh Data")),
  plotOutput("km_plot_os"),
  plotOutput("km_plot_pfs"),
  plotOutput("km_plot_efs")
)

server <- function(input, output) {
  adtte <- reactive({
    input$refresh
    withProgress(
      message = "Generating plot data...",
      value = 1 / 4,
      {
        adsl <- random.cdisc.data::radsl()
        incProgress(2 / 4)
        adtte <- random.cdisc.data::radtte(adsl)
        incProgress(3 / 4)
        result <- adtte |>
          dplyr::mutate(is_event = CNSR == 0)
        incProgress(4 / 4)
        return(result)
      }
    )
  })

  output$km_plot_os <- renderPlot({
    g_km(
      df = adtte() |>
        dplyr::filter(PARAM == "Overall Survival"),
      variables = list(tte = "AVAL", is_event = "is_event", arm = "ARMCD")
    )
  })
  output$km_plot_pfs <- renderPlot({
    g_km(
      df = adtte() |>
        dplyr::filter(PARAM == "Progression Free Survival"),
      variables = list(tte = "AVAL", is_event = "is_event", arm = "ARMCD")
    )
  })
  output$km_plot_efs <- renderPlot({
    g_km(
      df = adtte() |>
        dplyr::filter(PARAM == "Event Free Survival"),
      variables = list(tte = "AVAL", is_event = "is_event", arm = "ARMCD")
    )
  })
}

shinyApp(ui = ui, server = server)
