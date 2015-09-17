# 36-350 Lab 2: September 5, 2014

Things That Go Vroom
===

Today's agenda: Manipulating data frames; practicing iteration; practicing re-writing code; checking
  how reliable random methods are.


Part I -- Data Frames
======

R includes a number of pre-specified data objects as part of its default installation. We will load and manipulate one of these, a data frame of 93 cars with model year 1993. Begin by ensuring that you can load this data with the commands


```r
library(MASS)
data(Cars93)
```

Begin by examining the data frame with the command `View(Cars93)` to understand the underlying object. You will need to use functions and other commands to extract elements for this assignment.

1. Obtain a `summary()` of the full data structure. Can you tell from this how many rows are in the data? If so, say how; if not, use another method to obtain the number of rows.


```r
summary(Cars93)
```

```
##     Manufacturer     Model         Type      Min.Price         Price      
##  Chevrolet: 8    100    : 1   Compact:16   Min.   : 6.70   Min.   : 7.40  
##  Ford     : 8    190E   : 1   Large  :11   1st Qu.:10.80   1st Qu.:12.20  
##  Dodge    : 6    240    : 1   Midsize:22   Median :14.70   Median :17.70  
##  Mazda    : 5    300E   : 1   Small  :21   Mean   :17.13   Mean   :19.51  
##  Pontiac  : 5    323    : 1   Sporty :14   3rd Qu.:20.30   3rd Qu.:23.30  
##  Buick    : 4    535i   : 1   Van    : 9   Max.   :45.40   Max.   :61.90  
##  (Other)  :57    (Other):87                                               
##    Max.Price       MPG.city      MPG.highway                  AirBags  
##  Min.   : 7.9   Min.   :15.00   Min.   :20.00   Driver & Passenger:16  
##  1st Qu.:14.7   1st Qu.:18.00   1st Qu.:26.00   Driver only       :43  
##  Median :19.6   Median :21.00   Median :28.00   None              :34  
##  Mean   :21.9   Mean   :22.37   Mean   :29.09                          
##  3rd Qu.:25.3   3rd Qu.:25.00   3rd Qu.:31.00                          
##  Max.   :80.0   Max.   :46.00   Max.   :50.00                          
##                                                                        
##  DriveTrain  Cylinders    EngineSize      Horsepower         RPM      
##  4WD  :10   3     : 3   Min.   :1.000   Min.   : 55.0   Min.   :3800  
##  Front:67   4     :49   1st Qu.:1.800   1st Qu.:103.0   1st Qu.:4800  
##  Rear :16   5     : 2   Median :2.400   Median :140.0   Median :5200  
##             6     :31   Mean   :2.668   Mean   :143.8   Mean   :5281  
##             8     : 7   3rd Qu.:3.300   3rd Qu.:170.0   3rd Qu.:5750  
##             rotary: 1   Max.   :5.700   Max.   :300.0   Max.   :6500  
##                                                                       
##   Rev.per.mile  Man.trans.avail Fuel.tank.capacity   Passengers   
##  Min.   :1320   No :32          Min.   : 9.20      Min.   :2.000  
##  1st Qu.:1985   Yes:61          1st Qu.:14.50      1st Qu.:4.000  
##  Median :2340                   Median :16.40      Median :5.000  
##  Mean   :2332                   Mean   :16.66      Mean   :5.086  
##  3rd Qu.:2565                   3rd Qu.:18.80      3rd Qu.:6.000  
##  Max.   :3755                   Max.   :27.00      Max.   :8.000  
##                                                                   
##      Length        Wheelbase         Width        Turn.circle   
##  Min.   :141.0   Min.   : 90.0   Min.   :60.00   Min.   :32.00  
##  1st Qu.:174.0   1st Qu.: 98.0   1st Qu.:67.00   1st Qu.:37.00  
##  Median :183.0   Median :103.0   Median :69.00   Median :39.00  
##  Mean   :183.2   Mean   :103.9   Mean   :69.38   Mean   :38.96  
##  3rd Qu.:192.0   3rd Qu.:110.0   3rd Qu.:72.00   3rd Qu.:41.00  
##  Max.   :219.0   Max.   :119.0   Max.   :78.00   Max.   :45.00  
##                                                                 
##  Rear.seat.room   Luggage.room       Weight         Origin  
##  Min.   :19.00   Min.   : 6.00   Min.   :1695   USA    :48  
##  1st Qu.:26.00   1st Qu.:12.00   1st Qu.:2620   non-USA:45  
##  Median :27.50   Median :14.00   Median :3040               
##  Mean   :27.83   Mean   :13.89   Mean   :3073               
##  3rd Qu.:30.00   3rd Qu.:15.00   3rd Qu.:3525               
##  Max.   :36.00   Max.   :22.00   Max.   :4105               
##  NA's   :2       NA's   :11                                 
##             Make   
##  Acura Integra: 1  
##  Acura Legend : 1  
##  Audi 100     : 1  
##  Audi 90      : 1  
##  BMW 535i     : 1  
##  Buick Century: 1  
##  (Other)      :87
```

