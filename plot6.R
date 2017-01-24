source("getData.R")
library(ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

vehicleBool <- grepl("vehicle", SCC$EI.Sector, ignore.case = T)
vehicleSubset <- SCC$SCC[vehicleBool]

vehicle <- subset(NEI, fips %in% c("24510", "06037") & SCC %in% vehicleSubset)
vehicle$fips[vehicle$fips == "24510"] <- "Baltimore City"
vehicle$fips[vehicle$fips == "06037"] <- "Los Angeles"


g <- ggplot(vehicle, aes(year, Emissions)) + 
    geom_bar(aes(fill = year), stat = "sum", show.legend = F) +
    facet_grid(. ~ fips) +
    ggtitle(expression("PM"[2.5]*" emissions from vehicles by city and by year")) + 
    ylab(expression("PM"[2.5]*" emissions in tons")) + 
    labs(caption = "Based on National Emissions Inventory dataset")

png("plot6.png")
plot(g)
dev.off()