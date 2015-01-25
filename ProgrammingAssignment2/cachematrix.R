## Put comments here that give an overall description of what your
## functions do

## This Function makes a list of Matrix
## and Cache their inverse
## 	

makeCacheMatrix <- function(x = matrix()) {
    	m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## this function calculates the inverse of the matrix created with the above function
## it first checks to see if the inverse has already been calculated

cacheSolve <- function(x, ...) {
		
	  m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
