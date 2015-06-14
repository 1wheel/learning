corr <- function(directory, threshold = 0) {
  files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
  cr <- vector(mode='numeric')
  
  for (i in 1:length(files_list)){
    print(files_list[i])
    obs <- read.csv(files_list[i])
    print (sum(complete.cases(obs)))
    if (sum(complete.cases(obs))[1] >= threshold){
      print(corr(obs$nitrate, obs$sulfate))
      cr <- c(cr, i)##corr(obs$nitrate, obs$sulfate))
    }
  }
  
  cr
}
corr("specdata", 150)


c2 <- function(directory, id = 1:332) {
  files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
  dat <- data.frame()
  
  dat <- data.frame()
  
  for (file in files_list){
    obs <- read.csv(file)
    print (sum(complete.cases(obs)))
    if (sum(complete.cases(obs))[1] >= 0){
      dat <- rbind(dat, corr(obs$nitrate, obs$sulfate))
    }
  }
  
  dat
}
c2("specdata", c(2, 4, 8, 10, 12))



complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
  dat <- data.frame()
  
  for (i in id){
    nobs <- sum(complete.cases(read.csv(files_list[i]))) 
    dat <- rbind(dat, c(i, nobs)) 
  }
  
  colnames(dat) <- c('id', 'nobs')
  
  dat
}
complete("specdata", c(2, 4, 8, 10, 12))
