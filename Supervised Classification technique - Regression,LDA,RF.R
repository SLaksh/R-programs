# attach the iris dataset to the environment
data(iris)
# rename the dataset
dataset <- iris

######   " LOAD THE DATASET FROM THE "CSV file"
# define the filename
filename <- "iris.csv"
# load the CSV file from the local directory
dataset <- read.csv(filename, header=FALSE)
# set the column names in the dataset
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

######   2. NOW WE WILL CREATE A "VALIDATED DATASET"
##        We will split the loaded dataset into two, 80% of which we will use to train our models 
##        and 20% that we will hold back as a validation dataset

install.packages("caret")
library(caret)
##      "Got the Error "could not find function "createDataPartition", so we have to install "Caret" 
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)

# select 20% of the data for validation
validation <- dataset[-validation_index,]

# use the remaining 80% of data to training and testing the models
dataset <- dataset[validation_index,]

######   3.  NOW WE WILL DO A LITTLE SUMMARIZATION OF THE DATA - ACROSS
###          1. Dimensions of the dataset. 2.Types of the attributes. 3. Peek at the data itself.
##          4.  Levels of the class attribute.  5, Breakdown of the instances in each class.
##           6. Statistical summary of all attributes.

#             Dimensions of dataset
dim(dataset)

#            List types for each attribute
sapply(dataset, class)

#           "Take a peek at the first 5 rows of the data
head(dataset)

#           "List the levels for the class
levels(dataset$Species)

#           "Summarize the class distribution
percentage <- prop.table(table(dataset$Species)) * 100
##          " The prop.table() function in R can be used to calculate the value of each cell in a table as a proportion of all values    
###           i.e. The prop.table() function shows each individual value as a proportion of the whole.

cbind(freq=table(dataset$Species), percentage=percentage)

# summarize attribute distributions
summary(dataset)


##########      "  4. VISUALIZE THE DATASET
###              "Two plots - Univariate- to understand each attribute
###               "Multivariate plots - to understand relationship between attribute

# split inputs attributes x and the output attribute (or class) y. 
x <- dataset[,1:4]
y <- dataset[,5]

##       "Given that the input variables are numeric, we can create box and whisker plots of each.
# boxplot for each attribute on one image
par(mfrow=c(1,4))
for(i in 1:4) {   boxplot(x[,i], main=names(iris)[i]) }

###     "MULTIVARIATE PLOT
# scatterplot matrix
featurePlot(x=x, y=y, plot="ellipse")

install.packages("ellipse")
library(ellipse)
featurePlot(x=x, y=y, plot="ellipse")

# box and whisker plots for each attribute
featurePlot(x=x, y=y, plot="box")

##     " Sometimes histograms are good for this, but in this case we will use 
##     some probability density plots to give nice smooth lines for each distribution

# density plots for each attribute by class value
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

###    5. EVALUATE SOME ALGORITHMS
###   Cross-validation is a statistical method used to estimate the skill of machine learning models.
##    That k-fold cross validation is a procedure used to estimate the skill of the model on new data.
##  Three common tactics for choosing a value for k are as follows:
##  A value of k=10 is very common in the field of applied machine learning, and is recommend if you are struggling to choose a value for your dataset.
##   TEST HARNESS

# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

###   BUILD MODELS
###   1. LINEAR DISCRIMINANT MODEL
###   2.  CLASSIFICATION AND REGRESSION MODEL
###   3.  SUPPORT VECTOR MACHINES
##    4.  RANDOM FOREST (RF)

# a) linear algorithms
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)

# b) nonlinear algorithms
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)

# c) advanced algorithms
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)

install.packages("randomForest")

library(randomForest)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

#### SELECT THE BEST MODEL
# summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, svm=fit.svm))
summary(results)

# compare accuracy of models
dotplot(results)

## The results for just the LDA model can be summarized.
# summarize Best Model
print(fit.lda)


#### 6. MAKE PREDICTIONS
##  The LDA was the most accurate model. 
##    Now we want to get an idea of the accuracy of the model on our validation set.
##   We can run the LDA model directly on the validation set and summarize the results in a confusion matrix.

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)