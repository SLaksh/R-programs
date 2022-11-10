install.packages("magick")
library(magick)

tiger <- image_read_svg('D:/MyFolderInJain/Subjects/2022(July-Dec)/21MBADSE343- Text and Image Data analytics/ContentForClass/tiger.png', width = 350)
print(tiger)