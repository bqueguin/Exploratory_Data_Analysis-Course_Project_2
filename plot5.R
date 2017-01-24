source("getData.R")
library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Search vehicle related SCC codes

vehicleBool <- grepl("vehicle", SCC$EI.Sector, ignore.case = T)
vehicleSubset <- SCC$SCC[vehicleBool]

BaltimoreVehicle <- subset(NEI, fips == "24510" & SCC %in% vehicleSubset)

aggregatedBaltVeh <- aggregate(Emissions ~ year, BaltimoreVehicle, sum)

g <- ggplot(aggregatedBaltVeh, aes(year, Emissions)) + 
    geom_bar(stat = "identity", fill = "red") +
    ggtitle(expression("PM"[2.5]*" emissions from Baltimore's vehicles")) + 
    ylab(expression("PM"[2.5]*" emissions in tons")) + 
    labs(caption = "Based on National Emissions Inventory dataset")

png("plot5.png")
plot(g)
dev.off()