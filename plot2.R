library(dplyr)
library(lubridate)

#Reading the desired data
data2 <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880)

#Transforming the data
data2 <- data2 %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),V3 = as.numeric(as.character(V3))) %>% 
        select(V1,V3)

#Printing the .png file
png("plot2.png", width=480, height=480)
plot(data2$V1,data2$V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()