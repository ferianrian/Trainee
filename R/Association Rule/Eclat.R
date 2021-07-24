# Association Rule Eclat
# Load The dataset
library(arules)
library(arulesViz)
library(datasets)

data(Groceries)
dataset <-Groceries

# Create an item frequency plot for the top 20 items
itemFrequencyPlot(Groceries,topN=20,type="absolute")

# Training Eclat on the dataset
rules = eclat(data = dataset, parameter = list(support = 0.003, minlen = 2))

# Visualising the results
inspect(sort(rules, by = 'support')[1:10])