set.seed(123)                                                     # Set seed for reproducibility
data <- matrix(rnorm(100, 0, 10), nrow = 10, ncol = 10)           # Create example data
colnames(data) <- paste0("col", 1:10)                             # Column names
rownames(data) <- paste0("row", 1:10)
### Our data contains ten columns and ten rows with normally distributed random values.

###############   1.WAY OF CREATING Heatmap with heatmap() function ##############
heatmap(data)   

###  You get a heat map with Dendograms 
heatmap(data, Rowv = NA, Colv = NA)  
### " Rowv argument determines if and how the row dendrogram should be computed and reordered"
####  " Similarly Colv determines the column dendrogram 


####  " Furthermore, we can modify the colors of the heatmap by specifying our own color range with the colorRampPalette function.
my_colors <- colorRampPalette(c("cyan", "deeppink3")) 
### my_colors is a color range from cyan to deep pink


##############   2. WAY OF CREATING Heatmap with ggplot2()

#### we'll work with the "airquality" dataset that is built into R

names(airquality) <- tolower(names(airquality))
head(airquality)   

####     Installing "reshape2" library
install.packages("reshape2")
library(reshape2)

data_melt <- melt(data)  
###    By default, melt has assumed that all columns with numeric values are variables with values. 

head(data_melt)
# Create heatmap with ggplot2

install.packages("ggplot2")
library(ggplot2)
ggp <- ggplot(data_melt, aes(Var1, Var2)) + geom_tile(aes(fill = value))
ggp    

###3 Change the color 
ggp + scale_fill_gradient(low = "yellow", high = "violet")  
