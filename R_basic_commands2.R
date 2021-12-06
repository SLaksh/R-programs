# vector examples in R
#Numeric vectors are done in two ways 'c' and ":"
#Numeric vectors using c
X <- c(61, 4, 21, 67, 89, 2)
cat('using c function', X, '\n')      # output is "using c function 61 4 21 67 89 2 
#cat converts its arguments to character strings, concatenates them, 
#separating them by the given sep= string, and then prints them


#NUMERIC VECTORS

v1 <- c(4,5,6,7,8,9,10)
typeof(v1)                    #output [1] "double" "IN MEMORY"

class(v1)                     #output is [1] "numeric  because 
#The class function in R helps us to understand the type of object, 
#for example the output of class for a data frame is integer and the
#typeof of the same object is list because data frames are stored as list 
#in the memory but they are represented as a data frame. 

#CHARACTER VECTORS
v2 <- c('CMS', 'BUSINESS', 'SCHOOL', '@', 'Bengaluru')
typeof(v2)
class(v2)

# LOGICAL VECTORS
v3 <- c(TRUE, FALSE, TRUE, FALSE)
typeof(v3)
class(v3)

# DATE VECTORS
# uSING seq() function
seq( as.Date("2011-07-01"), by=1, len=3)

# Using as.Date() function
as.Date("2011-07-01") + 0:2

# Using integer declaration and converting to Date.
x <- 1:3
class(x) <- "Date"
x

#Using TIMEVECTOR
Sys.time()                               # Provide the system time
lubridate::now()                         # Provide the current time
lubridate::now(tzone = "UTC")            # Provide the UTC- Universal Coordinated Time
lubridate::now(tzone = "EST")            # Provide the EST - Eastern Standard time

bdays = c(tukey=as.Date('1915-06-16'),fisher=as.Date('1890-02-17'), cramer=as.Date('1893-09-25'), kendall=as.Date('1907-09-06'))
weekdays(bdays)     # prints the Day of the birthdays


# COMBINING VECTORS
fruits <- c("Apple", "oranges", "banana")
vegetables <- c("cabbage", "spinach", "tomatoes")
my_basket_items <- c(fruits, vegetables)
my_basket_items

# CREATING MATRICES
mymat <- matrix(1:36, nrow = 6, ncol = 6)         # create a matrix with 6 rows and 6 columns starting from 1 to 36
rownames(mymat) <- LETTERS[1:6]                   # give a ROW heading of Letter starting from A to f
colnames(mymat) <- LETTERS[7:12]                  # give the COLUMN heading similarly
class(mymat)                                      # displays the class of "mymat"

mymat                                             # WILL DISPLAY THE MATRIX

rownames(mymat)                                   # displays the ROWNAMES of the matrix

colnames(mymat)                                   # Displays the column names

dim(mymat)                                        # Displays the dimension of the matrix

# Easy way of creating MATRICES
A = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3, byrow = TRUE)
rownames(A)= c("A", "B", "C")
colnames(A) = c("E","F", "G")
A

# CREATING MATRIX USING A CONSTANT "Syntax: matrix(k, m, n)"
matrix(5, 3, 3)                                 # will display matrix with a unique constant'5'
# the output would be      [,1] [,2] [,3]
#                    [1,]    5    5    5
#                    [2,]    5    5    5
#                    [3,]    5    5    5

#Accessing the elements of the matrix
A[1:2,]                                    # Accessing first and second row of the matrix A
A[,1:2]                                    # Accessing the first and second column of the matrix A
A[3,3] = 20                                # Changing the 3 row 3 column element for 20


# Adding to the existing MATRICES
myvec <- c(5,4,6,7,8,10)                          # creating a vector
newmat <- cbind(mymat, myvec)                     # binding the vector to the existing matrix
newmat                                            # displaying the newmatrix

# MAtrix Multiplication
x<- matrix(c(1,2,3,4,5,6), c(3,2))
y <- matrix(c(4,5,6,7,8,9), c(2,3))
x%*%y

#Another way of Matrix Multiplication
mat1 <- matrix(c(3,9,-1,5,8,5), nrow = 2)
mat2 <- matrix(c(5,4,3,2,7,3), nrow = 2)
mat3 <- mat1 * mat2
#matrix DIVISION
mat4 <- mat1 / mat2

# Find the INVERSE matrix of a given one using the "solve()" function
solve(A)

# To Find the Transpose of a Matrix
x<- matrix(c(1,2,3,4,5,7,12,10,6),c(3,3))
t(x)

# To find the Dimension and set the dimension of rows and columns in a matrix
x<- matrix(c(1,2,3,4,5,7,12,10,6),c(3,3))
x
#Output[,1] [,2] [,3]
#[1,]    1    4   12
#[2,]    2    5   10
#[3,]    3    7    6


