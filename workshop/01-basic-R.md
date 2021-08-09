# 01 Basic R
## Installation and Setting Up
- Install R from https://cran.rstudio.com/
- Download RStudio Desktop from https://rstudio.com/products/rstudio/download/#download

## Setup Directory
````
#Get Working Directory
getwd()
#Set Working Directory
setwd("path")
````
** Hints: use Terminal and using command `pwd` to print working directory

Try to create new file `touch test.txt` in working directory and list the files in R console
````
#List the Files in a Directory/Folder
dir()
````
Alternative Way: setting by use menu Session > set working directory

Default Setting: use menu Tools > global options

## Basic Tools
```
#comment
1+1
# formula
2*100 - 5
# Print function
print("Hello")
```

## Run Script
- `Command+Enter` Run the current line or selection
- `Command+option+R` Run all
- `Ctrl+L` Clear console

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
# Numeric
varA <- 100
class(varA)
# Logical: TRUE, FALSE
varB <- TRUE
class(varB)
class(1==2)

varC <- "Hello, My name is Safe"
class(varC)
```

## Notes
```
# Directory
getwd()
setwd()

# Help Function
?
help()

# check data types
class()
```
