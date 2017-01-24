source("getData.R")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission
# from all sources for each of the years 1999, 2002, 2005, and 2008.

totalByYear <- with(NEI, tapply(Emissions, year, sum))

png("plot1.png")
barplot(totalByYear, col = "blue",
        main = expression("Total emissions of PM"[2.5]*" in the USA at various years"),
        xlab = "Year", ylab = expression("PM"[2.5]*" emitted, in tons"))
dev.off()

# Emissions from PM2.5 decreases in the USA from 1999 to 2008