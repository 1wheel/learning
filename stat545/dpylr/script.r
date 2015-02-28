
GDPextent <- gtbl %>%
  select(year, country, continent, gdpPercap) %>%
  arrange(continent, year) %>%
  group_by(continent) %>%
  filter(min_rank(desc(gdpPercap)) < 2 | min_rank(gdpPercap) < 2)

(GDPextent)

ggplot(GDPextent, aes(x = year, y = gdpPercap, color=continent)) + geom_point() +geom_line()
