source("getData.R")
library(ggplot2)

# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?


# We first search the SCC code for coal combustion-related
coalRelated <- grepl("coal", SCC$Short.Name, ignore.case = T)
coalCode <- SCC$SCC[coalRelated]

coalData <- subset(NEI, SCC %in% coalCode)

# aggregatedTotalByYear <- aggregate(Emissions ~ year, coalData, sum)


g <- ggplot(coalData, aes(year, Emissions/10^5)) + 
    geom_bar(stat = "sum", fill = "red", show.legend = F) +
    ggtitle(expression("PM"[2.5]*" emissions from coal combustion-related by year")) + 
    ylab(expression("PM"[2.5]*" emissions in tons " (10^5))) + 
    labs(caption = "Based on National Emissions Inventory dataset")

png("plot4.png")
plot(g)
dev.off()
