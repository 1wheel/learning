outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

best <-  function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (outcome == "heart attack") {
    outcome_col <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  }
  else if (outcome == "heart failure") {
    outcome_col <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  }
  
  else if (outcome == "pneumonia") {
    outcome_col <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
  
  else {
    stop("invalid outcome")
  }
  
  max <- 99999999
  bestHosRate <- max
  bestHosName <- "zzz"
  
  for (i in 1:nrow(data)) {
    hos_row <- data[i,]
    rate <- as.numeric(hos_row[[outcome_col]])
    isState <- hos_row$State == state
    
    isBestRate <- rate < bestHosRate
    isTieWinner <- rate == bestHosRate && hos_row$Hospital.Name < bestHosName
    
    if (isState && !is.na(rate) && (isBestRate || isTieWinner)) {
      bestHosName <- hos_row$Hospital.Name
      bestHosRate <- rate
    }
    
  }
  
  if (max == bestHosRate) {
    stop("invalid state")
  }
  
  bestHosName
}
