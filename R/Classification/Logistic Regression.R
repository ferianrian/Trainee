# Random Forest
# Load The dataset
data("Titanic")
dataset <- as.data.frame(Titanic)


library(dplyr)
#checking account
dataset$Survived <- recode_factor(dataset$Survived,
                                               "Yes"="1",
                                               "No"="0")
# Delete Freq col
dataset <- dataset[-5]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Survived, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Logistic Regression to the Training set
classifier = glm(formula = Survived ~ .,
                 family = binomial,
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, newdata = test_set[-4])
y_pred = ifelse(prob_pred > 0.6, 1, 0)

# Confusion Matrix
library(caret)
confusionMatrix(as.factor(y_pred), test_set$Survived)

