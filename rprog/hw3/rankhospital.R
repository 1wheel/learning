rankhospital <- function(state, outcome, num) {
  stuff <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
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
  
  dat <- data.frame(val=numeric(0), name=character(0), stringsAsFactors=FALSE)
  for (i in 1:nrow(stuff)) {
    hos_row <- stuff[i,]
    val <- as.numeric(hos_row[[outcome_col]])
    isState <- hos_row$State == state
    
    if (isState && !is.na(val)) {
      dat[nrow(dat) + 1, ] <- c(val, as.character(hos_row$Hospital.Name))
    }
    
  }
  
  if (nrow(dat)==0) {
    stop("invalid state")
  }
  
  dat[, 1] <- as.numeric(dat[, 1])
  dat <- dat[with(dat, order(val, name)), ]
  if (num == "best") {
    return(dat[1, ]$name)
  }
  else if (num == "worst") {
    return(dat[nrow(dat), ]$name)
  }
  else {
    return (dat[num, ]$name)
  }
  
}
