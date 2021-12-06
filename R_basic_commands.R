#extracting sequentially
substring(lorem, seq_len(nchar(lorem)))


# reverse substrings with negative positions
substring(lorem, -seq_len(nchar(lorem)))

# replacing with negative positions
lorem = "Lorem Ipsum"
substring(lorem, -1) <- "Nullam"

# multiple replacements
lorem = "Lorem Ipsum"
substring(lorem, c(1, 7), c(5, 8)) <- c("Nullam", "Enim")

# Vector replacements by one digit of all elements
x <- c("15 line 435", "good weather", "89 pigs")
y <- sub("[[:digit:]]","",x)
y

# gsub to replace all patterns of a target string
y <- gsub("[[:digit:]]","",x)
y

