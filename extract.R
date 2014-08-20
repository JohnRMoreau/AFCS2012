## Command to extract data from a frame and rename it

## Future improvements
##    check that everything in name file is character data and not factors
##    Import the files from the disk
##    Check to see if any ref names are not in the file
##    Ask what the unique ID is, if any, and assign to the rownames
##    Vectorize the for statement, use sapply

extract <- function(datafile, namefile){
  extvect <- which(colnames(datafile) %in% namefile[,1])  ## Get a vector of columns to pull
  extdf <- datafile[,extvect]                             ## Extract the desired columns
  namelen <- nrow(namefile)                             ## #Cols in name file - don't assume all names are in data
  for (i in 1:namelen) {
    coln  <- match(namefile[i,1],colnames(extdf))        ##Doesn't assume same order, gets the col num for the data
    colnames(extdf)[coln] <- as.character(namefile[i,2])
  }
  extdf
}
decode <- function(datatbl, refvals){   
  refc <-   colnames(refvals)
  datac <-  colnames(datatbl)
  ##get a list of the columns in both tables
  goodc <- refc[which(refc %in% datac)]
  
  for(i in 1:length(goodc)){
    datatbl[,goodc[i]] <- refvals[as.character(datatbl[,goodc[i]]),goodc[i]]
  }
  invisible(datatbl)
}

