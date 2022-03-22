# Dataset simulation

# Make sure to use 'set.seed()' to get a reproducible dataset.

n <- 200                                       # Dataset size
catvar <- c("item1", "item2", "item3")         # Define categories
boovar <- c(0,1)

col1 <- sample(catvar, size=10, replace=TRUE)  # Categorical column
col2 <- sample(20, n, replace=TRUE)            # Integer column (From 0 to 20)
col3 <- rnorm(n, mean = 0, sd = 1)             # Normal distribution
col4 <- sample(boovar, size=10, replace=TRUE)  # Boolean column

data <- cbind(col1, col2, col3, col4)