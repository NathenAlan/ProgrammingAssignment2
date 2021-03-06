## Cache the Inverse of a Matrix:

## Matrix inversion is usually a costly computation and there may be some benefit 
## to caching the inverse of a matrix rather than computing it repeatedly.
## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setMatrix<-function(solve) m<<- solve
  getMatrix<-function() m
  list(set=set, get=get,
       setMatrix=setMatrix,
       getMatrix=getMatrix)
}


## Computes the inverse of the special "matrix" created by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then it should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  
  m<-x$getMatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setMatrix(m)
  m
}
