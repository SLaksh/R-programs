plot(1, 1, col = "white", xlab = "X", ylab = "Y") 
polygon(x = c(0.7, 1.3, 1.2, 0.8),                           # X-Coordinates of polygon
        y = c(0.6, 0.8, 1.4, 1),                             # Y-Coordinates of polygon
        col = "#1b98e0",                                     # Color of polygon
        border = "red",                                      # Color of polygon border
        lwd = 5)                                             # Thickness of border

dev.off()
x1 <- 1:10                                                   # X values for frequency polygon
y1 <- c(2, 4, 7, 4, 5, 8, 6, 6, 1, 2)    
plot(x1, y1,                                                 # Plot frequency polygon
     type = "l",                                             # Set line type to line
     lwd = 3)  

polygon(c(1, x1, 10), c(0, y1, 0),                           # X-Y-Coordinates of polygon
        col = "#1b98e0") 


