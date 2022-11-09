####  $$   "BAR DIAGRAM"
# Buili-in Dataset in R 
VADmeans = colMeans(VADeaths)
VADmeans

# simple bar diagram
barplot(VADmeans, main = "Road Deaths in Virginia", xlab = "Categories", ylab = "Mean Deaths")
# make it simple
barplot(VADmeans, names.arg = c("RM", "RF", "UM", "UF"))

## The BUILT IN DATASET VADeaths consists of a matrix of values with both column and row labels:
VADeaths

barplot(VADeaths, legend = TRUE)

###Grouped bar charts
barplot(VADeaths, legend = TRUE, beside = TRUE)

## By Adding Color to the bars
barplot(VADeaths, beside = TRUE, col = c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk"), legend = TRUE, ylim = c(0, 100))
title(main = "Death Rates in Virginia", font.main = 4)

#### Horizontal bar plot
a<- VADeaths [2:5, "Urban Male"] barplot(a)

barplot (a, horiz = TRUE)

####  $$  " HISTOGRAM"
test.data <- c(2.1, 2.6, 2.7, 3.2, 4., 4.3, 5.2, 5.1, 4.8, 1.8, 1.4, 2.5, 2.7, 3.1, 2.6, 2.8)
hist(test.data)
hist(test.data, freq = FALSE)

##giving some good color
hist(test.data, xlab = "Numbers", col = "lightpink", border = "black" )


###  $$ "PIE CHART"
##cREATING A DATAFRAME
Cities <- c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix", 
            "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose")
Population <- c(8.60, 4.06, 2.68, 2.40, 2.71, 1.58, 1.57, 1.45, 1.40, 1.03 )
top_popul <- data.frame(Cities, Population)
top_popul
pie(top_popul$Population)

pie(top_popul$Population, labels = Cities)

##Arranging the data in the Descending order
top_popul_descend <- top_popul[order(-top_popul$Population), ]
pie(top_popul_descend$Population, 
    labels = Cities, 
    main = "Most Populous US Cities in 2019 (in millions)")

# Calculate percentages
pct <- round(100*top_popul_descend$Population/sum(top_popul_descend$Population))
# Draw oie chart
pie(top_popul_descend$Population,
    labels = paste(top_popul_descend$Cities, sep = " ", pct, "%"), 
    col = rainbow(length(top_popul_descend$Population)), 
    main = "Most Populous US Cities in 2019 (in millions)")

###  $  Pie chart with ggplot
library(ggplot2)
ggplot(data = top_popul, aes(x = "", y = Population, fill = Cities)) + 
  geom_bar(stat = "identity") + 
  coord_polar("y")

###The pie chart has many extraneous background information. 
##Let us make some changes and enhance the pie chart a little bit.
##Remove the numeric labels and the polar grid by appending the function, theme_void( ).
##Add borders to each slice by adding the argument color into geom_bar( ).
##Draw the pie chart in the clockwise motion by adding a negative sign to the target vector.

### And with the Title

ggplot(data = top_popul, aes(x = "", y = Population, fill = Cities)) + 
  geom_bar(stat = "identity", color = "black") +
  labs(title = "Most Populous US Cities in 2019 (in millions)") +
  coord_polar("y") +
  theme_void()

### Reordering the pie chart in ggplot2 is similar to reordering bar graphs. 
### For the argument fill, use the function reorder( ).

ggplot(data = top_popul, aes(x = "", y = Population, 
                           fill = reorder(Cities, -Population))) + 
  geom_bar(stat = "identity", color = "black") + 
  labs(title = "Most Populous US Cities in 2019 (in millions)") +
  coord_polar("y") +
  theme_void()


#### $$ " LINE CHART/GRAPH"
x <- c(1, 2, 3, 4, 5)
y <- c(100, 300, 500, 700, 900)

# Vectors
plot(x, y, type = "l")

# Data frame
plot(data.frame(x, y), type = "l") # Equivalent

# Formula
plot(y ~ x, type = "l") # Equivalent

## As an example, the color and line width can be modified using the 'col'
##  and 'lwd' arguments

plot(x, y, type = "l",
     col = "navyblue", # Color
     lwd = 3)           # Line width

