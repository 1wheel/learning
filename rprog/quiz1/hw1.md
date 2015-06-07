# hw1
Adam Pearce  


Load data from file

```r
dat = read.csv("hw1_data.csv", header = TRUE)
```

Look at first two and last two rows with `head` and `tail`

```r
head(dat, 2)
```

```
##   Ozone Solar.R Wind Temp Month Day
## 1    41     190  7.4   67     5   1
## 2    36     118  8.0   72     5   2
```

```r
tail(dat, 2)
```

```
##     Ozone Solar.R Wind Temp Month Day
## 152    18     131  8.0   76     9  29
## 153    20     223 11.5   68     9  30
```

Find number of NAs and mean with `summary`

```r
summary(dat)
```

```
##      Ozone           Solar.R           Wind             Temp      
##  Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00  
##  1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00  
##  Median : 31.50   Median :205.0   Median : 9.700   Median :79.00  
##  Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88  
##  3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00  
##  Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00  
##  NA's   :37       NA's   :7                                       
##      Month            Day      
##  Min.   :5.000   Min.   : 1.0  
##  1st Qu.:6.000   1st Qu.: 8.0  
##  Median :7.000   Median :16.0  
##  Mean   :6.993   Mean   :15.8  
##  3rd Qu.:8.000   3rd Qu.:23.0  
##  Max.   :9.000   Max.   :31.0  
## 
```

Load the dplyr package for easy filtering. Install with `install.packages("dplyr")`. [Cheatsheet](http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following object is masked from 'package:stats':
## 
##     filter
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

Filter to find observations where Ozone is greater than 37 and Temp greater than 90

```r
dat %>% filter(Ozone > 37) %>% filter(Temp > 90)
```

```
##    Ozone Solar.R Wind Temp Month Day
## 1     97     267  6.3   92     7   8
## 2     97     272  5.7   92     7   9
## 3     76     203  9.7   97     8  28
## 4    118     225  2.3   94     8  29
## 5     84     237  6.3   96     8  30
## 6     85     188  6.3   94     8  31
## 7     96     167  6.9   91     9   1
## 8     78     197  5.1   92     9   2
## 9     73     183  2.8   93     9   3
## 10    91     189  4.6   93     9   4
```

Find mean with summary

```r
dat %>% filter(Ozone > 37) %>% filter(Temp > 90) %>% summary
```

```
##      Ozone           Solar.R           Wind            Temp     
##  Min.   : 73.00   Min.   :167.0   Min.   :2.300   Min.   :91.0  
##  1st Qu.: 79.50   1st Qu.:188.2   1st Qu.:4.725   1st Qu.:92.0  
##  Median : 88.00   Median :200.0   Median :6.000   Median :93.0  
##  Mean   : 89.50   Mean   :212.8   Mean   :5.600   Mean   :93.4  
##  3rd Qu.: 96.75   3rd Qu.:234.0   3rd Qu.:6.300   3rd Qu.:94.0  
##  Max.   :118.00   Max.   :272.0   Max.   :9.700   Max.   :97.0  
##      Month          Day       
##  Min.   :7.0   Min.   : 1.00  
##  1st Qu.:8.0   1st Qu.: 3.25  
##  Median :8.0   Median : 8.50  
##  Mean   :8.2   Mean   :14.50  
##  3rd Qu.:9.0   3rd Qu.:28.75  
##  Max.   :9.0   Max.   :31.00
```

Mean of temp when Month is 6

```r
dat %>% filter(Month == 6) %>% summary
```

```
##      Ozone          Solar.R           Wind            Temp      
##  Min.   :12.00   Min.   : 31.0   Min.   : 1.70   Min.   :65.00  
##  1st Qu.:20.00   1st Qu.:127.0   1st Qu.: 8.00   1st Qu.:76.00  
##  Median :23.00   Median :188.5   Median : 9.70   Median :78.00  
##  Mean   :29.44   Mean   :190.2   Mean   :10.27   Mean   :79.10  
##  3rd Qu.:37.00   3rd Qu.:270.8   3rd Qu.:11.50   3rd Qu.:82.75  
##  Max.   :71.00   Max.   :332.0   Max.   :20.70   Max.   :93.00  
##  NA's   :21                                                     
##      Month        Day       
##  Min.   :6   Min.   : 1.00  
##  1st Qu.:6   1st Qu.: 8.25  
##  Median :6   Median :15.50  
##  Mean   :6   Mean   :15.50  
##  3rd Qu.:6   3rd Qu.:22.75  
##  Max.   :6   Max.   :30.00  
## 
```

Max Ozone when Month is 5

```r
dat %>% filter(Month == 5) %>% summary
```

```
##      Ozone           Solar.R           Wind            Temp      
##  Min.   :  1.00   Min.   :  8.0   Min.   : 5.70   Min.   :56.00  
##  1st Qu.: 11.00   1st Qu.: 72.0   1st Qu.: 8.90   1st Qu.:60.00  
##  Median : 18.00   Median :194.0   Median :11.50   Median :66.00  
##  Mean   : 23.62   Mean   :181.3   Mean   :11.62   Mean   :65.55  
##  3rd Qu.: 31.50   3rd Qu.:284.5   3rd Qu.:14.05   3rd Qu.:69.00  
##  Max.   :115.00   Max.   :334.0   Max.   :20.10   Max.   :81.00  
##  NA's   :5        NA's   :4                                      
##      Month        Day      
##  Min.   :5   Min.   : 1.0  
##  1st Qu.:5   1st Qu.: 8.5  
##  Median :5   Median :16.0  
##  Mean   :5   Mean   :16.0  
##  3rd Qu.:5   3rd Qu.:23.5  
##  Max.   :5   Max.   :31.0  
## 
```
