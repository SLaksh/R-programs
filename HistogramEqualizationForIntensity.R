install.packages("imager")
library(imager)

# original image
plot(boats)

boats.g <- grayscale(boats)

# grayscaled image
plot(boats.g)

grayscale(boats) %>% hist(main="Luminance values in boats picture")

##    We will grayscale the image and calculate the cumulative distribution of image pixels using ecdf() function. 
###   It will also transform the luminance value in histogram, and will make the grayscaled image equalize.
##    Then the as.cimg() is used to convert a data into an image. 
##    The dim attribute is basically the dimensions of the image.

f <- ecdf(boats.g)
f(boats.g) %>% hist(main="Transformed luminance values")
f(boats.g) %>% as.cimg(dim=dim(boats.g)) %>% plot(
  main="With histogram equalisation")

# Hist. equalisation for grayscale
hist.eq <- function(im) as.cimg(ecdf(im)(im),dim=dim(im))

### The imsplit() function is used to split the image across color channels and "c" is the axis passed. 
##   The map_il() function will map the hist.eq variable with each of the splitted color channeled images and will make sure that the output should be an image. 
##     The imappend() function will recombine the splitted images along the "c" axis and the plot() function will plot the equalized image.

# Split across colour channels,
cn <- imsplit(boats,"c")

# we now have a list of images
cn

# run hist.eq on each
cn.eq <- map_il(cn,hist.eq)

# recombine and plot
imappend(cn.eq,"c") %>% plot(main="All channels equalised")

