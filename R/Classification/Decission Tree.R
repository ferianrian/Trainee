# Decision Tree Classification
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

# Fitting Decision Tree Classification to the Training set
# install.packages('rpart')
library(rpart)
classifier = rpart(formula = Species ~ .,
                   data = training_set)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-5], type = 'class')

# Making the Confusion Matrix
cm = table(test_set[, 5], y_pred)
cm

# Confusion Matrix
library(caret)
confusionMatrix(as.factor(y_pred), test_set$Species)