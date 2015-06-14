complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
  dat <- data.frame()
  
  for (i in id){
    #dat <- rbind(dat, read.csv(files_list[i]))
    #dat <- rbind(dat, id)
    nobs <- sum(complete.cases(read.csv(files_list[i]))) 
    dat <- rbind(dat, c(id, nobs)) 
  }
  colnames(dat) <- c('id', 'nobs')
  
  
  dat
}
complete("specdata", 1)
