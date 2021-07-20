# Load The dataset
data("iris")
dataset <- iris

# We only need the numeric data
# Asume Petal Width was the Y and the other is X
# Remove Species
dataset <- dataset[-5]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Petal.Width, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Petal.Width ~ .,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# MSE (Mean Squared Error)
sum((test_set$Petal.Width - y_pred)^2)
# MAPE (Mean Absolute precentage error)
sum(abs(test_set$Petal.Width - y_pred))
