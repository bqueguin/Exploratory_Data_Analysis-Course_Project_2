library(ggplot2)
source("getData.R")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999-2008
# for Baltimore City? Which have seen increases in emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.

Baltimore <- subset(NEI, fips == "24510")

g <- ggplot(data = Baltimore, aes(x = year, y = Emissions, fill = type)) +
    geom_bar(stat = "sum", show.legend = F) +
    facet_grid(. ~ type) +
    labs(title = expression("PM"[2.5]*" emissions by year and by type in Baltimore City"), 
         y = expression("PM"[2.5]*" emissions in tons"),
         caption = "Based on National Emissions Inventory dataset")

png("plot3.png")         
plot(g)
dev.off()