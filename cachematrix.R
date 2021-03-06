## This module is used to compute the inverse of a matrix
## If the inverse has not been calculated already, it is
## created. If it has been calculated, it is cached for later
## use.

## This function has functions to set & get the matrix and
## also functions to set and get the mean of the matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    
    get <- function() x
    
    setInverse <- function(inv) i<<-inv
    
    getInverse <- function() i
    
    list(set=set, get=get,
        setInverse = setInverse,
        getInverse = getInverse)
}


## This function is used to return the inverse of a matrix. It
## is returned from cache if it exists, otherwise, it is 
## computed.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getInverse()
        
        if(!is.null(i)) {
            message("getting cached data")
            return(i)
        }
        
        data <- x$get()
        
        i <- solve(data, ...)
        
        x$setInverse(i)
        
        i
}
