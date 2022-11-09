
##### SIMPLE EXAMPLE

# creating data set columns
x <- c(12,23,43,61,78,54,34,76,58,103,39,46,52,33,11,9,60)
y <- c(12,54,34,76,54,23,43,61,78,23,12,34,56,98,67,36,54)
r <- c(1,5,13,8,12,3,2,16,7,40,23,45,76,8,7,41,23)

# creating the dataframe from the above columns
data <- data.frame(x, y, r)

ggplot(data, aes(x = x, y = y,size = r))+ geom_point(alpha = 0.7)

library(ggplot2)
theme_set(
  theme_bw() + 
    theme(legend.position = "top")
)

#####     Data preparation
###        Demo dataset: mtcars. The variable cyl is used as grouping variable.

# Load data
data("mtcars")
df <- mtcars
head(df)

ggplot(df, aes(x = wt, y = mpg)) + 
  geom_point(aes(color = cyl, size = qsec), alpha = 0.5) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#FC4E07")) +
  scale_size(range = c(0.5, 12))  # Adjust the range of points size

# Convert cyl as a grouping variable
df1 <- as.factor(df$cyl)
df1

