## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#main thing is that you can read/write variables  x <<- y
## in parent/top  environment
## if they ( variables in parent environment) are defined
## you returning values by "GET" functions, otherwise you are make "SET"

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(set_x) {
                x <<- set_x
                inv <<- NULL
        }
        get <- function() get_x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function
## make some 8X8 matrix by
## sample(-1000:10000, 64, replace=TRUE)
## if i is not null you will get inversed matrix form cache
## else - inversed matrix will be created and saved in a parent environment - aka cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv_m <- x$getinverse()
        if (!is.null(inv_m)) {
                message("getting cached data")
                return(inv_m)
        }
        data <- x$get()
        inv_m <- solve(data, ...)
        x$setinverse(i)
        inv_m
        
}
