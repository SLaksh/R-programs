# Handling Missing Data i.e. na
mydata3<- c(14,2,NA,2)
mydata3                              # will display the vector
mean(mydata3)                        # the output is NA- not available
mean(mydata3, na.rm=TRUE)            # the rm is TRUE, the function            
                                      #skips over any NA values and "output is 6

#  The function complete.cases() which returns a logical vector indicating which cases are complete, i.e., have no missing values.
x <- airquality[, -1]                     # x is a regression design matrix in built
x                                         # the output comprise of many "NA"

y <- airquality[,  1]                     # y is the corresponding response
y                                         # same the output comprise of many "NA"

ok <- complete.cases(x, y)               # The function "complete.cases()" returns a logical vector indicating which cases are complete.
ok                                       # will display the logical inference from the vector as 'TRUE TRUE FALSE etc.
