install.packages("corrgram")
library(corrgram)


corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Car Milage Data in PC2/PC1 Order")

# Second Correlogram Example
corrgram(mtcars, order=TRUE, lower.panel=panel.ellipse,
         upper.panel=panel.pts, text.panel=panel.txt,
         diag.panel=panel.minmax,
         main="Car Mileage Data in PC2/PC1 Order")


# Third Correlogram Example
corrgram(mtcars, order=NULL, lower.panel=panel.shade,
         upper.panel=NULL, text.panel=panel.txt,
         main="Car Milage Data (unsorted)")

##  Changing the colors in a correlogram
##    You can control the colors in a correlogram by specifying 4 colors in the colorRampPalette( ) 
##       function within the col.corrgram( ) function
dev.off()
col.corrgram <- function(ncol){colorRampPalette(c("darkgoldenrod4", "burlywood1",
                     "darkkhaki", "darkgreen"))(ncol) }
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Correlogram of Car Mileage Data (PC2/PC1 Order)")


###############################################################################

###3                 CORRPLOT
###################################################################################

M<-cor(mtcars)
## cor() function in R Language is used to measure the correlation coefficient value between two vectors.
head(round(M,2))

install.packages("corrplot")
library(corrplot)
corrplot(M, method="circle")
corrplot(M, method="pie")
corrplot(M, method="color")
corrplot(M, method="number")
