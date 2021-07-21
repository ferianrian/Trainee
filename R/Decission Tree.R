# Decision Tree better for classifying
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

# Fitting Decision Tree Regression to the dataset
# install.packages('rpart')
library(rpart)
regressor = rpart(formula = Petal.Width ~ .,
                  data = training_set,
                  control = rpart.control(minsplit = 10))

# Predicting a new result with Decision Tree Regression
y_pred = predict(regressor, newdata=test_set)

plot(y_pred)
plot(test_set$Petal.Width)