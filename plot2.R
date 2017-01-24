source("getData.R")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

Baltimore <- subset(NEI, fips == "24510")
BaltimoreByYear <- with(Baltimore, tapply(Emissions, year, sum))

png("plot2.png")
barplot(BaltimoreByYear, col = "red",
        main = expression('Total emissions of PM'[2.5]*' in the Baltimore City at various years'),
        xlab = "Year", ylab = expression('PM'[2.5]*' emitted, in tons'))
dev.off()