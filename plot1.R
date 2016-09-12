library(dplyr)
library(lubridate)

#Reading the desired data
data1 <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880)

#Transforming the data
data1 <- data1 %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

#Printing the .png file
png("plot1.png", width=480, height=480)
hist(data1$V3, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.off()