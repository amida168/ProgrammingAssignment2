## There are two functions in this file: makeCacheMatrix, cacheSolve
## makeCacheMatrix prepares a regular matrix to be used by cacheSolve. 
## cacheSolve check the input and see if cached solution exist. If so, the 
## cached solution is used, otherwise, it solves the matrix and store the 
## solution in the cache.
## Look for a script called test.R in the repo, if you want to verify the 
## script

## Return a list based upon the input matrix x to be used by cacheSolve()

makeCacheMatrix <- function(x = matrix()) {
    ## initialize the internal variable inv which holds the inverse
    inv <- NULL
    ## set the value of the matrix and initialize the inverse 
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    ## get the value of the matrix 
    get <- function() x
    ## set the value of the inverse
    setinverse <- function(inverse) inv <<- inverse
    ## get the value of the inverse
    getinverse <- function() inv
    ## return a list with the functions.
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## Solve a matrix in a list prepared by makeCacheMatrix

cacheSolve <- function(x, ...) {
    ## get the inverse of the matrix in list x
    inv  <- x$getinverse()
    ## if the cached inverse exists, use it. 
    if(!is.null(inv)) {
        message("getting cached data")
        ## return the cached copy of the inverse
        return(inv)
    }
    ## cached copy does not exist, calculate the inverse and store it.
    data  <- x$get()
    inv  <- solve(data, ...)
    x$setinverse(inv)
    ## return the calculated inverse
    inv
}
