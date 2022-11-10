dat <- data.frame(id = c(rep("JDM",3), rep("JAH", 4), rep("JLJ", 3)),
                  month=c(4, 15, 50, 11, 14, 18, 25, 2, 12, 14),
                  sbp=c(123, 153, 124, 157, 155, 143, 153, 163, 173, 133))

dat

library(dplyr)  #load the dplyr package
filter(group_by(dat, id), month==max(month))
#The group_by() function partitions the data into groups based in the id variable, 
#  and the filter() function then operates within this structure 
#      to determine which rows meet the condition that month is equal to the maximum value for month


#   We can even improve a little on the dplyr code above, the "nested" structure is still a little difficult 
##           to read especially if we wanted to do more operations. 
##       The pipe (%>%) operator can be used with dplyr functions to improve readability, 
###          here is the same code rewritten with the pipe operator
dat %>%
  group_by(id) %>%
  filter(month==max(month))


dsub <- aggregate(dat$month, by=list(dat$id), max)
dsub

dsub2 <- aggregate(dat$month, by=list(dat$id), sum)
dsub2

dsub1 <- merge(dat, dsub, by.x=1, by.y=1)
dsub1

dsub1[dsub1$x==dsub1$month, ]

dat %>% 
  group_by(id) %>% #group on id
  arrange(sbp) %>% #arrange in ascending order by sbp
  mutate(count=1:n()) %>% #create a count from 1 to highest val.
  filter(count==max(count)-1) #take the row with the second last count

