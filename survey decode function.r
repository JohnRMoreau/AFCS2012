surveydecode <- function(dataset,ref,dataset_key,ref_code) {
  # current version - 20140406
  # dataset -actual data set to be decoded
  # ref - decodes built from the data dictionary
  # dataset_key - the string name of the column containing the primary id or key
  # ref_code - column containing the numeric codes for response
  # you're on your own for the reference table
  # Assumes ref has the same column names as dataset for the columns to be decode.
  # It is not assumed that the two tables have all the same columns. 
  # The primary key or response ID should be in the first column of dataset.
  # Response value (1 for yes, 2 for no) should be in the first column of ref.
  library(sqldf)
  matchcol <- names(dataset)[which((names(dataset) %in% names(ref)))]
  innerfunction <- function(colnm, dataset,ref,ref_code) {
	sqldf(print(cat("'select ", ref,".",colnm, " AS ", colnm, "text from ", dataset, " left outer join ", ref, " on ", ref, ".", ref_code," = ", dataset,".", colnm,"'", sep="")))
	}	
  lapply(matchcol, innerfunction)
  
paste0 !!!

	
  }
  # 
 (cat("select ", ref,".",colnm, " AS ", colnm, "text from ", dataset, " left outer join ", ref, " on ", ref, ".", ref_code," = ", dataset,".", colnm, sep="")
  cat("select ", ref,".",colnm, " AS ", colnm, "text from ", ref, " right join ", dataset, " on ", ref, ".", ref_code," = ", dataset,".", colnm, sep="")
select afscref.Gender AS Gendertext from afscref right join AFCS on afscref.numcode = AFCS.Gender
 (cat("select ", ref,".",colnm, " AS ", colnm, "text from ", dataset, " left outer join ", ref, " on ", ref, ".", ref_code," = ", dataset,".", colnm, sep="")
sqldf("select afscref.Gender AS Gendertext from AFCS left outer join afscref on afscref.numcode = AFCS.Gender")

gendertest<- sqldf("select AFCS.Gender, afscref.Gender AS Gendertext from AFCS left outer join afscref on afscref.numcode = AFCS.Gender")
