# Get zip file from url, download zip file, creae directory specdata 
# in the working directory, & unzip files into new specdata directory. 

dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip")

pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        # obtain list of sensor files in specdata directory
                
                files <- list.files("specdata", full.names = TRUE)
        
        # create empty data frame
        
                collector <- data.frame()
        
       
        # loop through files in list and
        #    * read the csv file
        #    * bind to "collector" data frame
                for (i in id ) {
                        collector <- rbind(collector, read.csv(files[i]))
                }   
        
        # If statement to calculate mean based on the pollutant 
        # entered id entered and return results to parent environment
                
                if (pollutant == 'sulfate') {
                        mean(collector$sulfate, na.rm = TRUE)
                } else if (pollutant == 'nitrate') {
                        mean(collector$nitrate, na.rm = TRUE)
                }
                
}