# Factors
Adam Pearce  



Drop Oceania

```r
gDat  <- gDat  %>% filter(continent != 'Oceania')
unique(gDat$continent)
```

```
## [1] Asia     Europe   Africa   Americas
## Levels: Africa Americas Asia Europe Oceania
```

```r
dim(gDat)
```

```
## [1] 1680    6
```

There's still a Oceania level, use `droplevels` to remove

```r
gDat  <- gDat  %>% filter(continent != 'Oceania') %>% droplevels
unique(gDat$continent)
```

```
## [1] Asia     Europe   Africa   Americas
## Levels: Africa Americas Asia Europe
```

```r
dim(gDat)
```

```
## [1] 1680    6
```

Model life expectancy as a function of the year

```r
j_coefs <- ddply(gDat, ~ country + continent, function(dat, offset = 1952) {
  the_fit <- lm(lifeExp ~ I(year - offset), dat)
  setNames(coef(the_fit), c("intercept", "slope"))
})

j_coefs %>% summary
```

```
##         country       continent    intercept         slope         
##  Afghanistan:  1   Africa  :52   Min.   :28.40   Min.   :-0.09302  
##  Albania    :  1   Americas:25   1st Qu.:39.96   1st Qu.: 0.20883  
##  Algeria    :  1   Asia    :33   Median :47.28   Median : 0.32449  
##  Angola     :  1   Europe  :30   Mean   :50.25   Mean   : 0.32756  
##  Argentina  :  1                 3rd Qu.:62.22   3rd Qu.: 0.45055  
##  Austria    :  1                 Max.   :72.21   Max.   : 0.77218  
##  (Other)    :134
```

arrage sorts smallest to largest, reorder does the opposite.

```r
post_arrange <- j_coefs %>% arrange(slope)
head(post_arrange)
```

```
##            country continent intercept       slope
## 1         Zimbabwe    Africa  55.22124 -0.09302098
## 2           Zambia    Africa  47.65803 -0.06042517
## 3           Rwanda    Africa  42.74195 -0.04583147
## 4         Botswana    Africa  52.92912  0.06066853
## 5 Congo, Dem. Rep.    Africa  41.96108  0.09391538
## 6        Swaziland    Africa  46.38786  0.09507483
```

```r
tail(post_arrange)
```

```
##          country continent intercept     slope
## 135  Yemen, Rep.      Asia  30.13028 0.6054594
## 136        Libya    Africa  42.10194 0.6255357
## 137    Indonesia      Asia  36.88312 0.6346413
## 138 Saudi Arabia      Asia  40.81412 0.6496231
## 139      Vietnam      Asia  39.01008 0.6716154
## 140         Oman      Asia  37.20774 0.7721790
```

```r
post_reorder <- j_coefs %>%
  mutate(country = reorder(country, slope))
head(post_reorder)
```

```
##       country continent intercept     slope
## 1 Afghanistan      Asia  29.90729 0.2753287
## 2     Albania    Europe  59.22913 0.3346832
## 3     Algeria    Africa  43.37497 0.5692797
## 4      Angola    Africa  32.12665 0.2093399
## 5   Argentina  Americas  62.68844 0.2317084
## 6     Austria    Europe  66.44846 0.2419923
```

```r
tail(post_reorder)
```

```
##                country continent intercept       slope
## 135          Venezuela  Americas  57.51332  0.32972168
## 136            Vietnam      Asia  39.01008  0.67161538
## 137 West Bank and Gaza      Asia  43.79840  0.60110070
## 138        Yemen, Rep.      Asia  30.13028  0.60545944
## 139             Zambia    Africa  47.65803 -0.06042517
## 140           Zimbabwe    Africa  55.22124 -0.09302098
```
