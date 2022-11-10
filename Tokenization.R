##  https://programminghistorian.org/en/lessons/basic-text-processing-in-r

### https://github.com/programminghistorian/jekyll/tree/gh-pages/assets/basic-text-processing-in-r

install.packages("tidyverse")
install.packages("tokenizers")

library(tidyverse)
library(tokenizers)

##### Word Tokenization
text <- paste("Now, I understand that because it's an election season",
              "expectations for what we will achieve this year are low.",
              "But, Mister Speaker, I appreciate the constructive approach",
              "that you and other leaders took at the end of last year",
              "to pass a budget and make tax cuts permanent for working",
              "families. So I hope we can work together this year on some",
              "bipartisan priorities like criminal justice reform and",
              "helping people who are battling prescription drug abuse",
              "and heroin abuse. So, who knows, we might surprise the",
              "cynics again")

### As a first step in processing this text, we will use the tokenize_words function
##    from the tokenizers package to split the text into individual words.

words <- tokenize_words(text)
words

length(words)
#### We get an output equal to '1'.  
##      The reason that the length is equal to 1 is that the function tokenize_words returns
##         a list object with one entry per document in the input. 
##           Our input only has a single document and therefore the list only has one element.

 #### To see the words inside the first document, we use the symbol [[1]] to select 
##        just the first element of the list:

length(words[[1]])


####  The separation of the document into individual words makes it possible to see how many
##      times each word was used in the text. To do so, we first apply the 'table' function 
##      to the words in the first (and here, only) document and then split apart the names 
##       and values of the table into a single object called a data frame.

tab <- table(words[[1]])
tab <- data_frame(word = names(tab), count = as.numeric(tab))
tab

####  We can also sort the table using the arrange function. 
##    The 'arrange' function takes the dataset to be worked on, here tab, 
##     and then the name of the column to arrange by

arrange(tab, desc(count))
##  The 'desc' function in the second argument indicates that we want to sort in descending order.

#### INFERENCE : The most common words are pronouns and functions words such as "and", "i", 
##    "the", and "we". Notice how taking the lower-case version of every word helps in the 
##     analysis here. The word "We" at the start of the sentence is not treated differently than the "we" in the middle of a sentence.


######  DETECTING SENTENCE BOUNDARIES    ####


##  The tokenizer package also supplies the function 'tokenize_sentences' that splits a text 
##    into sentences rather than words
sentences <- tokenize_sentences(text)
sentences


##   It is possible to pair the output of the sentence tokenizer with the word tokenizer. 
##    If we pass the sentences split from the paragraph to the 'tokenize_words' function, 
##     each sentence gets treated as its own document
sentence_words <- tokenize_words(sentences[[1]])
sentence_words

####   Checking the size of the output  "documents" 
length(sentence_words)

#####   To figure out how many words are in each sentence of the paragraph:
length(sentence_words[[1]])
length(sentence_words[[2]])
length(sentence_words[[3]])
length(sentence_words[[4]])

###   The above code might be so cumbersome, confusing
##     Instead the 'sapply' function applies its second argument to every element of its first argument. 
##      As a result, we can calculate the length of every sentence in the paragraph with one line of code

sapply(sentence_words, length)


##### EXPLORATORY ANALYSIS

base_url <- "https://raw.githubusercontent.com/programminghistorian/jekyll/gh-pages/assets/basic-text-processing-in-r/"
url <- sprintf("%s/sotu_text/236.txt", base_url)
text <- paste(readLines(url), collapse = "\n")

words <- tokenize_words(text)
length(words[[1]])

tab1 <- table(words[[1]])
tab1 <- data_frame(word = names(tab), count = as.numeric(tab))
tab1 <- arrange(tab, desc(count))
tab1

wf <- read_csv(sprintf("%s/%s", base_url, "word_frequency.csv"))
wf

tab <- inner_join(tab, wf)
tab

print(filter(tab, frequency < 0.002), n = 15)


