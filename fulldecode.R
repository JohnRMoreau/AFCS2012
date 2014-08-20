
### main function
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

## needs to be datatbl[,colname] <- refvals[as.character(datatbl[,colname]),colname]