# Usage of "cbind" & "rbind" function in matrix
a<- 1:5
b <- 7:11
c <- 13:17
z<- cbind(a,b,c)
w <- rbind(a,b,c)
z                                     # will print the matrix in column
w                                     # will print the matrix in row

# WORKING WITH "LIST"
#Creating a List
Z<- list("a" = 2.5, "b" = TRUE, "c" = 1:5)
Z                                   # will print the members of the list and the output be 
#$a
#[1] 2.5
#$b
#[1] TRUE
#$c
#[1] 1 2 3 4 5

# Use of function "length" & " typeof"
typeof(Z)                       # the output would be "[1] "list""
length(Z)                       # the output would be " [1] 3   "

# Another way of creating LIst with a Vector, Matrix and List
list2 <-list(c("Jan","Feb","Mar", "Apr"), matrix(c(2,4,6,8,10,-3,-5,1),nrow =2), list("green", 12.5))> 
names(list2) <- c("Monthwise", "Matrix", "The Inner List")
list2                          # will give the following output
# Monthwise
# [1] "Jan" "Feb" "Mar" "Apr"
# 
# $Matrix
# [,1] [,2] [,3] [,4]
# [1,]    2    6   10   -5
# [2,]    4    8   -3    1
# 
# $`The Inner List`
# $`The Inner List`[[1]]
# [1] "green" 
# 
# $`The Inner List`[[2]]
# [1] 12.5 


# Accessing the elements of the List
list2[1]                              # will subsequently print the first member of the list
list2[2]                              # Subsequently second
list2[3]                              # third member of the list

#Creating list another way
mylist <- list(vec = myvec, mat = mymat, arr = myarray, date = mydate)

" where myvec is 
[1]  5  4  6  7  8 10

> mymat is 
G  H  I  J  K  L
A 1  7 13 19 25 31
B 2  8 14 20 26 32
C 3  9 15 21 27 33
D 4 10 16 22 28 34
E 5 11 17 23 29 35
F 6 12 18 24 30 36

> myarray
, , Boring

Slow Moderate Fast
tiny      1        7   13
small     2        8   14
medium    3        9   15
large     4       10   16
big       5       11   17
huge      6       12   18

, , Fun

Slow Moderate Fast
tiny     19       25   31
small    20       26   32
medium   21       27   33
large    22       28   34
big      23       29   35
huge     24       30   36"

#mydate is
#[1] "2012-07-20"

names(mylist)                   # the output is [1] "vec"  "mat"  "arr"  "date"

#Creating ARRAYS using array() function which has the syntax "array(data, dim = (nrow, ncol, nmat), dimnames=names)"
"where,
    nrow : Number of rows
    ncol : Number of columns
    nmat : Number of matrices of dimensions nrow * ncol
    dimnames : Default value = NULL."

myarray <- array(1:42, dim = c(6,3,2), dimnames = list(c("tiny", "small", "medium", "large", "big", "huge"), c("Slow", "Moderate", "Fast"), c("Boring", "Fun")))
myarray                               # will display the array

# Another way of creating the same
vec1 <- c(5,10,15,20)
vec2 <- c(25,30,35,40,45,45,50,60)
fin_array <- array(c(vec1,vec2), dim = c(4,4,3))
fin_array
" The output is , , 1

     [,1] [,2] [,3] [,4]
[1,]    5   25   45    5
[2,]   10   30   45   10
[3,]   15   35   50   15
[4,]   20   40   60   20

, , 2

     [,1] [,2] [,3] [,4]
[1,]   25   45    5   25
[2,]   30   45   10   30
[3,]   35   50   15   35
[4,]   40   60   20   40

, , 3

     [,1] [,2] [,3] [,4]
[1,]   45    5   25   45
[2,]   45   10   30   45
[3,]   50   15   35   50
[4,]   60   20   40   60"

#Printing the list 
str(mylist)
# List of 4
# $ vec : num [1:6] 5 4 6 7 8 10
# $ mat : int [1:6, 1:6] 1 2 3 4 5 6 7 8 9 10 ...
# ..- attr(*, "dimnames")=List of 2
# .. ..$ : chr [1:6] "A" "B" "C" "D" ...
# .. ..$ : chr [1:6] "G" "H" "I" "J" ...
# $ arr : int [1:6, 1:3, 1:2] 1 2 3 4 5 6 7 8 9 10 ...
# ..- attr(*, "dimnames")=List of 3
# .. ..$ : chr [1:6] "tiny" "small" "medium" "large" ...
# .. ..$ : chr [1:3] "Slow" "Moderate" "Fast"
# .. ..$ : chr [1:2] "Boring" "Fun"
# $ date: Date[1:1], format: "2012-07-20"