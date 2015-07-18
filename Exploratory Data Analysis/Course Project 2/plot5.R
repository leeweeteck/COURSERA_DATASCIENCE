library(data.table)
library(ggplot2)
library(grid)

## read data
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))

## define motor vehicle sources as categories in "EI.Sector" that
## contain the words "mobile" and "vehicles"
idx <- grep("(.*mobile.*vehicles)|(.*vehicles.*mobile)", 
            SCC$EI.Sector, ignore.case = T)
matched.SCC <- SCC$SCC[idx]

## sum up PM25 emission by year for motor vehicle sources in Baltimore City
PM25.emission <- NEI[SCC %in% matched.SCC & fips == "24510", 
                     .(total_PM25 = sum(Emissions)), by = year]

## line plot
g <- ggplot(data = PM25.emission, aes(x = year, y = total_PM25))

g + 
  geom_line(size = 1.5) +
  xlab("Year") +
  ylab("PM2.5 Emission (Tons)") +
  ggtitle(paste0("Total PM2.5 Emission (Tons) by Year",
                 "\nBaltimore City, Motor Vehicle Sources")) +
  theme(plot.title = element_text(size = rel(1.5), face = "bold", vjust = 2),
        axis.title.x = element_text(face = "bold", size = rel(1.2), vjust = -0.5),
        axis.title.y = element_text(face = "bold", size = rel(1.2), vjust = 2),
        axis.text = element_text(size = rel(1.1)),
        plot.margin = unit(c(1, 1, 1, 1), "cm")
  )

## save as PNG
dev.copy(png, "plot5.png", width = 480, height = 480, units = 'px')
dev.off(4)
