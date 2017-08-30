NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI <- NEI[NEI$fips == "24510",]

totalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('Plot2.png')
barplot(height=totalByYear$Emissions, names.arg=totalByYear$year, xlab="Year", 
        ylab=expression('total PM2.5 Emission'),
        main=expression('Total PM2.5 Emissions in Baltimore City, MD "24510"'))
dev.off()