```r
nrow(Cars93)
```

```
## [1] 93
```


```

2. What is the mean price of a car with a rear-wheel drive train?

```r
mean(Cars93[Cars93$DriveTrain == 'Rear',"Price"])
```

```
## [1] 28.95
```

3. What is the minimum horsepower of all cars with capacity for 7 passengers? With a capacity of at least 6 passengers?

```r
min(Cars93[Cars93$Passengers > 6,"Horsepower"])
```

```
## [1] 109
```

```r
min(Cars93[Cars93$Passengers > 5,"Horsepower"])
```

```
## [1] 100
```


4. Assuming that these cars are exactly as fuel efficient as this table indicates, find the cars that have the maximum, minimum and median distance travellable for highway driving.  You will need at least two columns to work this out; why those two?

```r
max(Cars93$MPG.highway*Cars93$Fuel.tank.capacity)
```

```
## [1] 633
```

Part II -- Reproducibility and Functions
==========================================

Some of the lectures have included examples of planning production for a factory that turns steel and labor into cars and trucks.  Below is a piece of code that optimizes the factory's output (roughly) given the available resources, using a `repeat` loop.  It's embedded in a function to make it easier for you to run.


```r
factory.function <- function (cars.output=1, trucks.output=1) {
  factory <- matrix(c(40,1,60,3),nrow=2,
    dimnames=list(c("labor","steel"),c("cars","trucks")))
  available <- c(1600,70); names(available) <- rownames(factory)
  slack <- c(8,1); names(slack) <- rownames(factory)
  output <- c(cars.output, trucks.output); names(output) <- colnames(factory)

  passes <- 0 # How many times have we  been around the loop?
  repeat {
     passes <- passes + 1
     needed <- factory %*% output # What do we need for that output level?
     # If we're not using too much, and are within the slack, we're done
     if (all(needed <= available) &&
         all((available - needed) <= slack)) {
       break()
     }
     # If we're using too much of everything, cut back by 10%
     if (all(needed > available)) {
       output <- output * 0.9
       next()
     }
     # If we're using too little of everything, increase by 10%
     if (all(needed < available)) {
       output <- output * 1.1
       next()
     }
     # If we're using too much of some resources but not others, randomly
     # tweak the plan by up to 10%
      # runif == Random number, UNIFormly distributed, not "run if"
     output <- output * (1+runif(length(output),min=-0.1,max=0.1))
  }
  
  print(needed)
  output[3] = passes
  return(output)
}
```

5. Run the function above with the command


```r
factory.function()
```

```
##             [,1]
## labor 1597.43661
## steel   69.58005
```

```
##      cars    trucks           
##  10.29178  19.76275 263.00000
```

to obtain a default output value, starting from a very low initial planned output. What is the final output capacity obtained?

6. Repeat this four more times to obtain new output values. Do these answers differ from each other? If so why? If not, why not?

```r
factory.function()
```

```
##             [,1]
## labor 1595.18056
## steel   69.83904
```

```
##       cars     trucks            
##   9.919987  19.973018 359.000000
```

```r
factory.function()
```

```
##             [,1]
## labor 1595.50966
## steel   69.80069
```

```
##        cars      trucks             
##    9.974788   19.941969 1285.000000
```

```r
factory.function()
```

```
##            [,1]
## labor 1595.6482
## steel   69.7568
```

```
##      cars    trucks           
##  10.02562  19.91039 804.00000
```

```r
factory.function()
```

```
##             [,1]
## labor 1597.40489
## steel   69.87708
```

```
##        cars      trucks             
##    9.993168   19.961303 3592.000000
```
# yes - they are determined by a random walk that doesn't converage on a single exact anwser

7. Right now, the number of `passes` is a value held within the function itself and not shared. Change the code so that the number of `passes` will be returned at the end of the function, as well as the final `output`. 

8. Now, set the initial output levels to 30 cars and 20 trucks and run the code.  What is the final output plan (`output`)?  What is the final demand for resources (`needed`)?  Is the plan within budget and within the slack?  How many iterations did it take to converge (`passes`)? For all but `output` you will need to either print this message out deliberately, or return an object that contains all the quantities you want.


```r
factory.function(cars.output=30, trucks.output=20)
```

```
##             [,1]
## labor 1597.17719
## steel   69.75503
```

```
##      cars    trucks           
##  10.10383  19.88373 259.00000
```

# 1000+ iterations, seems to be within slack
