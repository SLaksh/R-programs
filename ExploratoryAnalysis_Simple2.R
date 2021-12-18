# downloading the data from the kaggle website
# https://www.kaggle.com/ronitf/heart-disease-uci.
# https://bookdown.org/dli/rguide/putting-everything-together.html

# Reading the data

dat <- read.csv("D:/MyFolderInJain/Subjects/Semester II/Data Analytics with R/DataSets/heart.csv", header=TRUE)
head(dat)                  # the data shows 14 column

# DESCSRIPTION OF THE COLUMNS ARE :

"
age - age of patient in years
sex - 0 for female and 1 for male
cp - chest pain type (1 for typical angina, 2 for atypical angina, 3 for non-anginal pain and 4 for asymptmatic)
trestbps - resting blood pressure on admission to the hospital (blood pressure is measured in mmHg)
chol - cholesterol serum measured in mg/dl
fbs - 0 for false and 1 for true if fasting blood sugar > 120 mg/dl
restecg - resting electrocardiographic (ecg) results (0 for normal, 1 for having ST-T wave abnormality, 2 for showing probable or definite left ventricular hypertrophy)
thalach - maximum heart rate achieved
exang - 0 for No and 1 for Yes for exercise induced angina
oldpeak - ST depression induced by exercise relative to rest
slope - the slope of peak exercise ST segment
ca - number of major vessels (0 - 3) colored by flourosopy
thal - thallium stress test (1 for Fixed Defect, 2 for Normal, 3 for Reversible Defect)
Target - diagnosis of heart disease (0 for < 50% and 1 for > 50% diameter narrowing in any major vessel)"

# VIEW THE FULL DATASET
view(dat)

# VIEW THE DATASET BETWEEN 160 TO 170
dat[c(160:170), ]

# DELETING THE ROW 164 AND 165 AS THEY ARE SAME - to remove duplicate
dat1 <- dat[-164, ]

# Now viewing the dataset betwenn 160 -170
dat1[c(160:170), ]

# View the age any particular dataset
dat$ï..age[170]
dat1$ï..age[170]

# RENAMING A VARIABLE IN THE DATASET
names(dat1)[names(dat1) == "cp"] <- "chest_pain"
names(dat1)[names(dat1) == "..age"] <- "Age"

# CHECK WHETHER THE NAMES ARE CHANGED
head(dat1)

# CHANGING SOME ENTRIES IN THE DATASET
dat1$sex[dat1$sex == "0"] <- "Female"
dat1$sex[dat1$sex == "0"] <- "Male"

# CHECK FOR THE CHANGES
head(dat1)

#Categorical Variable Count
table(dat1$sex)

# Statistics for Quantitative Variables
#  MEAN
mean(dat1$trestbps)

# STANDARD DEVIATION
sd(dat1$trestbps)

# YOU CAN FIND THE MIN MAX FUNCTION AND THE VALUES

#SUMMARY STATISTICS OF THE DATASET
summary(dat1$thalach)

fivenum(dat1$thalach)                 # returns the Tukey fivenum summary

# Inter-quartile Range
IQR(dat1$thalach)                    #The interquartile range formula is the first quartile subtracted from the third quartile:
                                     #  	IQR = Q3 - Q1.
# Outliers
boxplot.stats(dat1$thalach)$out      # This function is typically called by another function to gather the statistics necessary for producing box plots, 
                                     # GIVEN BY boxplot.stats(x, coef = 1.5, do.conf = TRUE, do.out = TRUE) 
                                     # where x = vector on which boxplot is constructed
                                     # coef = how the whiskers are displayed if +ve extend to extreme if =0 to extend to the data extremes

# # Horizontal boxplot  Syntax: boxplot(x, data, notch, varwidth, names, main) where
                                   # x: This parameter sets as a vector or a formula.
                                   # data: This parameter sets the data frame.
                                   # notch: This parameter is the label for horizontal axis.
                                   # varwidth: This parameter is a logical value. Set as true to draw width of the box proportionate to the sample size.
                                   # main: This parameter is the title of the chart.
                                   # names: This parameter are the group labels that will be showed under each boxplot.
                                   # xlab, ylab - the title for x and y axis

boxplot(heart$thalach,horizontal = TRUE,main = "Boxplot of Maximum Heart Rate Achieved", 
        xlab = "Maximum Heart Rate Achieved")
boxplot(dat1$thalach,                      
        horizontal = TRUE,
        main = "Boxplot of Maximum Heart Rate Achieved", 
        xlab = "Maximum Heart Rate Achieved")


# # Histogram 
hist(dat1$thalach, main = "Histogram of Maximum Heart Rate Achieved",
     xlab = "Maximum Heart Rate Achieved")


#  Dealing with Outliers
#  Looking for boxplot and histogram of the variable, cholesterol 

boxplot(dat1$chol, horizontal = TRUE, main = "Boxplot of Cholesterol", xlab = "Cholesterol (in mg/dl)", col = c(rgb(0.1,0.1,0.7,0.5) , rgb(0.8,0.1,0.3,0.6)))
#  Show a lot of Outliers 

#Plotting the histogram with the color
hist(dat1$chol, main = "Histogram of Cholesterol", xlab = "Cholesterol (in mg/dl", col = "bisque")

# Plotting the histogram with rgb combination
hist(dat1$chol, main = "Histogram of Cholesterol", xlab = "Cholesterol (in mg/dl", col = rgb(0,0.8,0.8,1) )

# Both the Box plot and Histogram shows a lot of outliers
# This is done by stats() function
boxplot.stats(dat1$chol)$out



