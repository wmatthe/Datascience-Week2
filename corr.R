corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        files <- list.files(directory)
        filepaths <- paste(directory, "/", files, sep="")
        fileset <- c(1:length(files))
        okset <- fileset[complete(directory, fileset)[,2] > threshold]
        result <- c()
        for (i in okset) {
                data <- read.csv(filepaths[i])
                data2 <- !is.na(data)
                data3 <- data[data2[,1]&data2[,2]&data2[,3]&data2[,4],]
                result <- cbind(result,cor(data3[,2], data3[,3]))
        }
        as.vector(result)
}