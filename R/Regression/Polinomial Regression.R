# Polynomial in common only have 1 variable x
# Polynomial U curve dataset
# Load The dataset
data("iris")
dataset <- iris

# We only take Sepal Length and Sepal Width
dataset <- dataset[c(-5,-3,-2)]

dataset$Sepal.Length2 <- (dataset$Sepal.Length)^2
dataset$Sepal.Length3 <- (dataset$Sepal.Length)^3


# Split the dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Sepal.Length, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Polinomial Regression to the Training set
regressor = lm(formula = Petal.Width ~ ., data = training_set)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Plot
library(ggplot2)
x_grid = seq(min(dataset$Sepal.Width), max(dataset$Sepal.Width), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Sepal.Width, y = dataset$Petal.Length),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor,
                                        newdata = data.frame(Petal.Length = x_grid,
                                                             Petal.Length2 = x_grid^2,
                                                             Petal.Length3 = x_grid^3))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Sepal.Width') +
  ylab('Petal.Length')

# MSE (Mean Squared Error)
sum((test_set$Sepal.Width - y_pred)^2)
# MAPE (Mean Absolute precentage error)
sum(abs(test_set$Sepal.Width - y_pred))


