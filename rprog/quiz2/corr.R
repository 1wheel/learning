corr <- function(directory, threshold = 0) {
  files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
  cr <- vector(mode='numeric')
  
  for (i in 1:length(files_list)){
    obs <- read.csv(files_list[i])
    obs <- na.omit(obs)
    if (sum(complete.cases(obs)) >= threshold){
      cr <- c(cr, cor(x = obs$nitrate, y = obs$sulfate))
    }
  }
  
  cr
}