box::use(
  tern[g_km],
)

#' @export
plot_km <- function(plot_data, tte = "AVAL", is_event = "is_event", arm = "ARMCD") {
  g_km(
    df = plot_data,
    variables = list(tte = tte, is_event = is_event, arm = arm)
  )
}
