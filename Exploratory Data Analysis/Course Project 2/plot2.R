library(data.table)

## read data
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- readRDS("Source_Classification_Code.rds")

## sum up PM25 emission by year after filtering by fips = "24510"
PM25.emission <- 
  NEI[fips == "24510", .(total_PM25 = sum(Emissions)), by = year]

## barplot
barplot(height = PM25.emission$total_PM25,
        names.arg = as.character(PM25.emission$year),
        col = "blue",
        main = "Total PM2.5 Emission (Tons) by Year\nBaltimore City, Maryland", 
        xlab = "Year", ylab = "Emission (Tons)")

## save as PNG
dev.copy(png, "plot2.png", width = 480, height = 480, units = 'px')
dev.off(4)
