NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by = "SCC")

library(ggplot2)

coal <- grepl("coal",NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coal,]

totalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png('Plot4.png')
x<-ggplot(totalByYear, aes(factor(year), Emissions))
x<-x + geom_bar(stat = "identity")+
  ggtitle('Coal Emissions by Year')
print(x)
dev.off()
