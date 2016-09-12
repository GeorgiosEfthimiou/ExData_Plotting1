library(dplyr)
library(lubridate)

#Reading the desired data
data3 <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880)

#Transforming the data
data3 <- data3 %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
                        V9 = as.numeric(as.character(V9))) %>% select(V1,V7:V9)

#Printing the .png file
png("plot3.png", width=480, height=480)
plot(data3$V1, data3$V7, type="l", ylab="Energy Submetering", xlab="")
lines(data3$V1, data3$V8, type="l", col="red")
lines(data3$V1, data3$V9, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()