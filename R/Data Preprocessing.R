# Load The dataset
data("iris")
dataset <- iris

# add one more row with Na
dataset[nrow(dataset)+1, ] = NA

# Auto Na for numeric only
# ncol - 1 because the lastest isn't numeric
for(col in 1:(ncol(dataset)-1)){
  for(row in 1:nrow(dataset)){
    if(is.na(dataset[row,col])){
      dataset[row,col] = mean(dataset[,col], na.rm = TRUE)
    }
  }
}

# One By One
dataset$Sepal.Length[is.na(dataset$Sepal.Length)] <- 
  mean(dataset$Sepal.Length, na.rm = TRUE)

# Character by modus
dataset$Species[is.na(dataset$Species)] <- 'setosa'
  
# For Spliting
library(caTools)
set.seed(123)
split = sample.split(dataset$Species, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)