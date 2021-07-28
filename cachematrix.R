## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#main thing is that you can read/write variables  x <<- y
## in parent/top  environment
## if they ( variables in parent environment) are defined
## you returning values by "GET" functions, otherwise you are make "SET"

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
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
        i <- x$getinverse()
        if (!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
##> b <- matrix(sample(-100:100,16,replace=TRUE),4,4)
##> b
##[,1] [,2] [,3] [,4]
##[1,]  -42  -24   15   76
##[2,]   54  -33  -93   10
##[3,]  -80    8  -71   29
##[4,]   58   76   98   41
##> bc <- makeCacheMatrix(b)
##> cacheSolve(bc)
##[,1]          [,2]         [,3]          [,4]
##[1,] -0.0008584801  0.0070729923 -0.004873085  0.0033130251
##[2,] -0.0090023340 -0.0003691038  0.010999837  0.0089969060
##[3,]  0.0036760224 -0.0059801406 -0.006510594 -0.0007504652
##[4,]  0.0091150985  0.0049724907  0.002065598  0.0048201286
##>