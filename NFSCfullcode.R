#Full code for NFSC (state version)

#extract function
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
#Call the data
NFCS2012 <- read.csv(file = "NFCS 2012 State Data 130503.csv")
NFCSnames <- read.csv(file = "NFCS12Names.csv")
extracted <- extract(NFCS2012,NFCSnames)
reftbl<-read.csv("NFCSStateref.csv")
decoded <- decode(extracted,reftbl)
