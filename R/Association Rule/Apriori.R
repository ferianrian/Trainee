# Association Rule Apriori
# Load The dataset
library(arules)
library(arulesViz)
library(datasets)

data(Groceries)
dataset <-Groceries

# Create an item frequency plot for the top 20 items
itemFrequencyPlot(Groceries,topN=20,type="absolute")

# Training Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])