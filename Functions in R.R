# seq() function generates a sequence of numbers
seq(1,5)                      # the Output is  [1] 1 2 3 4 5

seq(10)                       # Output is [1]  1  2  3  4  5  6  7  8  9 10

seq(4,10,0.75)                # Output is [1]  4.00  4.75  5.50  6.25  7.00  7.75  8.50  9.25 10.00

seq(from=1,to=10,by=2)        # Output is [1] 1 3 5 7 9

seq(3, 10, length.out = 5)   # the length.out function return random numeric numbers of specified lenght
                             # the output is "[1]  3.00  4.75  6.50  8.25 10.00

seq(3, 10, along.with = 1:5) # the along.with function argument specifies that the output of the seq function should have the same length as the data object assigned to along.with.
                             # the OUtput is [1]  3.00  4.75  6.50  8.25 10.00

# create a time interval of 5 minutes for a 24 hour from a given time
# done using seq() function with POSIXt i.e. seq.POSIXt() function
format( seq.POSIXt(as.POSIXct(Sys.Date()), as.POSIXct(Sys.Date()+1), by = "5 min"),
        +         "%H%M", tz="GMT")

# Time Functions
