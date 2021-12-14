# 04 Explore Data Part II: Data Manipulation

## Agenda

- Review Explore Data Part I
- Introduction to dplyr Package
- Grammar of data manipulation

## 0. Prerequisites

1. Open R Studio Desktop and setting working directory
2. Create Script file name `04_63130500xxx.R` and save in your working directory
3. Install and Loading `dplyr` packages (If install success, you cau using `glimpse(mtcars)` function)
4. Open progress form [Class 04](https://forms.gle/54xmje433KUDnPNn8) and checked on Study Check-In and 0 prerequisite

## Review Explore Data Part I

In last week, we learnt:

1. How to install packages in R
2. Using `Mode()` function
3. Factors data type
4. Explore datasets and import datasets from CSV

```
# Useful Function
library(package)      # Loading/Attaching and Listing of Packages
View(obj)             # Invoke a Data Viewer
head(obj)             # See the First 6 observation of an Object
summary(obj)          # Summary data
factor(obj)           # Category
```

```
# Import datasets from CSV
Hotels <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Hotels.csv")
Hotels <- read.csv("Hotels.csv")
```

## 1. Introduction to dplyr Package

The dplyr package in R is designed to make data manipulation tasks simpler and more intuitive than working with base R functions only. Called a **“grammar of data manipulation”**, dplyr provides functions that solve many challenges that arise when organizing tabular data (i.e., data in a table with rows and columns). Tabular data has a lot of the same functionality as tables from SQL or Excel, but dplyr adds the power of R. (Ref: [dpylr](https://dplyr.tidyverse.org))

```
library(dplyr)
```

Before we learning grammar of data manipulation, you need to know pipes and tibble.

### 1.1. The Pipes Operator in R

All of the dplyr functions take a data frame (or tibble) as the first argument. Rather than forcing the user to either save intermediate objects or nest functions, dplyr provides the `%>%` operator from magrittr. `x %>% f(y)` turns into `f(x, y)` (References: [Data Camp](https://www.datacamp.com/community/tutorials/pipe-r-tutorial#howto), [The pipe](https://dplyr.tidyverse.org/articles/dplyr.html#the-pipe))

```
# Sample 1: head()
head(Hotels$RateperNight,9)
Hotels$RateperNight %>% head(9)

# Sample 2: mean()
mean(Hotels$RateperNight)
Hotels$RateperNight %>% mean()
```

### 1.2. Tibble

Last week, we learning about `table()` which is enhanced version of data.frames. This week, I want to
introduced a modern reimagining of the data frame named **Tibble**. It’s particularly useful for large datasets because it only prints the first few rows. You can learn more about tibbles at https://tibble.tidyverse.org; in particular you can convert data frames to tibbles with `as_tibble()`.

```{R}
Hotels <- as_tibble(Hotels)
str(Hotels)
glimpse(Hotels)
```

Glimpse Output:

```
Rows: 20
Columns: 2
$ City         <chr> "Atlanta", "Boston", "Chicago", "Cleveland", "Dallas", "Denver", "Detroit", "Houst…
$ RateperNight <int> 163, 177, 166, 126, 123, 120, 144, 173, 160, 192, 125, 167, 245, 146, 139, 134, 16…
```

### 1.3. Data: starwars

In dplyr packages has build-in dataset named `starwars` which ia about Starwars characters. (Learn more: [RDocumentation](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/starwars)) Let's explore this dataset:

```
starwars
glimpse(starwars)
```

Answer following question:

1. How many observation and variable ?
2. What is data type of mass and height ?
3. What is average height of Starwars characters ?

## 2. Grammar of data manipulation

dplyr is a grammar of data manipulation, providing a consistent set of verbs/adverbs that help you solve the most common data manipulation challenges:

- `select()` picks variables based on their names.
- `filter()` picks cases based on their values.
- `arrange()` changes the ordering of the rows.
- `group_by()` takes a data frame and one or more variables to group by
- `summarise()` reduces multiple values down to a single summary.
- `mutate()` adds new variables that are functions of existing variables (Next class)
- `transmute()` adds new variables and drops existing ones. (Next class)
- `rename()` renaming columns (Next class)

Cheatsheets: https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf

### 2.1. Selecting

You can using `select()` to select columns (Learn more: [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select))

```
# Selecting Columns
select(starwars,name,height)

# In class we use:
starwars %>% select(name,height)
```

\*\*If you import many libraries, it can has same function named such as MASS and dplyr has same function named `select`. You need to specific package like `dplyr::select()`

Moreover, you can excluding some solumn

```
#Excluding
starwars %>% select(-hair_color,-skin_color,-eye_color)
```

### 2.2. Filtering

You can using `filter()` to select a subset of rows in a data frame(Learn more: [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#filter-rows-with-filter))

```
starwars %>% filter(sex == "male")
starwars %>% filter(!(sex == "male"))
starwars %>% filter(sex == "male" | skin_color == "light")  # or
starwars %>% filter(sex == "male",skin_color == "light")    # and
```

### 2.3. Arranging

You can using `arrange()` to filter rows (Learn more: [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#arrange-rows-with-arrange))

```
starwars %>% arrange(height)
starwars %>% arrange(desc(height))
```

### 2.4. Summarise

You can using `summarise()` to collapses a data frame to a single row. (Learn more: [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#summarise-values-with-summarise))

```
starwars %>% summarise(height = mean(height, na.rm = TRUE))
```

## 3. Combining functions with %>%

So you can use it to rewrite multiple operations that you can read left-to-right, top-to-bottom, reading the pipe operator as “then” (Learn more: [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#combining-functions-with-))

#### Example 1: Select name, height, mass, and skin color then shows only skin color is light:

```
starwars %>% select(name,height,mass, skin_color) %>% filter(skin_color=="light")
```

#### Example 2: Find average height of each sex:

```
starwars %>% group_by(sex) %>% select(height) %>% summarise(avg = mean(height, na.rm = TRUE))
```
** Read more about [group_by](https://dplyr.tidyverse.org/articles/grouping.html#group_by)

#### Example 3: Mass of Starwars characters who is male in descending order

```
starwars %>%  filter(sex=="male") %>% dplyr::select(name,mass) %>% arrange(desc(mass))
```

## Self Learning Activity:

### A.) Learning more about Data Manipulation

It has many free online course about Data Manipulation. You can study in these course to more understand by learning with yourself.

- [codecademy: INTRODUCTION TO DATA FRAMES IN R](https://www.codecademy.com/courses/learn-r/lessons/r-data-frames-intro)
- [datacamp: Data Manipulation with dplyr](https://www.datacamp.com/courses/data-manipulation-with-dplyr)

### B.) Read more...

- tibble: https://tibble.tidyverse.org/
- Count observations by group: https://dplyr.tidyverse.org/reference/count.html

### C.) Try to doing with yourself (Exercise)
1. Find a list of name and height who is the first 12 tallest star wars characters.
2. Finding name of star wars characters who is height equal 202.
3. How many star wars characters who has blue eye but not human species ?
4. From question 3, how many characters in each species ?
5. Finding average height and mass of each species then show only 10 species that have average height by descending order.
6. (Advanced-Optional) From question 5, using `mutate()`(Read how to used: [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#add-new-columns-with-mutate-)) to create new column `BMI` and calculate BMI and order by BMI in descending order. Result shoule be like this:
```
   species        height   mass   BMI
   <chr>           <dbl>  <dbl> <dbl>
 1 Hutt             175  1358   443. 
 2 Vulptereen        94    45    50.9
 3 Droid            131.   69.8  40.5
 ...
```

## Group Assignment:
See in [Assignment 3](../assignment/03-week4.md)
