### For the current model, let's take the Boston dataset that is part of the MASS library in R Studio. 

library(MASS)
library(ggplot2)
attach(Boston)
names(Boston)

### Split the sample data and make the model

##Sample the dataset. The return for this is row nos.
set.seed(1)                                         ### sets the starting number used to generate a sequence of random numbers - it ensures that you get the same result if you start with that same seed each time you run the same process
row.number <- sample(1:nrow(Boston), 0.8*nrow(Boston))
train = Boston[row.number,]
test = Boston[-row.number,]
dim(train)
dim(test)

#######Explore the response variable
##      Let's check for the distribution of response variable 'medv'
###  WE DO A THREEE DISTRIBUTIONS ON THE VARIABLE -'medv' original, log transformation and square root transformation

##Explore the data.
par( mfrow= c(1,3))
ggplot(Boston, aes(medv)) + geom_density(fill="lightpink")
ggplot(train, aes(log(medv))) + geom_density(fill="yellow")
ggplot(train, aes(sqrt(medv))) + geom_density(fill="blue")

###  INFERENCES - We can see that both 'log' and 'sqrt' does a decent job to transform 'medv' distribution closer to normal.

#Let's make default model.
model1 = lm(log(medv)~., data=train)
summary(model1)
par(mfrow=c(2,2))
plot(model1)
  lm(formula = log(medv) ~ ., data = train)
####  Model Building - Model 1
