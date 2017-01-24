setwd("C:/Users/QUEGUINER/Desktop/Cours/Autre/Coursera/Exploratory Data Analysis/week4/Exploratory_Data_Analysis-Course_Project_2")
if (!dir.exists("data")){
    dir.create("data")
}
if (!file.exists("data/summarySCC_PM25.rds") | !file.exists("data/Source_Classification_Code.rds")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "data/data.zip")
    unzip("data/data.zip", exdir = "data")
    file.remove("data/data.zip")
}

# That takes few time.
if (!exists("NEI")){
    NEI <- readRDS("data/summarySCC_PM25.rds")
    NEI$type <- as.factor(NEI$type)
    NEI$year <- as.factor(NEI$year)
}

if (!exists("SCC")){
    SCC <- readRDS("data/Source_Classification_Code.rds")
}
