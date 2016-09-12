library(dplyr)
library(lubridate)

#Reading the desired data
data4 <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880)

#Transforming the data
data4 <- data4 %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3)),
                        V4 = as.numeric(as.character(V4)),
                        V5 = as.numeric(as.character(V5)),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
                        V9 = as.numeric(as.character(V9)))

#Printing the .png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(data4$V1,data4$V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(data4$V1,data4$V5, type="l", xlab = "datetime", ylab = "Voltage")
plot(data4$V1,data4$V7, type="n", xlab = "", ylab = "Energy Sub Metering")
points(data4$V1,data4$V7, col="black", type="l")
points(data4$V1,data4$V8, col="red", type="l")
points(data4$V1,data4$V9, col="blue", type="l")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
plot(data4$V1,data4$V4, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()