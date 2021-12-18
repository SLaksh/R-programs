# Download the file from https://www.kaggle.com/divyansh22/flight-delay-prediction?select=Jan_2020_ontime.csv
# Importing the libraries

library(tidyverse)
library(ggplot2)
library(GGally)

# OPENING THE FILE FROM MY DRIVE

data_flight <- read.csv("D:/MyFolderInJain/Subjects/Semester II/Data Analytics with R/DataSets/Jan_2020_ontime.csv")

View(data_flight)                         # view the data

# Another perspective to understand the raw data in a data frame is to use the glimpse() included in the dplyr package.
# installing the "dplyr" package

install.packages("dplyr")
library("dplyr")

#Using glimpse() function
glimpse(data_flight)

summary(data_flight)    # which will give the summary of all the columns.

# Yet another function similar to summarize() from 'skimmr' package
# Like summary(), skim()'s method for data frames presents results for every column; the statistics it provides depend on the class of the variable.

install.packages("skimr")
library("skimr")
skim(data_flight, DISTANCE)

# Compute Summary statistics using summarize() function
# summarize() function takes many values and summarizes them into a single value
#  In the below code , we have taken all the values of the DISTANCE column and then generated the summary statistics for
#   mean also called the average for the column
#   median, the middle value
#   minimum and maximum value in the column
#   first and the third quartile values
#   Standard deviation

# With all the Missing value in the column which is said by "na.rm = TRUE"


distance_summary <- data_flight %>% 
  summarize(
    min = min(DISTANCE, na.rm = TRUE),
    q1 = quantile(DISTANCE, 0.25, na.rm = TRUE),
    median = quantile(DISTANCE, 0.5, na.rm = TRUE),
    q3 = quantile(DISTANCE, 0.75, na.rm = TRUE),
    max = max(DISTANCE, na.rm = TRUE),
    mean = mean(DISTANCE, na.rm = TRUE),
    sd = sd(DISTANCE, na.rm = TRUE),
    missing = sum(is.na(DISTANCE))
  )
View(distance_summary)      # where I get the summary only for the variable "DISTANCE" and the summary is seen in the script window

head(distance_summary)      # VIEW  the summary in console


# Now we have the data we can explore for some questions like
#   1. How many flights from Chicago to JFK in Jan 2020?
#   2. Which carriers operated between ORD and JFK, and how many flights did each of them operate in Jan 2020?
#   3. How many flights were delayed from Chicago to JFK?
#   4. How many flights delayed were beyond the normal range and from which carriers?
 
# which can started by filtering the data on our columns of interest

# For Question 1 we use the select() function where we select the following :
# DAY_OF_MONTH, OP_CARRIER_FL_NUM, OP_CARRIER, ORIGIN, DEST, DEP_TIME, ARR_TIME, DISTANCE, DEP_DEL15, ARR_DEL15, CANCELLED
# and finally filter it on ORIGIN using the "filter()" function on ORD which is CHICAGO

chicago_flights <- data_flight %>% select(DAY_OF_MONTH,OP_CARRIER_FL_NUM,OP_CARRIER, ORIGIN, DEST,
         DEP_TIME,ARR_TIME, DISTANCE, DEP_DEL15, ARR_DEL15, CANCELLED  ) %>% 
        filter(ORIGIN=='ORD')

chicago_flights               # will display our select

# Going for our question 1.  How many flights from Chicago to JFK
number_of_flights <- chicago_flights %>% summarise(count=n())
number_of_flights         # we get the count as 25661


#  Going to our question 2 which carriers operated between ORD & JFK in Jan 2020
#  This is done by Gruping them on OP_CARRIER and summarizing for the counts

list_of_carriers <- chicago_flights %>% group_by(OP_CARRIER) %>% summarise(count=n())

list_of_carriers   # will list the summarized count of OP_carriers wise

# The next task is to do the visualization
# the Barchart is used with the function geom_col() function with the title and
#   the geom_text() aesthetics of label is used to display the count total

ggplot(data = list_of_carriers, mapping = aes(x = OP_CARRIER, y= count)) +
  geom_col(position = "dodge", fill="thistle") +
  ggtitle("Carriers between ORD and JFK") +
  xlab("Carriers") +
  ylab("count") +
  geom_text(aes(label = count))
# Where we have 12 carriers between ORD & JFK

# Now Question 3.How many flights were delayed from CHICAGO & JFK
# the Pipes are used
# Initially the CHICAGO_FLIGHTS are filtered for Destination JFK using filter() fn
# and then gorup_by() fn is used to group on DEP_DEL15 and summarise() for count

flights_to_jfk <- chicago_flights %>% filter(DEST=='JFK') %>%
  group_by(DEP_DEL15) %>%
  summarise(count=n()) 
