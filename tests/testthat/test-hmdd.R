
causa1 <- get_hmdd_causality("sepsis")
causa2 <- get_hmdd_causality("hsa-mir-101")

net_examp <- get_hmdd_net("silicosis")
net_examp2 <- get_hmdd_net("hsa-mir-101")

test_that("valid object", {
  expect_s3_class(causa1, "tbl_df")
  expect_s3_class(causa2, "tbl_df")
  expect_s3_class(net_examp, "tbl_df")
  expect_s3_class(net_examp2, "tbl_df")
})
