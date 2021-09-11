# 05 Data Transformation + Data Cleaning

## Agenda

- Review dplyr Package
- Data Transformation with dpylr
- Data Cleaning

## 0. Prerequisites

1. Open progress form [Class 05](https://forms.gle/gr2LN79drqD4hKxB9) and checked on Study Check-In
2. Open R Studio Desktop and setting working directory
3. Create Script file name `05_63130500xxx.R` and save in your working directory
4. Install new packages: `readr`,`assertive`,`stringr` packages and make sure that `dplyr` already installed.
5. Checked on 0 prerequisite in progress form

## Review dplyr Package

The dplyr package in R is designed to make data manipulation (การจัดการข้อมูล) tasks simpler and more intuitive than working with base R functions only.(Ref: [dpylr](https://dplyr.tidyverse.org))

```
library(dplyr)
```

Last week, we learned about:

1. Using pipes operator by using symbols: `%>%` ex. `starwars %>% head()`
2. Tibble which is enhanced version of data.frames
3. Using `glimpse()` function to print the data similar str() function
4. Explore `starwars` dataset

```
cars <- as_tibble(mtcars)
glimpse(cars)
cars %>% head()

glimpse(starwars)
```

Moreover, we get to know a set of verbs/adverbs, called a grammar of data manipulation in dplyr

- `select()` picks variables based on their names.
- `filter()` picks cases based on their values.
- `arrange()` changes the ordering of the rows.
- `group_by()` takes a data frame and one or more variables to group by
- `summarise()` reduces multiple values down to a single summary.

### For example:

```
starwars %>% select(name,height)
starwars %>% filter(sex == "male",skin_color == "light")
starwars %>% arrange(height)
starwars %>% summarise(height = mean(height, na.rm = TRUE))
starwars %>% group_by(sex) %>% select(height) %>% summarise(avg = mean(height, na.rm = TRUE))
```

Today, we continue learning remaining function from dplyr package in "Data Transformation" topic.

## 1. Data Transformation with dpylr

Data transformation is the process of converting data from one format to another. (Ref Meaning: [trifacta](https://www.trifacta.com/data-transformation/)) We can use dpylr package to modifying data
e.g. calculating new value, changing data type from numeric to character. We can use these function:

- `rename()` renaming columns
- `mutate()` adds new variables that are functions of existing variables
- `transmute()` adds new variables and drops existing ones.

### 1.1. Rename

`rename()` changes the names of individual variables using new_name = old_name syntax; rename_with() renames columns using a function. (Ref: [dplyr](https://dplyr.tidyverse.org/reference/rename.html))

```
# Save into new variable
sw <- starwars

# Rename Column named hair_color to hair
sw <- sw %>% rename(hair=hair_color)

glimpse(sw)
```

### 1.2. Mutate and Transmute

`mutate()` adds new variables and preserves existing ones; `transmute()` adds new variables and drops existing ones. New variables overwrite existing variables of the same name. Variables can be removed by setting their value to NULL.(Ref: [dplyr](https://dplyr.tidyverse.org/reference/mutate.html))

```
# Mutate
sw %>% mutate(height_m = height / 100)

# Transmute
sw %>% transmute(height_m = height / 100)
```

### 1.3. Drop column

```
# Create new Column
sw <- sw %>% mutate(height_m = height / 100)

# Drop column
sw <- sw %>% select(-height_m)
```

## 2. Data Cleaning (Concepts)

Data cleaning is the process of preparing data for analysis by removing or modifying data that is incorrect, incomplete, irrelevant, duplicated, or improperly formatted. (Ref: [sisense](https://www.sisense.com/glossary/data-cleaning/)) If the data is small dataset, you can handle edit by manual but if the data is large dataset, using script is easily and make sure that all data is get treatment.

Data Cleaning involves repeated cycles of screening, diagnosing, and treatment.(Ref: [Data analysis workflow](http://www.coordinationtoolkit.org/wp-content/uploads/130907-Data-flow.pdf)) I can't tell specific steps to do because it depends on your dataset. Sometimes, we found problem some points after we have analytics something. You need to more practice to more proficient and know how to handle.

In this workshop we will explain the concept of Data Cleaning and use R Language for cleaning data but in real work, you can select appropiate way or tools to done this work. For example, using spreadsheet to correct the data.

### Guideline Checklist

1. Diagnosing the data - how much data cleaning we will have to do
2. Checking the types of values
3. Changing the types of values
4. Handling String with stringr
5. Handling missing data and outliers
6. Removing duplicate data

### Using packages

```
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(assertive)  # Readable check functions to ensure code integrity
```

Cheatsheets: [readr](https://github.com/rstudio/cheatsheets/blob/master/data-import.pdf),
[stringr](https://github.com/rstudio/cheatsheets/blob/master/strings.pdf)

### Dataset 1: Uniqlo Products dataset

(Ref product named from [UniqloTH](https://www.uniqlo.com/th/en)) This dataset is about's sample uniqlo product that sell in 2021. It includes productID, name of products, type of products, price of products, and number of sold. I want to know:

1. Gross sales of all products from this datasets.
2. Number of all products from this datasets.

Starting with import [products](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/clean01_products.csv) dataset by using `readr` package.

```
products <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/clean01_products.csv")
```

Then, try to diagnosing the data what you need to do with this dataset.

## 3. Checking the types of values

In this topics, we will focus to check the types of data is it appropriate to use or not. It has 2 ways to check type:

- Logical checking: returns TRUE or FALSE
- `assertive` checking: errors when FALSE (using assertive package)

```
# Logical checking
is.character()
is.numeric()
is.logical()
is.factor()
is.Date()

# assertive
assert_is_character()
assert_is_numeric()
...
```

Let's try to check in products dataset

```
is.numeric(products$price)
assert_is_numeric(products$price)

is.numeric(products$sold)
assert_is_numeric(products$sold)

is.factor(products$gender)
```

Another ways, you can used `glimpse` function to see. We found that:

- `price` is in type of character because it has `THB`. We need to change to numeric
- `sold` is in type of numeric.
- `gender` is in type of character but we need to change to factor.

## 4. Changing the types of values

We need to fix a data type to appropriate type. We using `as.xxxx()` to change data type

```
as.character()
as.factor()
as.numeric()
```

Let's try to change type of `gender` to factor type then, using `summary` function to see result. Don't forget to reassign in same variables

```
products$gender <- as.factor(products$gender)
summary(products$gender)
```

## 5. Handling String with stringr

Strings are not glamorous, high-profile components of R, but they do play a big role in many data cleaning and preparation tasks. The stringr package provide a cohesive set of functions designed to make working with strings as easy as possible. (Study more: [stringr](https://stringr.tidyverse.org/))
All functions in stringr start with `str_` and take a vector of strings as the first argument.

### Useful function in stringr

- `str_trim(string)`: Trim whitespace from a string
- `str_remove(string, pattern)`: Remove matched patterns in a string
- `str_split(string)`: Split up a string into pieces
- `str_sub(string, start = 1L, end = -1L)`: Extract and replace substrings from a character vector

Learn more function in [stringr package](https://stringr.tidyverse.org/reference/index.html)

Mostly, we will use stringr to solve comma problem. Let's try to change `price` in products to numeric type and reassign into same variable.

```
products$price <-
  products$price %>% str_remove("THB") %>% str_trim() %>% str_remove(",") %>% as.numeric()
```

## 6. Removing duplicate data

If you view this dataset you will see the duplicate observation which is same data. We need to eliminate this duplicate data.

- `duplicated()`: return a logical vector when that elements (rows) are duplicates, it will return TRUE.
- `distinct()`: Select only unique/distinct rows from a data frame.

```
# Duplicate elements
products %>% duplicated() %>% table()
products %>% duplicated() %>% sum()
products %>% filter(duplicated(products))

# Using only distinct observation
products <-
  products %>% distinct()
```

Now, datat is ready to analyze. Let's find:

- Gross sales of all products from this datasets.
- Number of all products from this datasets.

## 7. Handling missing data and outliers

### 7.1. Missing Data

we have known `NA` values in week 3 and known how to handle when we want to find descriptive statistics. Let's quick review:

```
nums <- c(1,2,3,4,NA)
mean(nums,na.rm = TRUE)
```

Now, in this topics we need to handle object

- `na.omit()`: returns the object which not contain missing values (Remove missing observation)
- `is.na()`: logical checking

### 7.2. Outliers data & Range Values

Outliers data (ค่าผิดปกติ) is a data point that differs significantly from other observations. Some data has range of values. We need to check that the values of that data is in range or not ? For example, the midterm score has value in range between 0 to 30. If value is over 30 or under 0 it mean that the data is out of range. We need to handling out of range data by

- Remove Rows
- Treat as missing (NA)
- Replace with range limit
- Replace with other value based on domain knowledge

We use function in dpylr to handling these case and using these function to help:

- `replace(col, condition, replacement)`: Replace value with condition
- `assert_all_are_in_closed_range(col, lower = l1, upper = u1)`: check in range of [l1,u1]

### 7.3. Let's try to do with student's score

This providing dataset is about 7 student's score of statistics subject which full score of each exam is 30. Student whom absent in that examination will not have scores. During record the score, teacher had record score one of student wrong from 15 to 50.

```
std_room <- data.frame(
  name=c("Antony","Baifern","Caty","Daniel","Julia","Susan","Tom"),
  mid_score = c(29, 26, 15, 19, 22, 50, NA),
  final_score = c(NA, 15, 26, 19, 20, 18, 20)
  )
```

Teacher need you to help cleaning the data and finding following:

- Display list of students who absent in each examination.
- Number of students who absent in examination.
- Display list of students who has taking all exams.
- Student's who get highest midterm score in this room.

```
# Display list of students who absent in each examination.
std_room %>% filter(is.na(mid_score)|is.na(final_score))

# Display list of students who has taking all exams.
std_room %>% na.omit()

# Handling Range Values
assert_all_are_in_closed_range(std_room$mid_score, lower = 0, upper = 30)
assert_all_are_in_closed_range(std_room$final_score, lower = 0, upper = 30)

std_room$mid_score <- replace(std_room$mid_score,std_room$mid_score == 50, 15)

# Student's who get highest midterm score in this room.
std_room %>% filter(mid_score==max(mid_score,na.rm = T))
```

#### Teacher need your help more:

- Finding the student who get highest total score in this room.
- List all of students with total score in descending order.

```
# Try to do with yourself
```

Next, we will using knowledge from week 1-6 that you have learned to doing workshop I ([Click here](./06-Workshop1))

## Self Learning and Extra Knowledge:

### A.) Learning more about Data Cleaning

It has many free online course about data cleaning. You can study in these course to more understand by learning with yourself.

- [codecademy: Data Cleaning in R](https://www.codecademy.com/courses/learn-r/lessons/r-data-cleaning)
- [datacamp: Cleaning Data in R](https://www.datacamp.com/courses/cleaning-data-in-r)
- [dataquest: Data Cleaning in R](https://www.dataquest.io/course/r-data-cleaning/)

### B.) Read more...

- [An introduction to data cleaning with R](https://cran.r-project.org/doc/contrib/de_Jonge+van_der_Loo-Introduction_to_data_cleaning_with_R.pdf)
- Handle a list with [Nest and unnest function](https://rstudio-education.github.io/tidyverse-cookbook/transform-tables.html#nest-a-data-frame)
- Change value with [Recode function](https://dplyr.tidyverse.org/reference/recode.html)
- Handle datetime format with [lubridate package](https://lubridate.tidyverse.org/)