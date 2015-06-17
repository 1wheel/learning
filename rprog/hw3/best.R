best <- function(state, outcomeType){
  ##read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if (outcomeType == 'heart attack'){
    field <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
  } else if (outcomeType == 'heart failure'){
    field <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure'
  } else if (outcomeType == 'pneumona'){
    field <- 'Hospital.30.Day.Death..Mortality..Rates.from.Pneumona'
  } else{
    stop('invalid outcome')
  }
  
  max <- 99999999999
  bestHosName = 'zzzzzz'
  bestHosRate = 99999999999
  
  for (i in 1:nrow(outcome)){
    hos <- outcome[i,]
    val <- as.numeric(hos[[field]])
    isState <- hos$State == state
    
    isBestRate <- val < bestHosRate
    isTieWinner <- val == bestHosRate && hos$Hospital.Name < bestHosName
    
    if (isState && !is.na(val) && (isBestRate || isTieWinner)){
      bestHosName = hos$Hospital.Name  
      bestHosRate = val
    }
  }

  #throw error if invalid state
  if (max == bestHosRate){
    stop('invalid state')
  }
  
  ##return hospital name in that state with lowest 30-day death rate
  bestHosName
}