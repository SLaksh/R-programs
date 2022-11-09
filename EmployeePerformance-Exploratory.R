install.packages("DataExplorer")
library(DataExplorer)

#  Reading the data
perf.data <- read.csv("D:/MyFolderInJain/Subjects/2022(Jan - May)-BA/Semester IV/DemoForAnalytics/ebp_exercise-master/ebp_exercise-master/data.csv",header = TRUE)

install.packages("tidyverse")
library(tidyverse)
# Quickly visualize the data by using the plot_str function

install.packages("kableExtra")
library(kableExtra)

# Return first 5 rows of the dataset
perf.data %>%
  head(5)%>%
  kable() %>%
  kable_styling(bootstrap_options = c("hover","striped","condensed"),full_width = F)

##    Here is a brief description of the fields in the dataset :

#employee_id for each manager
#performance_group of each manager : Bottom , Middle or Top Performer
#yrs_employed : Total length of time employed in years
#manager_hire : whether or not the individual was hired directly to be a manager (Y) or promoted to manager (N)
#test_score : score on a test given to all managers
#group_size : the number of employees in the group they are managing
#concern_flag : whether or not the managers has received a complaint from a member of their group
#mobile_flag : whether or not the individual works mobile (Y) or in office (N)
#customers: the number of customer accounts the manager is responsible for
#high_hours_flag : whether or not the manager has entered unsually high hours into their timesheet
#transfers : the number of transfer requests coming from the manager's group while they were a manager
#reduced_schedule : whether the manager works part time (Y) or full time (N)
#city : the current office of the manager

# Visualize the data
plot_intro(perf.data)


# Lets visualize if any missing data exists in the dataset
plot_missing(perf.data)

#Since we are interested in the understanding of what factors drive performance group , 
# the following table shows the distribution of data across each performance group.

# Return %ages of workers in different classes of performance group
perf.data %>%
  group_by(performance_group) %>%
  summarise(n = n()) %>%
  ungroup() %>%
  mutate(pct = n / sum(n))%>%
  kable() %>%
  kable_styling(bootstrap_options = c("hover","striped","condensed"),full_width = F)
# We can see that 65.8% of managers belong to the middle performance group.

# ##Through bar charts , histograms , 
###QQ plots we examine the data more closely to derive some high level insights.

# This plot visualisizes frequency distributions for all the discrete features
plot_bar(perf.data)

####  Upon a closer view of the frequency distribution of the non-numeric discrete variables
#######  we can identify that :
############Majority of managers have been directly promoted to a manager position from the figures
 ###### Majority of the managers are located in the Toronto and New York offices

##Now lets visualize distributions of all the numeric / continuous variables.
plot_histogram(perf.data)
perf.data <- update_columns(perf.data,"transfers",as.factor)
perf.data %>%
  head(5)
##### We can see that the sub plots for the variables 
#####   customers , group_size , and yrs_employed are skewed either left or right


### The Quantile-Quantile plot which helps to visualize the deviation 
###    from a specific normal probabity distribution.

qq_data <- perf.data[, c("customers", "group_size", "test_score","yrs_employed")]
plot_qq(qq_data, sampled_rows = 1000L)


# Lets run the qq plot after converting the variables into the log values.


# Lets run the qq plot after converting the variables into the log values.

log_qq_data <- update_columns(qq_data, c("customers", "group_size", "yrs_employed"), function(x) log(x + 1))
plot_qq(log_qq_data[, c("customers", "group_size", "yrs_employed")], sampled_rows = 1000L)


# Lets transform the data in the perf.data table with the log values of the variables
perf.data <- update_columns(perf.data, c("customers", "group_size", "yrs_employed"), function(x) log(x + 1))

# Now lets visualize the QQ plot by the feature Performance_group

qq_data <- perf.data[, c("customers", "group_size", "yrs_employed", "test_score","performance_group")]
plot_qq(qq_data, by = "performance_group", sampled_rows = 1000L)


####
# 3. Correlation Analysis ----
####

# Plot correlation plot to display relationships
plot_correlation(na.omit(perf.data), maxcat = 5L)

# You can generate correlation plot for character and discrete variables separately also
plot_correlation(na.omit(perf.data), type = "c")
plot_correlation(na.omit(perf.data), type = "d")


###### ####
# 4. Define Training and Test Dataset ----
####

#Dividing data into training and test set
#Random sampling 
samplesize = 0.80*nrow(perf.data)
set.seed(100)
index = sample(seq_len(nrow(perf.data)), size = samplesize)
#Creating training and test set 
datatrain = perf.data[index,]
datatest = perf.data[-index,]





####
# 5. Modeling - Ordinal Logistic Regression ----
####

# load car package
install.packages("car")
library(car)

# Use the Intercept Model as the initial model;

lower.rm <- polr(performance_group ~ 1,data=datatrain)
summary(lower.rm)

