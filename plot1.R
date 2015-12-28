unzip("./data/exdata-data-NEI_data.zip")
# Check if both data exist. If not, load the data.
if (!"neiData" %in% ls()) {
        neiData <- readRDS("./summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
        sccData <- readRDS("./Source_Classification_Code.rds")
}

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot1.png", 
    width = 480, height = 480, 
    units = "px")
totalEmissions <- aggregate(neiData$Emissions, list(neiData$year), FUN = "sum")
# options(scipen=0)
# options(scipen=999)
plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()
