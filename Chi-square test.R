##### The syntax for Z test is 
#####   z.test(x, y, alternative='two.sided', mu=0, sigma.x=NULL, sigma.y=NULL,conf.level=.95)
####          where:

####      x: values for the first sample
###       y: values for the second sample (if performing a two sample z-test)
###       alternative: the alternative hypothesis ('greater', 'less', 'two.sided')
##        mu: mean under the null or mean difference (in two sample case)
#         sigma.x: population standard deviation of first sample
#         sigma.y: population standard deviation of second sample
#         conf.level: confidence level to use

install.packages("BSDA")
library(BSDA)

#enter IQ levels for 20 patients
data = c(88, 92, 94, 94, 96, 97, 97, 97, 99, 99,
         105, 109, 109, 109, 110, 112, 112, 113, 114, 115)

#perform one sample z-test
z.test(data, mu=100, sigma.x=15)


##########  CHI SQUARE

# Import the data
file_path <- "D:/MyFolderInJain/Subjects/2022(Jan - May)/II Sem-BA-R/Data Analytics with R/ModuleContentsForClass/Module 4/housetasks.txt"
housetasks <- read.delim(file_path, row.names = 1)
head(housetasks)

install.packages("gplots")
library("gplots")
# 1. convert the data as a table
dt <- as.table(as.matrix(housetasks))
# 2. Graph
balloonplot(t(dt), main ="housetasks", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)

install.packages("graphics")
library("graphics")
mosaicplot(dt, shade = TRUE, las=2,main = "housetasks")

chisq <- chisq.test(housetasks)
chisq
