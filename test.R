# Test your code
source("cachematrix.R")
#
# generate matrix, and the inverse of the matrix.
size <- 2000 # size of the matrix edge, don't make this too big
mymatrix <- matrix(rnorm(size^2), nrow=size, ncol=size)
mymatrix.inverse <- solve(mymatrix)
#
# now solve the matrix via the cache-method
#
special.matrix   <- makeCacheMatrix(mymatrix)
#
# this should take long, since it's the first go
print("Solving the matrix for the first time.")
time1  <- Sys.time()
special.solved.1 <- cacheSolve(special.matrix)
time2  <- Sys.time()
print(time2 - time1)
#
# this should be lightning fast
print("Solving the matrix for the second time.")
time1  <- Sys.time()
special.solved.2 <- cacheSolve(special.matrix)
time2  <- Sys.time()
print(time2 - time1)
#
# check if all solved matrices are identical
print(identical(mymatrix.inverse, special.solved.1))
print(identical(mymatrix.inverse, special.solved.2))
#
# should return TRUE