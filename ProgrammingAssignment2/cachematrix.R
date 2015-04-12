
## This Function makes a list of Matrices
## and Cache their inverse
## It uses anonymous functions (getinverse, setinverse)
## and defines the functions get, set	

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
## if so it tries to get it, otherwise it calculates it and sets the inverse of the 
## matrices inside the list.

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
