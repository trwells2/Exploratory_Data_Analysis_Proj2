NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

subsetNEI <- NEI[NEI$fips == "24510",]

totalByYear <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png('Plot3.png')
x<-ggplot(totalByYear, aes(year, Emissions, color = type))
x<-x + geom_line()

print(x)
dev.off()
