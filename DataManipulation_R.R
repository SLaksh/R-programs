# Data Exploration 
# Import data into R done using read() function

mydata <- read.csv("D:/MyFolderInJain/Students(2021)/Semester II/Data Analytics with R/SampleData.csv", header=TRUE)
mydata                                  # will display the data

# create our own data using DATAFRAME

mydata1 = data.frame(Q1 = sample(1:6, 100, replace = TRUE),Q2 = sample(1:6, 100, replace = TRUE),Q3 = sample(1:6, 100, replace = TRUE), Q4 = sample(1:6, 100, replace = TRUE), Age = sample(1:3, 100, replace = TRUE))

#Calculate Basic Descriptive Statistics
summary(mydata)                     # Gives a quick and simple description of the data which include  
                                    # MEAN, MEDIAN, MODE, MIN VALUE, MAX VALUE, RANGE, SD.

ggplot(mydata) +
  +     geom_bar(mapping = aes(x = Q1))    # will display the "BAR CHART" for the variable Q1

data()
View(diamonds)


