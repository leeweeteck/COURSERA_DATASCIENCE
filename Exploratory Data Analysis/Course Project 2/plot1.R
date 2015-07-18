library(data.table)

## read data
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- readRDS("Source_Classification_Code.rds")

## sum up PM25 emission by year
PM25.emission <- NEI[, .(total_PM25 = sum(Emissions)), by = year]

## barplot
barplot(height = PM25.emission$total_PM25,
        names.arg = as.character(PM25.emission$year),
        col = "blue",
        main = "Total PM2.5 Emission in the U.S. By Year", 
        xlab = "Year", ylab = "Emission in Tons")

## save as PNG
dev.copy(png, "plot1.png", width = 480, height = 480, units = 'px')
dev.off(4)
