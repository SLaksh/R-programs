# VISUALIZATION USING ggplot IN r
# Initially creating a dataframe with two variable 'x' and 'y'
# x is a factor datatype defined by letter in the range of [1:3] and each 10
# y is the rnorm is the R function that simulates random variables having a specified normal distribution

df <- data.frame(x = factor(rep(letters[1:3], each = 10)),y = rnorm(30))
df                                          # will display the dataframe

