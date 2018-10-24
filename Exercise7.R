#Setting working directory
rm(list=ls()) #remove global environment
setwd("/Users/Ashley/Documents/Biocomputing_2018/Biocomp-Fall2018-181012-Exercise7")

iris=read.csv("iris.csv", header = TRUE)
iris

#1
#Return odd rows of a data frame
i=1
return_odd_rows = function(df) {
  odds = data.frame()
  for (i in 1:nrow(df)) {
     if (i%%2==1) {
       oddRow=df[i,]
       odds=rbind(odds,oddRow)
     }
  }
  return(odds)
}


#2
#Return the number of observations for a given species included in the data set
species_num = function(species) {
  
  num_rows = 0
  for (i in 1:nrow(iris)) {
    if (iris$Species[i] == species) {
      num_rows = num_rows + 1
    }
  }
  return (num_rows)
}

#Return a dataframe for flowers with Sepal.Width greater than a value specified by the function user
sepal_width_flowers = function(num) {
  width_df = data.frame()
  for (i in 1:nrow(iris)) {
    if (iris$Sepal.Width[i] > num) {
      flower_row = iris[i,]
      width_df = rbind(width_df, flower_row)
    }
  }
  return(width_df)
}

#Write the data for a given species to a comma-delimited file with the given species name as the file name. Hint: look at paste() to add the .csv extension to your file in the function.

write_species_file = function(species) {
  species_data = data.frame()
  for (i in 1:nrow(iris)) {
    if (iris$Species[i] == species) {
      species_row = iris[i,]
      species_data = rbind(species_data, species_row)
    }
  }
  write.csv(species_data, file = paste(species, ".csv", sep = ""))
}

