library(data.table)
library(ggplot2)
library(grid)

## read data
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- readRDS("Source_Classification_Code.rds")

## sum up PM25 emission by year after filtering by fips = "24510"
PM25.emission <- 
  NEI[fips == "24510", .(total_PM25 = sum(Emissions)), by = .(type, year)]

## panel line plots
g <- ggplot(data = PM25.emission, aes(x = year, y = total_PM25))

g + 
  geom_line(size = 1.5) +
  facet_grid(. ~ type) +
  xlab("Year") +
  ylab("PM2.5 Emission (Tons)") +
  ggtitle(paste0("Total PM2.5 Emission (Tons) by Year and Source Type", 
                 "\nBaltimore City, Maryland")) +
  theme(plot.title = element_text(size = rel(2), face = "bold", vjust = 2),
        axis.title.x = element_text(face = "bold", size = rel(1.5), vjust = -0.5),
        axis.title.y = element_text(face = "bold", size = rel(1.5), vjust = 2),
        strip.text.x = element_text(face = "bold", size = rel(1.5)),
        axis.text = element_text(size = rel(1.2)),
        plot.margin = unit(c(1, 1, 1, 1), "cm"),
        legend.position = "none"
  )

## save as PNG
dev.copy(png, "plot3.png", width = 960, height = 480, units = 'px')
dev.off(4)
