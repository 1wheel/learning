makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inverseSetVal) inverse <<- inverseSetVal
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheinverse <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("inverse cached")
  } else{
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)    
  }
  inverse
}


B = matrix( c(2, 4, 3, 1), nrow=2, ncol=2) 
cm = makeCacheMatrix(B)
c = cacheinverse(cm)