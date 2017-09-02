NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by = "SCC")

library(ggplot2)


subsetNEI <- NEI[NEI$fips=="24510"| NEI$fips=="06037" &NEI$type=="ON-ROAD",]

totalByYear <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

png('Plot6.png')
x<-ggplot(totalByYear, aes(factor(year), Emissions))
x<-x + facet_grid(.~fips)
x<-x + geom_bar(stat = "identity")+
  ggtitle('Emissions from Motor Vehicles in Baltimore City vs. LA by Year')
print(x)
dev.off()
