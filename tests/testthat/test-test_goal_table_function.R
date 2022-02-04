test_that("this function returns dataframe", 
          expect_type(wncaasocR::goal_table(2021), "data.frame"))
