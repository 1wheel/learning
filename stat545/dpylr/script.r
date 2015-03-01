gtbl  <-  gtbl %>%
  mutate(bench = meanByYear$lifeExp[match(year, meanByYear$year)]
         benchDif = lifeExp - bench
         belowBench = lifeExp < bench)