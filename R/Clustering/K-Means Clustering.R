# K-means Clustering
# Load The dataset
data("iris")
dataset <- as.data.frame(iris)

dataset <- dataset[-5]

# Using the elbow method to find the optimal number of clusters
set.seed(123)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Fitting K-Means to the dataset
set.seed(123)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster

plot(y_kmeans)