## Plotting Types
##Besides type = "l", there are three more types of line graphs available in base R. 
## Setting type = "s" will create a stairs line graph, 
## type = "b" will create a line plot with segments and points and 
## type = "o" will also display segments and points, but with the line overplotted.

par(mfrow = c(1, 3))

plot(x, y, type = "s",col = "navyblue",lwd = 2, main = 'type = "s"')
plot(x, y, type = "b", col = "seagreen4", lwd = 2, main = 'type = "b"')
plot(x, y, type = "o", main = 'type = "o"')

par(mfrow = c(1, 1))


## Furthermore, there exist six different types of lines, that can be specified 
## making use of the 'lty' argument, from 1 to 6:

par(mfrow = c(2, 3))

plot(x, y, type = "l",col = "navyblue", lwd = 2, lty = 1, main = "lty = 1")
plot(x, y, type = "l",col = "seagreen4", lwd = 2, lty = 2, main = "lty = 2")
plot(x, y, type = "l", col = "purple4",lwd = 2, lty = 3, main = "lty = 3")
plot(x, y, type = "l", col = "darkred",lwd = 2, lty = 4, main = "lty = 4")
plot(x, y, type = "l", col = "lightgoldenrod4",lwd = 2, lty = 5, main = "lty = 5")
plot(x, y, type = "l", col = "brown4",lwd = 2, lty = 6, main = "lty = 6")

par(mfrow = c(1, 1))


## You can also customize the symbol used when type = "b" or type = "o". 
## These symbols, also known as 'pch' symbols can be selected with the pch argument, '
## that takes values from 0 (square) to 25.

plot(x, y, type = "b", cex = 2, pch = 21, bg = "blue", col = "red")


## However, you can also add the points separately using the points function. 
##  This approach will allow you to customize all the colors as desired.

plot(x, y, type = "l", col = "red")

# Adding points
points(x, y,          # Coordinates
       pch = 21,      # Symbol
       cex = 2,       # Size of the symbol
       bg = "green",  # Background color of the symbol
       col = "blue",  # Border color of the symbol
       lwd = 3)       # Border width of the symbol

plot(x, y, type = "l",col = "blue4",lwd = 2)
text(x = 3, y = 650, "Custom annotation")

### In some scenarios you will need to create a line plot of a function. 
## For that purpose you can use the 'curve' function, specifying the function 
## and the X-axis range with the arguments 'from' and 'to'.

curve(cos, from = 0, to = 10, ylab = "", main = "Sine and cosine")

# New curve over the first
curve(sin, from = 0, to = 10,
      col = 2,
      add = TRUE) # Needed to add the curve over the first

### You can also create a line plot from a custom function:
# Custom function
fun <- function(x){
  return(x ^ 3)
}

# Plot the custom function
curve(fun, from = -5, to = 5, ylab = expression(x^3),
      main = "curve function")

## Line graph with 'Multiple LInes'
## This is done with the help of the "lines()" function

# Second data
y2 <- c(300, 400, 450, 400, 250)

# First line
plot(x, y, type = "l", col="red")

# Second line
lines(x, y2, type = "l", col = "blue") # Same X values

## Now adding legends to the lines
legend("topleft", legend = c("line 1", "line2"), lty = 1, col = 1:2)

### MATPLOT and MATLINE functions
## 'matplot()" is the better way to deal with multiple variables inside a dataframe or a matrix

library(MASS)    # For the mvrnorm function
set.seed(1)      # while generating random numbers it ensures that you get the same result 
                 # if you start with that same seed each time you run the same process

# Multivariate normal data
means <- rep(0, 5)
variances <- matrix(1:25, ncol = 5)
data <- data.frame(mvrnorm(n = 10, mu = means, Sigma = variances))

# First six rows
head(data)

## You can plot all the columns at once with the matplot function
matplot(data, type = "l", main = "matplot function")

## To plot only the first three columns of the dataframe
data1 <- data[, 1:3]

# Plot the three columns at once
matplot(data1, type = "l", lty = 1,
        ylab = "data",
        ylim = c(min(data), max(data))) # Y-axis limits


# Two last columns of the data frame
data2 <- data[, 4:5]

# Add the data to the previous plot
matlines(data2, type = "l", lty = 1, col = 4:5)