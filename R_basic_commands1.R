#Logical Operators | (or) and  & (and)
foo <- c("a", NA, 4,7,8,9)
!is.na(foo)     # Returns TRUE for all non-NA

class(foo)
# The operator ! negates the a logical value
a<- foo[!is.na(foo)]
a           # The output is "a" "4" "7" "8" "9"


#Logical operators || and && 
linkedin <- c(16,9, 13,5,2,17,14)
facebook <- c(17,7,5, 16,8, 13,14)
linkedin >10 & facebook <10


#Data modes in R
a<- c(4,5,6,7,8,9)
class(a)  # get the output as numeric

b <- c("Hi", "hello", "Hey")
class(b)       # get the output as "character"

c <- c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
class(c)    # get the output as 'logical"

# Factor Data in R
data <- c("East","West","East","North","North","East","West","West","West","East","North")
print(data) 

print(is.factor(data)) # [1] FALSE

factor_data <- factor(data)
print(is.factor(factor_data)) # Output is : [1] TRUE

# Ordered Factor 
status <- c("lo", "hi", "med", "med", "hi", "lo")
ordered_status <- factor(status, levels = c("lo", "med", "hi"), ordered = TRUE)

my_lang_level <- factor(c("basic", "Proficient", "Advanced", "Minimal", "minimal"))
myLang_level <- ordered(my_lang_level, levels = c("Minimal", "Basic", ))

#Generating Factor Levels is done using "gl()" function
v <- gl(3,4,labels = c("Good", "Better", "Best"))
print(v)

#Reclassifying the factors
# Initially ordering the factors
myfac <- factor(c("Basic", "Proficient", "Advanced", "Minimal"))
myfac_o <- ordered(myfac, levels = c("Minimal", "Basic", "Proficient", "Advanced"))
myfac_o
class(myfac_o)        # output is [1] "ordered" "factor" 

#for Unclassing
unclass(myfac_o) # the output is [1] 2 3 4 1 # attr(,"levels") # [1] "Minimal"    "Basic"      "Proficient" "Advanced" 


