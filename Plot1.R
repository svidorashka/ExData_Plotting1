#download and unzip the file
RawFile <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",RawFile)
unzip(RawFile)
unlink(RawFile)



#filter the raw text file into a filtered file, which contains only the relevant dates
Unzipped<-file("household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(Unzipped), value=TRUE), sep="\n", file="filtered.txt")
close(Unzipped)

#Read data into Data.Frame
Data<-read.table("filtered.txt", sep=";", header=TRUE, quote="",na.string="?", stringsAsFactors=TRUE)

#Build the chart into png
png("Plot1.png", width=480, height=480)
hist (Data$Global_active_power, 
      col="red", 
      main="Global Active Power", 
      xlab="Global Active Power (kilowatts)",
)
dev.off()
