### File downloaded from https://www.whitehouse.gov/omb/budget/supplemental-materials/
url <- "D:/MyFolderInJain/Subjects/2022(Jan - May)/II Sem-BA-R/Data Analytics with R/DataSets/Superstore.csv"

out <- read.csv(url, stringsAsFactors = FALSE)
View(out)

install.packages("treemap")
library(treemap)

## Creating the most basic treemap##
treemap(out,index = c("Category"),vSize ="Sales")

aggregate(Sales ~ Category, out, sum)

## Creating a treemap with Category and Subcategory as a hierarchy.
treemap(out,index = c("Category","Sub.Category"),vSize = "Sales")
##   Here is what happened, the tree is first splits at the category level and 
##         then each category further splits under a subcategory.

#### INFERENCES 1 : Technology Category accounted for maximum sales and within the Technology category, Phones accounted for most of the sales.


###    Let's go a step further and color the boxes by another measure let's say profit.

##Coloring the boxes by a measure##
treemap(out,index = c("Category","Sub.Category"),vSize ="Sales",vColor = "Profit",type="value")
## Here VColor argument tells R to pick up a variable that we want to be used as a color
##    and type arguments Defines if it is a value, index or categorical

#####  INFERENCE2:   the most profitable subcategory was Copiers while on the other hand Tables were the most unprofitable


##Using a categorical variable as color##
treemap(out,index = c("Category","Region"),vSize ="Sales",vColor = "Region",type="categorical")

######  INFERENCE3 : the tree is split into Categories first and under each category we have all the four region that are distinguished by individual color.

####  Enhancing our treemap
####  Let's move ahead and make our treemap more readable. 
####   To do this we will add a title to our treemap and change to font size of the Labels for category and Subcategories
####   We will try to keep the labels for Categories bigger and sub categories a bit smaller

treemap(out,index = c("Category","Sub.Category"),vSize ="Sales",vColor = "Profit",type="value",title = "Sales Treemap For categories",fontsize.labels = c(15,10))

###   Lit more enhancing on positioning/aligning our labels within the treemap
###   This is achieved by the argument align.labels

## Yet another attempt to chose the color from custom color across R with the 'palette' argument
treemap(out,index = c("Category","Sub.Category"),vSize ="Sales",vColor = "Profit",type="value",palette="Purples",range=c(-20000,60000),mapping=c(-20000,10000,60000),title = "Sales Treemap For categories",fontsize.labels = c(15,10),align.labels = list(c("centre","centre"),c("left","top")))

