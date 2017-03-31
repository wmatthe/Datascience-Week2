complete <- function(directory, id = 1: 332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the csv files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used.
        
        ## Return a data frame of the form: 
        ## id nobs
        ## 2 117
        ## 2 1041
        ## ...
        ## where 'id' is the monitor id and 'nobs' is the
        ## number of complete cases
        
        # obtain list of sensor files in specdata directory
        
        # files <- list.files("specdata", full.names = TRUE)
        files <- list.files(path = directory, full.names = TRUE)
        
        collector <- data.frame()
        completeCases <- data.frame()
        nobs <- data.frame()
        
        for (i in id) {
                collector <- (read.csv(files[i], header = TRUE))
                nobs <- sum(complete.cases(collector))
                completeCases <- rbind(completeCases, data.frame(i,nobs))
        }
        
        completeCases
}