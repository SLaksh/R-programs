# CREATING DATA FRAMES
friend.data <- data.frame(friend_id = c(1:6), friend_name = c("Sachin", "Sourav", "Sanjay", "Stephen", "Siddharth", "Sumanth"), friend_res =c("Bengaluru", "Pune", "Bombay", "Gaya", "NewDelhi","chennai"), stringsAsFactors = FALSE)
friend.data                                      # print the dataframe as table

# Get the structure of the data frame
str(friend.data)                          # will get an output of 
                    "'data.frame':	6 obs. of  3 variables:
                    $ friend_id  : int  1 2 3 4 5 6"
                    #$ friend_name: chr  "Sachin" "Sourav" "Sanjay" "Stephen" ...
                    #$ friend_res : chr  "Bengaluru" "Pune" "Bombay" "Gaya" ...

# Add columns to the existing DATAFRAME
exp = c(1,2,3,4,5,6)
cbind(friend.data, exp)       # The output is 
                              "friend_id friend_name friend_res exp
                              1         1      Sachin  Bengaluru   1
                              2         2      Sourav       Pune   2
                              3         3      Sanjay     Bombay   3
                              4         4     Stephen       Gaya   4
                              5         5   Siddharth   NewDelhi   5
                              6         6     Sumanth    chennai   6"

# Extract data from a DATA FRAME
result <- data.frame(friend.data$friend_name, friend.data$friend_res)
result1<- friend.data[1,2]               # will extract the first two columns

result1<- friend.data[1:2,]              # will extract  only first two rows

# Extract 3rd and 5th row with 2nd and 4th column
friend1.data <- cbind(friend.data, exp)
friend1.data

result2 <- friend1.data[c(3,4),c(2,4)]
result2

# Add One more column to the existing DATAFRAME
friend1.data$dept <- c("IT", "Logistics", "Finance", "Marketing", "Analytics", "Warehouse")
friend1.data                      # will print the dataframe with the department added

# Add one more ROW to the existing DATAFRAME
sevnth_row <- c("7", "Srijith", "Cochin", "10", "Sales")
friend2.data <- rbind(friend1.data, sevnth_row)       # USE RBIND Function
friend2.data

