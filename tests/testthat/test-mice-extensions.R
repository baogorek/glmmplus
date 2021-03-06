# Copyright 2014 Google Inc. All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

context("Testing mice package extensions")

wide.df <- data.frame(pid           = 1:100,
                      my.response.1 = rnorm(100),
                      my.response.2 = rnorm(100),
                      x.1           = rnorm(100),
                      x.2           = rnorm(100))

wide.df[25:50, "my.response.2"] <- NA
wide.df[45:55, "x.1"] <- NA

mids <- ImputeData(wide.df, droplist = c("pid"))

test_that("Mice imputation wrapper works as desired", {
   
  expect_error(ImputeData(wide.df, droplist = c("not_here")))

  imp.predictors <- apply(mids$predictorMatrix, 2, FUN = sum)
  used.predictors <- sort(names(imp.predictors[imp.predictors > 0]))
  expect_equal(used.predictors, setdiff(names(wide.df), "pid"))
})

test_that("Mids object subsetting works", {
  subset.mids <- mids[50:100, ]
  expect_true(all(complete(mids, 1)[50:100, ] == complete(subset.mids, 1)))
  expect_true(all(complete(mids, 2)[50:100, ] == complete(subset.mids, 2)))
})

test_that("The Mids wide-to-long reshaping function works", {
  long.mids <- WideToLong(mids, "pid", "my.response", c("x"), sep = ".")
  long.df <- complete(long.mids, 1)
  
  expect_equal(nrow(long.df), 2 * nrow(wide.df))
  expect_equal(sort(names(long.df)),
              sort(c("pid", "my.response", "period", "x")))

  # checking cases with no missing values
  expect_equal(wide.df[1, "my.response.1"], long.df[1, "my.response"])
  expect_equal(as.character(long.df[1, "period"]), "1")

  expect_equal(wide.df[1, "my.response.2"], long.df[2, "my.response"])
  expect_equal(as.character(long.df[2, "period"]), "2")

  expect_equal(wide.df[1, "x.1"], long.df[1, "x"])
  expect_equal(wide.df[1, "x.2"], long.df[2, "x"])

  expect_true(!all(complete(long.mids, 1) == complete(long.mids, 2)))
})
