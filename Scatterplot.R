# Get the input values.
input <- mtcars[, c('wt', 'mpg')]

plot(x = mtcars$wt, y = mtcars$mpg)

###You can get a similar result using qplot():
qplot(x = mtcars$wt, y = mtcars$mpg)

#### ANOTHER WAY giving the LABELS for X axis and Y axis and TITLE
##  attach() function in R Language is used to access the variables present in the data framework
##           without calling the data frame
attach(mtcars)  
plot(wt, mpg, main="Scatterplot Example",
     xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)

# Plot the chart for cars with
# weight between 1.5 to 4 and
# mileage between 10 and 25.
plot(x = input$wt, y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(1.5, 4),
     ylim = c(10, 25),       
     main = "Weight vs Milage"
)


x <- mtcars$wt
y <- mtcars$mpg
# Add regression line
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = mtcars), col = "blue")

###   pch in R, short for plot characters, is symbols or shapes we can use for making plots.


# High Density Scatterplot with Color Transparency

x <- rnorm(1000)
y <- rnorm(1000)
plot(x,y, main="PDF Scatterplot Example", col=rgb(0,100,20,100,maxColorValue=255), pch=16)
dev.off()


###########################################################################################

###         SCATTER MATRICES

#########################################################################################
# Plot the matrices between
# 4 variables giving 12 plots.

# One variable with 3 others
# and total 4 variables.
pairs(~wt + mpg + disp + cyl, data = mtcars,
      main = "Scatterplot Matrix")

# Basic Scatterplot Matrix
pairs(~mpg+disp+drat+wt,data=mtcars,
      main="Simple Scatterplot Matrix")