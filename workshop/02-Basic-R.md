# 02 Basic R + Statistics

## Agenda

- Review Basic Operation
- Data Types & Data Structures
- Statistics

## 0. Prerequisites

1. Open R Studio Desktop
2. Setting working directory (See in [01-Intro-R](01-intro-R.md))
3. Create Script file name `02_63130500xxx.R` and save in your working directory
4. Open progress form [Class 02](https://forms.gle/syVRfduXskPQXLUs5) and checked on Study Check-In and 0 prerequisite

## 1. Review Basic Operation

```
# create variable
x <- 1
y <- 2
x+y
print(x + y)
z <- x+y
z
```

## 2. Data Types

There are 3 types:

- Numeric: Any number with or without a decimal point. Example - 12.3, 5, 999
- Logical: Two possible values — either `TRUE` or `FALSE`
- Character: Any grouping of characters on your keyboard (letters, numbers, spaces, symbols, etc.) or text.Example - "Hello World"

```
# Numeric ex 1, 1.0
varA <- 100
class(varA)

# Logical: TRUE, FALSE
varB <- TRUE
class(varB)
class(1==2)

# Character
varC <- "Hello, My name is Safe"
class(varC)
```

## Data Structure

Main data structure that we will learn in this course are Vector, List, Data Frame

## 3. Vector

Vector is the simple data structure which is a single entity consisting of an ordered collection of values. We use `c()` function which means to concatenate the elements into a vector.

### 3.1.1. Create Vector

```
# Character Vectors
c("Ant","Bird","Cat")

# Logical Vectors
c(TRUE,FALSE,TRUE)

# Numeric Vectors
c(100,245,305,411,555)
```

- Use `class()` to see class or type of an object
- Use `length()` to get the length of vectors
- Moreover you can get elements at position x by using `variable[x]` which position is starting with 1

### 3.1.2. Operation with Vector

```
# Create Variable name
v1 <- c(1,2,3,4,5)
v2 <- c(6,7,8,9,10)

# Random
v3 <- rep(c(1,2,3),5)

# Creating integer sequences
v4 <- c(1:100)
```

You can use `+ - * /` with vector

```
v1+v2
```

## 4. Lists

An ordered collection of objects (components). A list allows you to gather a variety of (possibly unrelated) objects under one name.

```
# Initial
name <- c("Antony,Boky,Caty")
age <-c(10,25,30)
club <-c("Sec A","Sec B","Sec A")
retired <- c(T,F,T)

# Create list
myList <- list(name,age,club,retired)
# Or assign name
myList <- list(stdName = name,
               stdAge = age,
               stdClub = club,
               retired = retired)
```

## 5. Data Frame

Data frames are tabular data objects. The first column can be numeric while the second column can be character and third column can be logical. It is a list of vectors of equal length.

Data Frames are created using the `data.frame()` function.

```
continent <- c("Africa","Asia","Europe","North America","Oceania","South America","Antarctica")
countries <- c(54,48,51,23,14,12,0)
world <- data.frame(continent,countries)
```

## 6. Statistics

```
x <- c(1:10)

mean(x)
sum(x)

# Summaries
summary(x)
```

## Summary Notes

```
# Help Function
?
help()

# Useful Functions
length(object) # number of elements or components
str(object)    # structure of an object
class(object)  # class or type of an object
```

Study More... https://www.statmethods.net/input/datatypes.html

## Assignment

Create and script file `HW01_63130500xxx.R` and push your solution in this file and answer by using comment. Example

```
# Example 0
x <- 1
y <- 2
print(x+y) #3
```

