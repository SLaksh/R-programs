data1 <- read.csv("D:/MyFolderInJain/Subjects/2022(Jan - May)/II Sem-BA-R/Data Analytics with R/DataSets/Bigbazaar_sales_data.csv", header=TRUE)
head(data1)            

str(data1)

data2 <- aggregate(data1$Item_MRP, by=list(data1$Item_Outlet_Sales), sum)
data2

View(data1)

data3 <- aggregate(data1$Item_Outlet_Sales, by=list(data1$Outlet_Location_Type), sum)
data3

data4 <- aggregate(data1$Item_Outlet_Sales, by=list(data1$MRP_Level), sum)
data4

## Aggregating Multiple columns
 ## calculating the Maximum and Minimum total of two columns i.e. Item_Outlet_Sales by OUtlet Type
data5 <- aggregate(data1[c("Item_Outlet_Sales", "Converted.Sales")], by = list(data1$Outlet_Type), FUN = function(x) c(min(x),max(x)))
data5


install.packages("magrittr")
install.packages("dplyr")
library(dplyr)
### To find out the total ITem outlet Sales across Item type
###  USING 'GROUPBY' AND 'SUMMARIZE' FUNCTION IN PIPES
result1 <- data1 %>% group_by(Item_Type) %>% summarize(Total.Item_Outlet_Sale = sum(Item_Outlet_Sales))
result1





