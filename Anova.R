
###########################################################################################
###### ANOVA
###########################################################################################

students <- read.csv("D:/MyFolderInJain/Subjects/2022(Jan - May)/II Sem-BA-R/Data Analytics with R/DataSets/students.csv", header=TRUE)
str(students)
#### The students data set consists of 8239 rows, each of them representing a particular student,
#### and 16 columns, each of them corresponding to a variable/feature related to that particular student. 

#### In order to showcase the one-way ANOVA hypothesis test we examine the mean annual salary of graduates, grouped by their major STUDY-SUBJECT.
### In this exercise we want to test if the mean annual salary of graduates is different among graduates of different study subjects.

##### Data exploration and preparation

###  We randomly sample 275 students from the data set using the sample() function in R. 
### We want to make sure to sample only from graduated students, that is why we subset the data
###  beforehand with the subset() function in R.

graduated <- subset(students, graduated == 1)

n <- 275
data.idx <- sample(x = 1:nrow(graduated), size = n)
data <- graduated[data.idx, c('major','salary')]
head(data, 10)


### we visualize the counts for each of the 6 different study subjects in our sample by plotting a bar plot
install.packages("ggplot2")
library(ggplot2)
p <- ggplot(data, aes(major)) +
  geom_bar(width=.5,fill="purple4") +
  coord_flip() +
  theme(axis.title.y=element_blank())
p


##Before we start with the hypothesis test, we check if the assumptions for the one-way ANOVA
### hypothesis test are fulfilled. The samples are random and independent samples.
### We check the normality assumption by plotting a normal probability plot (Q-Q plots) for each grouped variable.

p1 <- qplot(sample = salary, data = data, color=major) +theme_minimal()
p1
## theme_minimal() - A classic-looking theme, with x and y axis lines and no gridlines.

### we test the assumption of equal standard deviations
####R provides some excellent functions to calculate statistical parameters across different groupings
#### of a data set. These functions refer to the apply() function family. 
###For our example we use the tapply() function to calculate the standard deviations for each group.

#calculate standart deviation
sd.groups <- tapply(X = data$salary, INDEX = data$major, FUN = sd)
sd.groups

#### As a rule of thumb, we consider the equal standard deviations assumption as fulfilled, 
##if the ratio of the largest to the smallest sample standard deviation is less than 2 (Weiss 2010)

#calculate ratio of the largest to the smallest sample standard deviation
ratio <- max(as.vector(sd.groups)) / min(as.vector(sd.groups))
ratio

##### The ratio of the largest to the smallest sample standard deviation is 1.834. That is close to the threshold of 2, but for our toy example still acceptable. Thus, we conclude that the assumptions are fulfilled.
## Note that one-way ANOVA is robust to moderate violations of normality assumption and the equal standard deviations assumption (Weiss 2010).
###  Hypothesis Testing
# In order to conduct the one-way ANOVA hypothesis test we follow the step-wise implementation procedure for hypothesis testing.
# 
###STEP 1: State the null hypothesis H0 and alternative hypothesis HA
# 
# The NULL HYPOTHESIS states that the mean annual salary is equal among all groups of graduates.
# 
# H0:??1=??2=??3=??4=??5=??6
# 
#ALTERNATIVE HYPOTHESIS
# HA:Not all the means are equal


####STEP 2; Decide on the significance level, ??
alpha <- 0.01

#### STEP 3 and 4: Compute the value of the test statistic and the p-value.
## In order to calculate the F test statistic, we need to determine several quantities beforehand. 
# For illustration purposes we manually compute the F test statistic in R. 
# Step by step we populate the ANOVA table until we finally get the F test statistic and consequently the p-value.


data$major
levels(data$major)
### WE FIRST CALCULATE THE DEGREE OF FREEDOM
k <- length(levels(data$major))
k
n <- nrow(data)
n

df.G <- k - 1
df.G

df.E <- n - k 
df.E

df.T <- n - 1
df.T

####NEXT WE CALCULATE THE THREE SUMS SST, SST, SSG, and SSE. 
## THE EQUATION IS SST=???i=1n(xi???x¯)2,

# calculate overall mean
x.bar <- mean(data$salary)

# observation data
xi <- data$salary

# calculate SST
SST <- sum((xi - x.bar)^2)
SST

#### NEXT WE CALCULATE  SSG=???i=1nnj(x¯i???x¯)2
# calculate sample size for each group
n.j <- tapply(X = data$salary, INDEX = data$major, FUN = length)

# calculate mean for each group
xi.bar <- tapply(X = data$salary, INDEX = data$major, FUN = mean)

# calculate SSG
SSG <- sum(n.j * (xi.bar - x.bar)^2)
SSG

#### NEXT WE CALCULATE   SSE=???i=1n(nj???1)s2j,

# calculate standart deviation for each group
s2.j <- tapply(X = data$salary, INDEX = data$major, FUN = sd)

# calculate SSE
SSE <- sum((n.j-1)*s2.j^2)
SSE

##### NEXT WE CALCULATE the two measures of mean variability, MSG, and MSE.

# calculate MSG
MSG <- SSG/(k-1)
MSG
## [1] 2771952541
# calculate MSE
MSE <- SSE/(n-k)
MSE

##### FINALLY we obtain the F-statistics by the ratio of MSG and MSE.
Fstat <- MSG/MSE
Fstat


#### In the last step we calculate the p-value by calling the pf() function in R. Recall how to calculate the degrees of freedom.
#   df=(k???1,n???k)

####Because the null hypothesis is rejected only when the test statistic, F, is too large, a one-way ANOVA test is always right tailed.

df1 = k-1
df2 = n-k

p.value <- pf(q = Fstat, df1 = df1, df2 = df2, lower.tail = FALSE)
p.value

####  STEP 5: If p?????, reject H0; otherwise, do not reject H0.
p.value <= alpha


##### In order to conduct a one-way ANOVA hypothesis test in R we apply the aov() function. 
##  The aov() function expects the so-called formula-notation, thus we provide our data by separating our two variables of interest by ~. 
#   Further, we provide a data frame in which the variables specified in the formula are found.

anova <- aov(salary ~ major, data = data)
summary(anova)

############  Compare the output of the aov() function with our result from above. 
###        Again, we may conclude that at the 1% significance level, the data provides very strong
##     evidence to conclude that at least one pair of group means is different from each other.

str(airquality)
airquality