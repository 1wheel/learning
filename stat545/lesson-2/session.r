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
p <- ggplot(subset(gDat, continent != "Oceania"),aes(x = gdpPercap, y = lifeExp)) # just initializes
p <- p + scale_x_log10() # log the x axis the right way
p + geom_point() # scatterplot
p + geom_point(aes(color = continent)) # map continent to color
p + geom_point(alpha = (1/3), size = 3) + geom_smooth(lwd = 3, se = FALSE)
## geom_smooth: method="auto" and size of largest group is >=1000, so using gam with formula: y ~ s(x, bs = "cs"). Use 'method = x' to change the smoothing method.
p + geom_point(alpha = (1/3), size = 3) + facet_wrap(~ continent)


# more ggplot2p  <- ggplot(gDat, aes(x = gdpPercap, y = lifeExp))
p + geom_point()
p  <- ggplot(gDat, aes(x = log10(gdpPercap), y = lifeExp))
p + geom_point()
p + geom_point() + scale_x_log10
p + geom_point() + scale_x_log10()
p + geom_point()
p  <- ggplot(gDat, aes(x = gdpPercap, y = lifeExp))
p + geom_point() + scale_x_log10()
p  <- p + scale_x_log10()
p + geom_point(aes(color = continent))
p + geom_point(aes(color = continent, alpha = (1/3), size= 3))
p + geom_point(aes(alpha = (1/3), size= 3))
p + geom_point(aes(alpha = (1/4), size= 3))
p + geom_point(aes(alpha = (1/10), size= 3))
p + geom_point(aes(alpha = (1/100), size= 3))
p + geom_point(alpha = (1/100), size= 3)
p + geom_point(alpha = (1/3), size= 3)
p + geom_point(alpha = (1/3), size= 3) + geom_smooth()
p + geom_point(alpha = (1/3), size= 3) + geom_smooth(lwd = 3, se = FALSE)
p + geom_point(alpha = (1/3), size= 3) + geom_smooth(lwd = 3, se = FALSE, method = 'lm')
p + aes(color=continent) + geom_point(alpha = (1/3), size= 3) + geom_smooth(lwd = 3, se = FALSE, method = 'lm')
p + aes(color=continent) + geom_point(alpha = (1/3), size= 3) + geom_smooth(lwd = 3, se = FALSE)
p + aes(color=continent) + geom_point(alpha = (1/3), size= 3) + facet_wrap(~ continent)
p + aes(color=continent) + geom_point(alpha = (1/3), size= 3) + facet_wrap(~ continent) + geom_smooth(lwd = 3)
p + aes(color=continent) + geom_point(alpha = (1/3), size= 3) + facet_wrap(~ continent) + geom_smooth(lwd = 3, se=false)
p + aes(color=continent) + geom_point(alpha = (1/3), size= 3) + facet_wrap(~ continent) + geom_smooth(lwd = 3, se = FALSE)
p + geom_point(alpha = (1/3), size= 3) + facet_wrap(~ continent) + geom_smooth(lwd = 3, se = FALSE)
q  <- ggplot(gDat, aes(x=year, y=lifeExp))
q + geom_points()
q + geom_point()
q + geom_point() + facet_wrap(~ continent)
q + geom_point() + facet_wrap(~ continent) + geom_smooth(lwd = 3)
q + geom_smooth(lwd = 3) + geom_point() + facet_wrap(~ continent)
q + geom_line(aes(group = country)) + geom_point() + facet_wrap(~ continent)
ggplot(gDat, aes(x = gdpPercap, y = lifeExp)) + scale_x_log10() + geom_bin2d()
ggplot(gDat, aes(x=continent, y=lifeExp)) + geom_point()
ggplot(gDat, aes(x=continent, y=lifeExp)) + geom_point() + geom_jitter()
ggplot(gDat, aes(x=continent, y=lifeExp)) + geom_point() + geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)
ggplot(gDat, aes(x = continent, y = lifeExp)) +
geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)
ggplot(gDat, aes(x = continent, y = lifeExp)) + geom_boxplot()
ggplot(gDat, aes(x = continent, y = lifeExp)) +
geom_boxplot(outlier.colour = "hotpink") +
geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)
ggplot(gDat, aes(x = continent, y = lifeExp)) +
geom_jitter(position = position_jitter(width = 0.1), alpha = 1/4) +
stat_summary(fun.y = median, colour = "red", geom = "point", size = 5)
ggplot(gDat, aes(reorder(x = continent, lifeExp), y = lifeExp)) +
geom_jitter(position = position_jitter(width = 0.1), alpha = 1/4) +
stat_summary(fun.y = median, colour = "red", geom = "point", size = 5)
ggplot(gDat, aes(x = lifeExp)) + geom_histogram()
ggplot(gDat, aes(x = lifeExp)) + geom_density()
ggplot(gDat, aes(x = lifeExp, fill = continent)) + geom_histogram()
ggplot(gDat, aes(x = lifeExp, fill = continent)) +
geom_histogram(position = "identity")
ggplot(gDat, aes(x = lifeExp, fill = continent)) +
geom_histogram(position = "identity")
ggplot(gDat, aes(x = lifeExp, color = continent)) + geom_density()
ggplot(gDat, aes(x = lifeExp, fill = continent)) + geom_density(alpha = 0.2)
ggplot(subset(gDat, continent != "Oceania"),
aes(x = lifeExp, fill = continent)) + geom_density(alpha = 0.2)
ggplot(gDat, aes(x = continent)) + geom_bar()
p <- ggplot(gDat, aes(x = reorder(continent, continent, length)))
p + geom_bar()
p + geom_bar() + coord_flip()
p + geom_bar(width = .04) + coord_flip()