flights_to_jfk                # we have 208 columns with many fields of "NA"

#Plotting using bar diagram on the above data

ggplot(data= flights_to_jfk, 
       mapping= aes(x=DEP_DEL15, y=count)) +
  geom_col(fill="plum1") +
  ggtitle('JFK flights on time/delay')+ 
  xlab('Ontime/delay')+ 
  ylab('Count') + 
  geom_text(aes(label=count))

# Remove any rows with missing data for DEP_DEL15 using drop_na()

flights_to_jfk1 <-flights_to_jfk %>% drop_na(DEP_DEL15)
flights_to_jfk1


# Renaming some of the columnvalues
colnames(data_flight)                 # will list the column names of the dataset

names(data_flight)[names(data_flight) == "DEP_DEL15"] <- "Delay in Departure"
colnames(data_flight) 

# Question: 4 how many flights delayed beyond normal range & which carrier
# First find the delay in flights by subtracting the Arrival time from the departure time 
#   and 
# If we have an arrival time after midnight, we get negative values for the duration. 
# Hence we use an ifelse() within the mutate()

flights_to_jfk_dur <- chicago_flights %>% 
  filter(DEST=='JFK') %>%
  mutate(duration =ifelse( as.numeric(ARR_TIME) > as.numeric(DEP_TIME), 
                           as.numeric(ARR_TIME) - as.numeric(DEP_TIME),
                           (2400 + as.numeric(ARR_TIME) )- as.numeric(DEP_TIME)))

flights_to_jfk_dur
#  Remove rows for any missing duration we do
flights_to_jfk_dur1 <- flights_to_jfk_dur %>%filter(!is.na(duration))
flights_to_jfk_dur1

# A boxplot is very helpful to find the flights between ORD and JFK that were delayed between the normal range

ggplot(flights_to_jfk_dur1, aes(y=duration)) + geom_boxplot(color="red", outlier.color = "blue4") +
  ggtitle("Flight Duration Outliers ORD to JFK")


#  Different colors
ggplot(flights_to_jfk_dur1, aes(y=duration)) + geom_boxplot(fill="thistle1", outlier.color = "blue4") +
  ggtitle("Flight Duration Outliers ORD to JFK")
##    "This boxplot show that two flights were delayed beyond the normal range


# Finding out the OUTLIER by declaring a function function()
#  Outliers are observations above 1.5 * IQR + third IQR or anything below 1.5 * IQR + first quartile.
is_outlier <- function(x) {
  return(x < quantile(x, 0.25) - 1.5 * IQR(x) | 
           x > quantile(x, 0.75) + 1.5 * IQR(x))
}


#   The next task is to Group all the flights between ORD and JFK by OP_CARRIER
#      and then add another column called outliers using "mutate()" for the outliers for each of the carriers.

flights_to_jfk_dur1 <- flights_to_jfk_dur1 %>%
  group_by(OP_CARRIER) %>%
  mutate(outlier = ifelse(is_outlier(duration), duration, as.numeric(NA)))

library(ggplot2)
ggplot(flights_to_jfk_dur, aes(y=duration, x= OP_CARRIER, fill=OP_CARRIER)) +
  geom_boxplot() +
  ggtitle("Outliers per Carrier for flight between ORD and JFK")


# To display the label on the box plot

ggplot(flights_to_jfk_dur1, aes(y=duration, x= OP_CARRIER)) +
  geom_boxplot()+ 
  ggtitle("Outliers per Carrier for flight between ORD and JFK") +
  xlab("Flight Carriers") +
  geom_text(aes(label = outlier),
            na.rm=TRUE, 
            position=position_jitter(width=1,height=1))

# The plot is so monotonous and lifeless
# Adding some color

ggplot(flights_to_jfk_dur1, aes(y=duration, x= OP_CARRIER, fill=OP_CARRIER)) +
  geom_boxplot()+ 
  ggtitle("Outliers per Carrier for flight between ORD and JFK") +
  xlab("Flight Carriers") +
  geom_text(aes(label = outlier),
            na.rm=TRUE, 
            position=position_jitter(width=1,height=1))

# Still working on the size of the overlapping font we can do it by doing it on 
# size 


ggplot(flights_to_jfk_dur1, aes(y=duration, x= OP_CARRIER, fill=OP_CARRIER)) +
  geom_boxplot(outlier.color = "navy")+ 
  ggtitle("Outliers per Carrier for flight between ORD and JFK") +
  xlab("Flight Carriers") +
  geom_text(aes(label = outlier), na.rm=TRUE, 
            position=position_jitter(width=1,height=1),size = 2.5)
