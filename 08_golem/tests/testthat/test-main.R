describe("Data preparation function", {
  it("filter_endpoint correctly filters data", {
    test_data <- data.frame(
      PARAM = c("Overall Survival", "Progression Free Survival"),
      AVAL = c(1, 2)
    )
    result <- filter_endpoint(test_data, "Overall Survival")
    expect_equal(nrow(result), 1)
    expect_equal(result$PARAM, "Overall Survival")
  })
})

describe("Shiny module data_srv", {
  it("returns a data.frame with the expected columns", {
    testServer(data_srv, {
      session$setInputs(refresh = 1)
      result <- session$getReturned()()
      expect_s3_class(result, "data.frame")
      expect_true(all(c("is_event", "AVAL", "ARMCD", "PARAM") %in% names(result)))
    })
  })
})
