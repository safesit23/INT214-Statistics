# 01 Basic R
## Installation and Setting Up
- Install R from https://cran.rstudio.com/
- Download RStudio Desktop from https://rstudio.com/products/rstudio/download/#download

## Setup Directory
````
#Get Working Directory
getwd()
#Set Working Directory
setwd()
````
Alternative: setting by use menu Session > set working directory

## Basic Tools
```
#comment
1+1
# formula
2*100 - 5
# Print function
print("Hello")
```

## Basic Operation
```
# create variable
x <- 1
y <- 2
x+y
print(x + y)
z <- x+y
z
```

## Data Types
There are 3 types: numeric, logical, character
```
# class() to check data types
x1 = 100
class(x1)

x2 = "hello world"
class(x2)

x3 = FALSE # TRUE
class(x3)

```