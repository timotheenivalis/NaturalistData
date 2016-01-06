setwd("C:/Users/Timothée/Documents/Naturalisme/observations")
allobs<-read.table(file = "AllObs.txt",header=T)

write.csv(allobs,file = "AllObs.csv")

latin<-allobs$Nom.latin

# function to extract species vector
Fspecies<-function(latin) #takes a list of scientific names
{
  alllist<-unique(latin)
  return(unique(sapply(X = alllist,FUN = function(x) paste(strsplit(x=as.character(x), split=" ")[[1]][1:2],collapse = " "))))
}



# function to create a df of taxa with their matching species
FTaxaSpecies<-function(latin) #takes a list of scientific names
{
  alllist<-unique(latin)
  species<-sapply(X = alllist,FUN = function(x) paste(strsplit(x=as.character(x), split=" ")[[1]][1:2],collapse = " "))
  taxlevels<-c("Genus","Species","SubSpecies","Hybrid","Hybrid")
  taxresults<-taxlevels[sapply(X = alllist,FUN = function(x) length(strsplit(x=as.character(x), split=" ")[[1]]))]
  TaxaSpecies<-data.frame(Taxon=alllist,Species=species,TaxonomicLevel=taxresults)
  return(TaxaSpecies)
}

FTaxaSpecies(latin)

??coordinates
