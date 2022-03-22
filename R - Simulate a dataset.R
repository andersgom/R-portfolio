# Dataset simulation


n <- 200
catvar <- c("item1", "item2", "item3")
boovar <- c(0,1)

col1 <- sample(catvar, size=10, replace=TRUE)
col2 <- sample(20, n, replace=TRUE)
col3 <- rnorm(n, mean = 0, sd = 1)
col4 <- sample(boovar, size=10, replace=TRUE)

data <- cbind(col1, col2, col3, col4)