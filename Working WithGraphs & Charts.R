barplot(VADmeans, main = "Road Deaths in Virginia", xlab = "Categories", ylab = "Mean Deaths")

barplot(VADmeans, names.arg = c("RM", "RF", "UM", "UF"))

barplot(VADeaths, legend = TRUE)

###Grouped bar charts
barplot(VADeaths, legend = TRUE, beside = TRUE)

## By Adding Color to the bars
barplot(VADeaths, beside = TRUE, col = c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk"), legend = TRUE, ylim = c(0, 100))
## Adding title
title(main = "Death Rates in Virginia", font.main = 4)


############################################################
#### " HISTOGRAM   "
#############################################################

test.data <- c(2.1, 2.6, 2.7, 3.2, 4., 4.3, 5.2, 5.1, 4.8, 1.8, 1.4, 2.5, 2.7, 3.1, 2.6, 2.8)
hist(test.data)
hist(test.data, freq = FALSE)

##giving some good color

hist(test.data, xlab = "Numbers", col = "lightpink", border = "black" )


#############################################################################

###   PIE CHART

###########################################################################

##CREATING A DATAFRAME

Cities <- c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix", 
            "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose")
Population <- c(8.60, 4.06, 2.68, 2.40, 2.71, 1.58, 1.57, 1.45, 1.40, 1.03 )
top_popul <- data.frame(Cities, Population)
top_popul
pie(top_popul$Population)
pie(top_popul$Population, labels = Cities)

# Calculate percentages

top_popul_descend <- top_popul

pct <- round(100*top_popul_descend$Population/sum(top_popul_descend$Population))
# Draw oie chart
pie(top_popul_descend$Population,
    labels = paste(top_popul_descend$Cities, sep = " ", pct, "%"),    ### paste to paste % within the label
    col = rainbow(length(top_popul_descend$Population)), 
    main = "Most Populous US Cities in 2019 (in millions)")


### Working with STrings

install.packages("stringr")
library(stringr)

str1 = "abracadabaraaa"
st ="a"
str3 <- str_count(str1, st)

cat("The count of 'a' in the string %c", str3)


###########################################################################################################

######    LINE CHARTS

###########################################################################################################

x <- c(1, 2, 3, 4, 5)
y <- c(100, 300, 500, 700, 900)

# Vectors
plot(x, y, type = "l")

##### USING 'par()" function 

par(mfrow = c(1, 3))

plot(x, y, type = "s",col = "navyblue",lwd = 2, main = 'type = "s"')
plot(x, y, type = "b", col = "seagreen4", lwd = 2, main = 'type = "b"')
plot(x, y, type = "o", main = 'type = "o"')

par(mfrow = c(1, 1))

####### "Layout" function in LINE CHART
attach(mtcars)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)

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


### You can also create a line plot from a custom function:
# Custom function
fun <- function(x){
  return(x ^ 3)
}

# Plot the custom function
curve(fun, from = -5, to = 5, ylab = expression(x^3),
      main = "curve function", col="seagreen4")


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




#############################################################################################

#######               BOX PLOT

#############################################################################################

x <- c(8, 5, 14, -9, 19, 12, 3, 9, 7, 4,
       4, 6, 8, 12, -8, 2, 0, -1, 5, 3)
boxplot(x, horizontal = TRUE)


#####In order to solve this issue, you can add points to boxplot in R with the stripchart function
#####              (jittered data points will avoid to overplot the outliers) as follows:

stripchart(x, method = "jitter", pch = 19, add = TRUE, col = "blue")    
#Plot character or pch is the standard argument to set the character that will be plotted in a number of R functions.
##The basic syntax to create a strip chart in R is as follows:
 #######"stripchart(x, method, jitter, main, xlab, ylab, col, pch, vertical, group.names)"
###             x: a numeric vector or a list of numeric vectors to be plotted. This is the only required argument to produce a plot.
###             method: the method to be used to separate points that have identical values. The default method "overplot" causes such points to be overplotted, but it's possible to specify "jitter" to jitter the points or "stack" to stack the points.
###             jitter: when method = "jitter" is used, this provides the amount of jittering to be applied.
###             main: title of the chart
###             xlab: x-axis label
###             ylab: y-axis label
###             col: color of the points in the plot
###             pch: shape of the points in the plot
###             vertical: when vertical is "TRUE", the plot is drawn vertically rather than the default horizontal
###             group.names: group labels to be printed alongside the plot, if more than one numeric vector is being plotted.


####  Box plot with confidence interval for the median
###With 95% confidence intervals for the median in a R boxplot, setting the notch argument to TRUE.
boxplot(x, notch = TRUE)

boxplot(len~supp*dose, data=ToothGrowth, notch=TRUE,
        col=(c("gold","darkgreen")),
        main="Tooth Growth", xlab="Suppliment and Dose")

##If your dataset has a categorical variable containing groups, you can create a boxplot from formula.
### Here we are using the inbuilt 'CHICKWTS' dataset

boxplot(weight ~ feed, data = chickwts)

## WITH COLORS FOR THE BOX using GGPLOT
library(ggplot2)

ch <- ggplot(chickwts,aes(x=feed,y=weight))+
  geom_boxplot(color="red",outlier.color="black")
ch

###   Since the color is variable here, we will write the command color inside aes( ) of ggplot 
##       assigned to the x-axis value. The outliers will have the same black color, 
###         so write the command inside the geom_boxplot( ) only.

ch <- ggplot(chickwts,aes(x=feed,y=weight,color=feed))+
  geom_boxplot(outlier.color="black")

ch

###  FILL WITH THE COLOR
ch <- ggplot(chickwts,aes(x=feed,y=weight,fill=feed))+
  geom_boxplot()

ch

## USING STRIPCHART
stripchart(chickwts$weight ~ chickwts$feed, vertical = TRUE, method = "jitter",
           pch = 19, add = TRUE, col = 1:length(levels(chickwts$feed)))


################################################################################################

############  Q- Q PLOT

################################################################################################
install.packages("sqldf")         #### SQL database

library("sqldf")
data()

my_data <- ToothGrowth

qqnorm(my_data$len, pch = 1, frame = FALSE)
qqline(my_data$len, col = "steelblue", lwd = 2)

qqPlot(my_data$len)

install.packages("car")
library("car")
qqPlot(mtcars$mpg)



###############################################################################################

#########  KERNEL DENSITY PLOT

###############################################################################################

set.seed(1234)
# Generate data
x <- rnorm(500)
x
par(mfrow = c(1, 2))
# Create a histogram
hist(x, freq = FALSE, main = "Histogram and density")

# Calculate density
dx <- density(x)

# Add density
lines(dx, lwd = 2, col = "red")

# Plot the density without histogram
plot(dx, lwd = 2, col = "red",
     main = "Density")
### The result is the empirical density function. 
####     An alternative to create the empirical probability density function in R is the "epdfPlot"
####       function of the 'EnvStats' package.

### Another way of creating the KERNEL DENSITY FUNCTION

set.seed(13531)                                     # Create random numeric data
x <- rnorm(1000)

plot(density(x),                                    # Modify main title & labels
     main = "My Kernel Density Plot",
     xlab = "X-Values",
     ylab = "Density of my X-Values")

###  We can also fill the area below the density with some color by using the polygon function 
##           in combination with the density function:
####   Fill area under the density curve : The POLYGON function can be used to shade the area under 
###          the density curve. You just need to pass the density object to it and specify a color.
polygon(density(x), col = "#1b98e0")

### TO CLEAR THE CURRENT GRAPHICAL DEVICE
dev.off()





