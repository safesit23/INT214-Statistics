# 03 Explore Data Part I: Statistic and Datasets

## Agenda

- Review Data Types & Data Structures
- Review Descriptive Statistics
- Install Packages in R
- Factors (One of data type)
- Explore the datasets in base R
- Explore datasets from CSV

## 0. Prerequisites

1. Open R Studio Desktop and setting working directory
2. Open Slide [03 Explore Data Part I](https://drive.google.com/file/d/1L9sQGIH_aOA2IHkiXE1XrLKvlr_ge8Il/view)
3. Create Script file name `03_63130500xxx.R` and save in your working directory
4. run command `install.packages("DescTools")` (This command will use in Topic 2)
5. Open progress form [Class 03](https://forms.gle/n34yEsZKmrqv5ydK9) and checked on Study Check-In and 0 prerequisite

## Review Week 2: Data Type and Data Structure

```
# Data type
varA <- 100             # Numeric ex 1, 1.0
varB <- TRUE            # Logical: TRUE, FALSE
varC <- "Hello World!"  # Character

# Data Structure
vec1 <- c()             # Vector
list <- list()          # List
world <- data.frame()   # Data Frame

# Useful Functions
length()          # number of elements or components
str()             # structure of an object
class()           # class or type of an object
summary()         # result summaries
```

## 1. Review Descriptive Statistics

- In R Programming, we can find descriptive statistics by using:
  `mean(), median(), min(), max(), quartile(), range(), sd(), var(), iqr()`
- When we using function we need to understand which function is appropriate for data.

Try to measures of central value (วัดค่ากลาง) of this sample data:

```
# Sample datasets
sample1 <- c(29,49,42,43,32,38,37,41,27,27,30)
sample2 <- c(1,2,3,5,10,500)
sample3 <- c("Male","Female","Male","Female","Female")
```

If you observe, you will find that in base R not has function to find **mode**. The `mode()` in R base is using for get the type mode of an object. You need to finding manually. If the data have more than 1 million. How should you do ? We wouldn't be so mean.
I want to present 2 ways that you will get mode:

1. Using function `table()` (enhanced version of data.frames)
2. Install Packages

```
### Cross Tabulation and Table Creation
table(sample1)
```

## 2. Install Packages in R

A package is a suitable way to organize your own work and, if you want to, share it with others. Typically, a package will include code (not only R code!), documentation for the package and the functions inside, some tests to check everything works as it should, and datasets. [Ref: DataCamp](https://www.datacamp.com/community/tutorials/r-packages-guide)

```
# Install Package
install.packages(name)

# Loading/Attaching and Listing of Packages
library(name)

# Read description
help(package=name)
```

Let's try to install **Tools for Descriptive Statistics** package (If you have problem, you can use GUI to install package.)

```
# DescTools package
install.packages("DescTools")

library(DescTools)
help(package=DescTools)
```

Now you can finding mode by using `Mode()` function

```
Mode(sample1)
```

Try to using this function with `marvel_movies` and tell me the result.

## 3. Factors

Factors is one of data type in R. It's appropriate for nominal value (ข้อมูลเชิงปริมาณ หรือ
ข้อมูลที่ไม่ใช่ตัวเลข) such as: gender (male / female), Class (1st / 2nd / 3rd). We can use `factor()` function to see levels of object

```
factor(sample3)

# treats gender as a nominal variable
gender <- factor(sample3)
summary(gender)
```

Ref: https://www.statmethods.net/input/datatypes.html

## 4. Explore the datasets in base R

In base R has built-in datasets. To see the list of datasets, you can using `data()` function.
The popular used R demo datasets is mtcars, iris, ToothGrowth, PlantGrowth and USArrests.

```{R}
data()
```

### Explore overview dataset

```
head()      # See 6 observation (rows)
str()       # Structure of object
colnames()  # Column Name
rownames()  # Row Name
colMeans()  # Mean each column
rowMeans()  # Mean each row
colSums()   # Sum each column
rowSums()   # Sum each row
```

### Data set: Motor Trend Car Road Tests

We will use `mtcars` datasets to explore data

```
View(mtcars)
```

```
str(mtcars)
head(mtcars)
summary(mtcars)
colMeans(mtcars)
```

### Inspect inside dataset

We can select one column to calculate some thing by using `df$col`. Example, we want to finding average of miles per gallon in Motor Trend Car Road Tests.

```
# Find mean of miles per gallon (mpg)
mean(mtcars$mpg)  # 20.09062
```

### Self Study:

Moreover, we can select row and column by using format: `df[row,col]`

```
mtcars[1,]                  # Select first row with all column
mtcars[,1]                  # Select all row with only first column
mtcars["Datsun 710","wt"]   # Select by specific row and column
mtcars[1:5,]                # Select row 1-5 with all column
```

## 5. Explore datasets from CSV

In R, we can import datasets from CSV (comma-separated values) files by using function `read.csv()`. If you import from local you need to set path correctly.

```{R}
Hotels <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Hotels.csv")
View(Hotels)
```
### Extra
In R has library named `readr` that can read CSV file by using function `read_csv()`

### Exercise:

- How many observation ? (จำนวนข้อมูล)
- What is the mean hotel room rate ?
- What is the median hotel room rate ?
- What is the mode ?

Dataset from: Chapter 3, page 92 – 93, Statistic for Business and Economics

## Notes

### Useful Function in week 3

```
View(obj)         # Invoke a Data Viewer
table(obj)        # Cross Tabulation and Table Creation
library(obj)      # Loading/Attaching and Listing of Packages
Mode(obj)         # Mode in descriptive stat
data()            # See all datasets in R
head(obj)         # See the First 6 observation of an Object
factor(obj)       # Category
```

### Library in week 3

```
library(DescTools)    # DescTools package
library(MASS)         # Support Functions and Datasets for Venables and Ripley's MASS
```

## Self Learning Activity:

### A. Explore more datasets

#### 1. Install and loading `MASS` package

```
install.packages("MASS")
library(MASS)
```

#### 2. Explore this 2 dataset that given

- Cats (Ref: https://www.rdocumentation.org/packages/MASS/versions/7.3-47/topics/cats)
- Survey (Ref: https://www.rdocumentation.org/packages/MASS/versions/7.3-47/topics/survey)

#### 3. Finding descriptive statistics and summary result in form of sentences/paragraph. For example,

- From survey, most students use left hand writing.
- The average of body weight of cats is xxx kg.

After you have done, you need to sharing and working with your group as [Assignment 2](https://github.com/safesit23/INT214-Statistics/tree/main/assignment).

### B. What is NA Values ?

In the survey dataset, it has `NA` values. `NA` mean ‘Not Available’ / Missing Values.
If you try to find `mean()`, it will get result `NA` because in that vector has `NA` value.
You need to handle `NA` values by add parameter `na.rm` in function. For example:

```
nums <- c(1,2,3,4,NA)
mean(nums,na.rm = TRUE)
```

### C. Pipes Operator in R

- `f(x)` can be rewritten as `x %>% f`
- In short, this means that functions that take one argument, function(argument), can be rewritten as follows: `argument %>% function()`. Ref: [Data Camp](https://www.datacamp.com/community/tutorials/pipe-r-tutorial#howto)

Try to use `%>%` operator and see the result. Is it same ?

```
# In class
mean(mtcars$mpg)

# Use pipes operator
mtcars$mpg %>% mean()
```
