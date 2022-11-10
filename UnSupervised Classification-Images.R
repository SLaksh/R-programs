data("iris")
print(iris)

###    STEP 2
##      The next step is to separate the 3rd and 4th columns into separate object x 
##         as we are using the unsupervised learning method. 
##          We are removing labels so that the huge input of petal length and petal width columns
##          will be used by the machine to perform clustering unsupervised.

x=iris[,3:4] #using only petal length and width columns
head(x)


###   STEP 3
##     The next step is to use the K Means algorithm. 
##      K Means is the method we use which has parameters (data, no. of clusters or groups). 
##      Here our data is the x object and we will have k=3 clusters as there are 3 species in the dataset.


##   WE CALL the 'cluster' package is called. Clustering in R is done using this inbuilt package which will perform all the mathematics. Clusplot function creates a 2D graph of the clusters.
model=kmeans(x,3)
library(cluster)
clusplot(x,model$cluster)
##   Component 1 and Component 2 seen in the graph are the two components in PCA (Principal Component Analysis) which is basically a feature extraction method that uses the important components and removes the rest. It reduces the dimensionality of the data for easier KMeans application. 
##    All of this is done by the cluster package itself in R.

###   OUTPUT explained " These two components explain 100% variability" which means 
##      the data object x fed to PCA was precise enough to form clear clusters using KMeans and there is minimum (negligible) overlapping amongst them.


###   STEP 4
##     We assign different colors to the clusters and shading them hence we use the 
##      color and shade parameters setting them to 'T' which means true

clusplot(x,model$cluster,color=T,shade=T)