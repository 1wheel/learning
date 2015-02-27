list.files()
gDat < read.delim("gapMinderDataFiveYear.txt")
gDat <- read.delim("gapMinderDataFiveYear.txt")
View(gDat)
View(gDat)
str(gDat)
head(gDat)
tail(gDat)
names(gDat)
ncol(gDat)
summary(gDat)
plot(lifeExp ~ year, gDat)
plot(lifeExp ~gdpPercap, gDat)
plot(lifeExp ~ gdpPercap, gDat)
plot(lifeExp ~ log(gdpPercap), gDat)
head(gDat$lifeExp)
summary(gDat$lifeExp)
length(gDat$lifeExp)
hist(gDat$lifeExp)
str(gDat$continent)
table(gDat$continent)
table(gDat$continent)
barplot(table(gDat$continent))
p <- ggplot(subset(gDat, continent != "Oceania"),
aes(x = gdpPercap, y = lifeExp)) # just initializes
p <- p + scale_x_log10() # log the x axis the right way
p + geom_point() # scatterplot
p + geom_point(aes(color = continent)) # map continent to color
p + geom_point(alpha = (1/3), size = 3) + geom_smooth(lwd = 3, se = FALSE)
## geom_smooth: method="auto" and size of largest group is >=1000, so using gam with formula: y ~ s(x, bs = "cs"). Use 'method = x' to change the smoothing method.
p + geom_point(alpha = (1/3), size = 3) + facet_wrap(~ continent)
p <- ggplot(subset(gDat, continent != "Oceania"),
aes(x = gdpPercap, y = lifeExp)) # just initializes
library(ggplot2)
p <- ggplot(subset(gDat, continent != "Oceania"),
aes(x = gdpPercap, y = lifeExp)) # just initializes
p <- p + scale_x_log10() # log the x axis the right way
p + geom_point() # scatterplot
p + geom_point(aes(color = continent)) # map continent to color
p + geom_point(alpha = (1/3), size = 3) + geom_smooth(lwd = 3, se = FALSE)
## geom_smooth: method="auto" and size of largest group is >=1000, so using gam with formula: y ~ s(x, bs = "cs"). Use 'method = x' to change the smoothing method.
p + geom_point(alpha = (1/3), size = 3) + facet_wrap(~ continent)
