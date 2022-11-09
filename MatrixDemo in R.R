##### FIRST METHOD USING SPLIT()
# Demo for Matrix conversion to Vector
M = matrix(10:24, ncol=3)

# print the matrix
print(M)

# create matrix to list off column vector
l =  split(M, rep(1:ncol(M), each = nrow(M)))

# print the list
print(l)


#### SECOND METHOD USING LIST()
M = matrix(20:37, ncol = 3)

# print the matrix
print(M)

# as.list() is used to convert an object into list
# as.data.frame() is used to convert as object into
# data frame M is converted into the data frame then
# that data frame is converted into the list
l<-as.list(as.data.frame(M))

# print the list
print(l)


#####ACCESSING THE ELEMENT OF MATRIX USING LOGICAL VALUES
# create a vector named data with 9 elements
data=c(11,22,33,44,55,66,77,88,99)

# pass this vector to matrix input
a=matrix(data, nrow = 3, ncol = 3)
print(a)

# accessing elements 
a[c(TRUE, TRUE,FALSE, FALSE,TRUE, FALSE,TRUE, FALSE,TRUE)]
