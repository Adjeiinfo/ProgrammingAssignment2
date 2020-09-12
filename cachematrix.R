## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#set the environment variables to cache the inverse 
#get will return the matrix 
#setinv is the function that calculate the inverse 
#getinv return the inverse 
#the list of function will be used in the calling function 
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    setinv <- function(solve) m <<- solve
    getinv <- function() m
    
    list(set = set, get = get,
         setinv = setinv, 
         getinv = getinv)

}


## Write a short comment describing this function
#First look in parent environment for the inverse
#Return it if it is available 
#Calculate the it if not available and set the value in cache 
cacheSolve <- function(x,...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m))
    {
        message("getting cached data")
        return(m)
    }
    message("No cache data, will calculate")
    data <- x$get()
    m <- solve(data)
    x$setinv(m)
    m
    
}


#example of how to run this 
#step1: create the matrix m 
#Step2:run the makeCacheMatrix and save the result in a variable 
#Step3: call the cacheSolve with the named variable as argument 

c=rbind(c(1, -1/4), c(-1/4, 1))  

mkmatrix <-makeCacheMatrix(c)


solve <-cacheSolve(mkmatrix)

solve
