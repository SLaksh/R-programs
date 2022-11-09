# Dot chart of a single numeric vector
## cex is used to specify the character size to be used
dotchart(mtcars$mpg, labels = row.names(mtcars),
         cex = 0.9, xlab = "mpg")

dotchart(mtcars$mpg, labels = row.names(mtcars),
         cex = 0.6, xlab = "mpg")

# Plot and color by groups cyl
grps <- as.factor(mtcars$cyl)

# defining the colors as  vector
my_cols <- c("blue", "darkgreen", "orange")

# doing my dotchart
dotchart(mtcars$mpg, labels = row.names(mtcars),
         groups = grps, gcolor = my_cols,
         color = my_cols[grps],
         cex = 0.6,  pch = 22, xlab = "mpg")

head(mtcars)
