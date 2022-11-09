### https://rforhr.com/filter.html
####https://www.statology.org/dplyr-filter-multiple-conditions/


data()
install.packages("dplyr")
library(dplyr)
View(mtcars)

head(mtcars)
### filter with or operator
mtcars_filter2<-mtcars %>% filter(hp == 110 | hp == 105)

### filter with & operator & ) operator to filter the data frame by rows that meet several conditions:
mtcars_filter3<-mtcars %>% filter(cyl == 6 & hp == 105)

#### filter function with 
###  because you are now filtering by a vector, you will need to use the %in% operator, 
#### which is an operator that instructs R to go through each value of the filter variable 
mtcars_filter4<-mtcars %>% filter(hp %in% c(110,105))

mtcars_filter5<-mtcars %>% filter(!hp %in% c(110,105))
