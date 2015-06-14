corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  print(directory)
  files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
  dat <- data.frame()
  
  for (file in files_list){
    obs <- read.csv(file)
    if (sum(complete.cases(obs)) >= threshold){
      dat <- rbind(dat, corr(obs$nitrate, obs$sulfate))
    }
  }
  
  dat
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}
corr("specdata", 150)
