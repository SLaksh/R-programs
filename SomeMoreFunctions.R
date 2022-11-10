data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata

rdata = factor(data,labels=c("I","II","III"))
rdata

lets = sample(letters,size=100,replace=TRUE)
lets = factor(lets)
table(lets[1:5])

a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
# To generate a random sample of 5 elements from vector a without replacement, we can use the following syntax
sample(a, 5)

l1 = factor(sample(letters,size=10,replace=TRUE))
l1
l2 = factor(sample(letters,size=10,replace=TRUE))
l2
l12 = factor(c(levels(l1)[l1],levels(l2)[l2]))
l12