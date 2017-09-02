NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by = "SCC")

library(ggplot2)


subsetNEI <- NEI[NEI$fips=="24510"&NEI$type=="ON-ROAD",]

totalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('Plot5.png')
x<-ggplot(totalByYear, aes(factor(year), Emissions))
x<-x + geom_bar(stat = "identity")+
  ggtitle('Emissions from Motor Vehicles in Baltimore City by Year')
print(x)
dev.off()
