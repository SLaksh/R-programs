##            For evaluating the similarity scores and the edit distance for the above discussed methods in R we have installed the stringdist package
install.packages("stringdist")

###           We are also utilising the hashr package so that Jaccard and cosine similarity are evaluated word wise instead of letter wise. 
install.packages("hashr")

install.packages("tidyverse")
install.packages("flextable")
# install klippy for copy-to-clipboard button in code chunks
install.packages("remotes")
remotes::install_github("rlesur/klippy")


#### Now that we have installed the packages, we activate them as shown below.
# set options
options(stringsAsFactors = F)          # no automatic data transformation
options("scipen" = 100, "digits" = 12) # suppress math annotation
# activate packages
library(stringdist)
library(hashr)
library(tidyverse)
library(flextable)
# activate klippy for copy-to-clipboard button
klippy::klippy()

###  TEXTS
text1 = "The quick brown fox jumped over the wall"
text2 = "The fast brown fox leaped over the wall"
insert_ex = c("Marta","Martha")
del_ex = c("Genome","Gnome")
rep_ex = c("Tim","Tom")

####### JACCARD SIMILIARITY
# Using the seq_dist function along with hash function to calculate the Jaccard similarity word-wise
### ""  seq_dist function ""  - Computes pairwise dissimilarities between sequences or dissimilarity from a reference sequence.
###  Several dissimilarity measures can be chosen, including optimal matching (OM) and many of its variants, distance based on the count of common attributes, and distances between sequence state distributions.


jac_sim_score = seq_dist(hash(strsplit(text1, "\\s+")), hash(strsplit(text2, "\\s+")), method = "jaccard",q=2)
print(paste0("The Jaccard similarity for the two texts is ",jac_sim_score))


###### COSINE SIMILARITY
# Using the seq_dist function along with hash function to calculate the Jaccard similarity word-wise
cos_sim_score = seq_dist(hash(strsplit(text1, "\\s+")), hash(strsplit(text2, "\\s+")), method = "cosine",q=2)
print(paste0("The Cosine similarity for the two texts is ",cos_sim_score))