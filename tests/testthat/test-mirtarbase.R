mirtar_examp <- get_mirtar_disease("carcinoma")

test_that("valid object", {
  expect_s3_class(mirtar_examp, "tbl_df")
})
