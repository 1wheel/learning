pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files_list <- list.files(directory, pattern="*.csv", full.names=TRUE)
  dat <- data.frame()
  
  #read all files into one data frame
  for (i in id){
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  dat_subset <- dat[[pollutant]]
  mean(dat_subset, na.rm = TRUE)
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}


pollutantmean("specdata", "sulfate", 1:10)