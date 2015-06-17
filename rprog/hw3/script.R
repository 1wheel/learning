best <- function(state, outcome){
  ##read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if (outcome == 'heart attack'){
    field <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
  } else if (outcome == 'heart failure'){
    field <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure'
  } else if (outcome == 'pneumona'){
    field <- 'Hospital.30.Day.Death..Mortality..Rates.from.pneumona'
  }
  
  for (i in 1:nrow(outcome)){
    hos <- outcome[i]
    isState <- hos$State == state
    
  }
  
  ##return hospital name in that state with lowest 30-day death rate
  
}