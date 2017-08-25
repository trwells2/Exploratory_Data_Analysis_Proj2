NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('Plot1.png')
barplot(height=totalByYear$Emissions, names.arg=totalByYear$year, xlab="Year", 
        ylab=expression('total PM2.5 Emission'),
        main=expression('Total PM2.5 Emissions'))
dev.off()