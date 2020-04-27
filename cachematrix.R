## Put comments here that give an overall description of what your
## functions do

## This helps to create an R object that store the inverse of matrix .
##this makecachematrix contain a various list of function stored on parent environment.

makeCacheMatrix <- function(x = matrix()) {
        ## define the argument with default mode of "matrix"
m<-NULL
## initialize m as NULL; will hold value of matrix inverse
set<-function(y){
        x<<-y 
        ## value of matrix in parent environment
        m<<-NULL 
        ## if there is a new matrix, reset m to NULL
}
get<-function()x
## define the get fucntion - returns value of the matrix argument
setinverse<-function(inverse)m<<-inverse
## assigns value of m in parent environment
getinverse<-function()m
## gets the value of m where called
list(set=set,get=get,
     setinverse=setinverse,getinverse=getinverse)
}##you need this in order to refer to the functions with the $ operator


## Write a short comment describing this function
##cache solve is the only place where make cache matrix can be executed.
##makecachematrix is incomplete without below function 
cacheSolve <- function(x, ...) {
        m<-x$getinverse()
        if(!is.null(m)){
                message("getting cache data")
                return(m)
        }
        data<-x$get()
        m<-solve(data,...)
        x$setinverse(m)
        m
}

