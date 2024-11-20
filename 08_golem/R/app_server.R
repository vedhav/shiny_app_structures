#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  adtte <- data_srv("data")
  km_srv("os", adtte, "Overall Survival")
  km_srv("pfs", adtte, "Progression Free Survival")
  km_srv("efs", adtte, "Event Free Survival")
}
