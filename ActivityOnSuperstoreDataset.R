#### READING THE DATASET

dat <- read.csv("D:/MyFolderInJain/Subjects/2022(Jan - May)/II Sem-BA-R/Data Analytics with R/DataSets/Superstore.csv", header=TRUE)
head(dat)

install.packages("dplyr")
library(dplyr)
#### CONSOLIDATED SALES ACROSS REGIONS

str(dat)
sales_by_Region <- dat %>% group_by(Region) %>%
  summarise(Total_Sales=sum(Sales)) %>% ungroup
sales_by_Region

install.packages("ggplot2")
library(ggplot2)
str(sales_by_Region)

hist(sales_by_Region$Total_Sales)
sales_by_Region %>% 
  ggplot(sales_by_Region, aes(Sales,fill=Region))+
  geom_col(show.legend = FALSE,color="black")+
  geom_text(aes(label=comma(Total_Sales)),size=3,hjust=1,color="black")+
  scale_y_comma()+
  scale_fill_brewer(palette = "Paired")+
  coord_flip()+
  theme_classic()+
  labs(title = "Total Sales breakdown by Region",x="Region",y= "Total sales")