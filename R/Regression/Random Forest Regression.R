# Random Forest
# Load The dataset
data("iris")
dataset <- iris

# We only need the numeric data
# Asume Petal Width was the Y and the other is X
# Remove Species
dataset <- dataset[-5]

# Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Petal.Width, SplitRatio = 1/5)
training_set = subset(dataset, split == FALSE)
test_set = subset(dataset, split == TRUE)

# Fitting Random Forest Regression to the dataset
# install.packages('randomForest')
library(randomForest)
set.seed(123)
regressor = randomForest(x = training_set[-4],
                         y = training_set$Petal.Width,
                         ntree = 500)

# Predicting a new result with Random Forest Regresor
y_pred = predict(regressor, newdata=test_set)

plot(y_pred)
plot(test_set$Petal.Width)