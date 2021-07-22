# KNN (Need all become numeric)
# Load The dataset
data("iris")
dataset <- as.data.frame(iris)

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Species, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -5],
             test = test_set[, -5],
             cl = training_set[, 5],
             k = 3,
             prob = TRUE)

# Making the Confusion Matrix
cm = table(test_set[, 5], y_pred)