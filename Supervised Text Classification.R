
install.packages("tm")
install.packages("readr")
install.packages("dplyr")
install.packages("SnowballC")
install.packages("caTools")
install.packages("randomForest")

##An R interface to the C 'libstemmer' library that implements Porter's word stemming algorithm for collapsing words to a common root to aid comparison of vocabulary.

library(readr)
library(dplyr)

#Text mining packages
library(tm)
library(SnowballC)
library(caTools)

library(randomForest)

#loading the data
#setwd("D:/MyFolderInJain/Subjects/2022(July-Dec)")
t1 <- read.csv("D:/MyFolderInJain/Subjects/2022(July-Dec)/21MBADSE343- Text and Image Data analytics/ContentForClass/Dataset/Womens Clothing E-Commerce Reviews.csv",header = TRUE)
glimpse(t1)  

### Preparing Data for Modeling
###Since the text data is not in the traditional format of observations in rows, and variables in columns, we will have to perform certain text-specific steps. The list of such steps is discussed in the subsequent sections.

### Step 1 - Create the Text Corpus
###The variable containing text needs to be converted to a corpus for preprocessing. A corpus is a collection of documents

corpus = Corpus(VectorSource(t1$Review.Text))
##  prints the content of the first corpus
corpus[[1]][1]
##  prints the corresponding recommendation score.
t1$Recommended_IND[1]

#### From the output and Looking at the review text, it is obvious that the customer was not happy with the product, and hence gave the recommendation score of zero.

###    Step 2 - Conversion to Lowercase
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, tolower)
corpus[[1]][1]  

##### Step 3 - Removing Punctuation

corpus = tm_map(corpus, removePunctuation)
corpus[[1]][1]

#### Step 4 - Removing Stopwords
corpus = tm_map(corpus, removeWords, c("cloth", stopwords("english")))
corpus[[1]][1]  

### Step 5 - Stemming
corpus = tm_map(corpus, stemDocument)
corpus[[1]][1]  

####      Text preprocessing steps are complete. Now we are ready to extract the word frequencies, which will be used as features in our prediction problem
#####    " Create Document Term Matrix"
####      We will be using function called 'DocumentTermMatrix' from the tm package and generates a matrix

frequencies = DocumentTermMatrix(corpus)
frequencies

###      Results in a matrix that contains zeroes in many of the cells, a problem called 'Sparsity'. It is advisable to remove such words that have a lot of zeroes across the documents.
####      Matrices that contain mostly zero values are called sparse, distinct from matrices where most of the values are non-zero, called dense.

sparse = removeSparseTerms(frequencies, 0.995)

### The final data preparation step is to convert the matrix into a data frame, a format widely used in 'R' for predictive modeling. 
tSparse = as.data.frame(as.matrix(sparse),replace=TRUE)

## this line of code makes all the variable names R-friendly
colnames(tSparse) = make.names(colnames(tSparse))

### adds the dependent variable to the data set.
tSparse$recommended_id = t1$Recommended_IND

###   But before that, it is always a good idea to set the baseline accuracy of the model. The baseline accuracy, in the case of a classification problem, is the proportion of the majority label in the target variable. 
###A baseline is the result of a very basic model/solution. You generally create a baseline and then try to make more complex solutions in order to get a better result. If you achieve a better score than the baseline, it is good.

prop.table(table(tSparse$recommended_id)) #73.6% is the baseline accuracy

head(tSparse)
####  Machine Learning
####   Creating Training and Test Data


set.seed(100)
split = sample.split(tSparse$recommended_id, SplitRatio = 0.7)
##trainSpares <- t1[split,]
trainSparse = subset(tSparse,)
trainSparse
dim(trainSparse)
testSparse = subset(tSparse,)
dim(testSparse)

### WE ARE USING "RandomForest" FOR CLASSIFICATION

set.seed(100)
trainSparse$recommended_id = as.factor(trainSparse$recommended_id)
testSparse$recommended_id = as.factor(testSparse$recommended_id )

#Lines 5 to 7
RF_model = randomForest(recommended_id ~ ., data=trainSparse)
predictRF = predict(RF_model, newdata=testSparse)
table(testSparse$recommended_id, predictRF)

# Accuracy
117/(117+33) #78%