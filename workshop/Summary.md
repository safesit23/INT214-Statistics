# Summary and Collect useful function in R

**Created by Safe**

## 1. Basic Operation

We can create variable by using `<-` it mean assign value (right) to variable (left)

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

### 2.1. Basic Data Type

There are 3 types: Numeric, Logical, Character

```
varA <- 100     # Numeric ex 1, 1.0
varB <- TRUE    # Logical: TRUE, FALSE
varC <- "Hello" # Character
```

### 2.2 Factor

```
sample <- c("M","F","M","F","F")
gender <- factor(sample)
summary(gender)
```

### 2.3. Data Structure

```
vec1 <- c()             # Vector
list <- list()          # List
world <- data.frame()   # Data Frame
```

### 2.4. Useful Function

```
help(name)        # Help Document
length(object)    # number of elements or components
str(object)       # structure of an object
class(object)     # class or type of an object
summary(object)   # result summaries
```

## 3. Descriptive Statistics

- `mean(), median(), min(), max(), quartile(), range(), sd(), var(), iqr()`
- `mean(nums,na.rm = TRUE)` to handle NA (Not Available’ / Missing Values) Value

```
# Finding mode
library(DescTools)
Mode()
```

## 4. Explore the datasets in base R

### 4.1. Loading Data

```
data()
read.csv("filename")

# readr package
library(readr)      # A fast and friendly way to read rectangular data
read_csv("filename")
write_csv(data,file = "filename")
```

### 4.2. Useful Function

```
View(obj)   # Invoke a Data Viewer
head()      # See 6 observation (rows)
str()       # Structure of object
colnames()  # Column Name
rownames()  # Row Name
colMeans()  # Mean each column
rowMeans()  # Mean each row
colSums()   # Sum each column
rowSums()   # Sum each row
table()     # Cross Tabulation and Table Creation
```

```
mtcars[1,]      # Select first row with all column
mtcars[,1]      # Select all row with only first column
```

## 5. Packages

```
install.packages(name)      # Install Package
library(name)               # Loading/Attaching and Listing of Packages
help(package=name)          # Read description
```

- `dplyr`: data manipulation
- `tidyr`: help you create tidy data
- `readr`: A fast and friendly way to read rectangular data
- `stringr`: Character manipulation
- `assertive`: Readable check functions to ensure code integrity
- `lubridate`: Handle datetime format

## 6. dplyr Package

```
library(dplyr)
```

## 6.1 Function

```
cars <- as_tibble(mtcars)   # enhanced version of data.frames
glimpse(cars)               # print the data similar str() function
cars %>% head()             # Using The Pipes Operator in R
```

## 6.2 Data Manipulation and Transformation

```
select()        # picks variables based on their names.
filter()        # picks cases based on their values.
arrange()       #  changes the ordering of the rows.
group_by()      # takes a data frame and one or more variables to group by
summarise()     # reduces multiple values down to a single summary.
mutate()        # adds new variables that are functions of existing variables
transmute()     # adds new variables and drops existing ones.
rename()        # renaming columns
count()         # Count observations by group
```

For example

```
starwars %>% select(name,height)
starwars %>% filter(sex == "male",skin_color == "light")
starwars %>% arrange(height)
starwars %>% summarise(height = mean(height, na.rm = TRUE))
starwars %>% group_by(sex) %>% select(height) %>% summarise(avg = mean(height, na.rm = TRUE))
starwars %>% rename(hair=hair_color)
starwars %>% mutate(height_m = height / 100)
starwars %>% transmute(height_m = height / 100)
```

## 7. Checking and Changing the Type of Value

```
library(assertive)  # Readable check functions to ensure code integrity
```

### 7.1. Checking the types of values

- Logical checking: returns TRUE or FALSE
- `assertive` checking: errors when FALSE (using assertive package)

```
# Logical checking
is.character()
is.numeric()
is.logical()
is.factor()
is.Date()
is.na()

# assertive
assert_is_character()
assert_is_numeric()
...
```

### 7.2. Changing the types of values

```
as.character()
as.factor()
as.numeric()
```

## 8. Handling String with stringr

```
library(stringr)    # Character manipulation

str_trim(string)                          # Trim whitespace from a string
str_remove(string, pattern)               # Remove matched patterns in a string
str_split(string)                         # Split up a string into pieces
str_sub(string, start = 1L, end = -1L)    # Extract and replace substrings from a character vector
```

## 9. Removing duplicate data

```
duplicated()      # return a logical vector, if duplicate will return TRUE.
distinct()        # Select only unique/distinct rows from a data frame.
```

Using with dplyr package

```
products %>% duplicated() %>% sum()
products %>% distinct()
```

## 10. Handling missing values

```
na.omit()
```

## 11. Outliers data & Range Values

```
replace(col, condition, replacement)                          # Replace value with condition
assert_all_are_in_closed_range(col, lower = l1, upper = u1)   # Check in range of [l1,u1]
```
