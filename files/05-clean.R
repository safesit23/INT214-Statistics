library(dplyr)

cars <- as_tibble(mtcars)
glimpse(cars)
cars %>% head()
head(cars)

glimpse(starwars)

starwars %>% select(name,height)
starwars %>% select(-name)
starwars %>% filter(sex == "male",skin_color == "light")
starwars %>% filter(sex == "male"|skin_color == "light")
starwars %>% arrange(height)
starwars %>% summarise(height = mean(height, na.rm = TRUE))
starwars %>% group_by(sex) %>% select(height) %>% summarise(avg = mean(height, na.rm = TRUE))

# Save into new variable
sw <- starwars
# Rename Column named hair_color to hair
sw <- sw %>% rename(hair=hair_color)
glimpse(sw)

# Mutate
sw %>% mutate(height_m = height / 100) %>% glimpse()

# Transmute
sw %>% transmute(height_m = height / 100)  %>% glimpse()

# Data Cleaning ----------------------

library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(assertive)  # Readable check functions to ensure code integrity

products <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/products_original.csv")

glimpse(products)
products %>% head()
products %>% View()

#3. Checking the types of values
is.numeric(products$price)
assert_is_numeric(products$price)

is.numeric(products$sold)
assert_is_numeric(products$sold)

is.factor(products$gender)

# 4.Changing Type: character to Factor (Gender)
products$gender <- as.factor(products$gender)
summary(products$gender)

# 5.Handling String with stringr (Price)
products$price %>% as.numeric() # It will change all data as NA / Need to handle string first

products$price <-
  products$price %>% str_remove("THB") %>% 
  str_trim() %>% str_remove(",") %>% as.numeric()
glimpse(products)

# 6. Removing duplicate data
# Duplicate elements
products %>% duplicated() %>% table()
products %>% duplicated() %>% sum()
products %>% filter(duplicated(products))

# Using only distinct observation
products <-
  products %>% distinct()

## FINDING (KEY)
# Gross sales of all products from this datasets.
products %>% mutate(sales = price*sold) %>% 
  summarise(gross_sales = sum(sales))
# Number of all products from this datasets.
products %>% count()

# 7. Handling missing data and outliers
std_room <- data.frame(
  name=c("Antony","Baifern","Caty","Daniel","Julia","Susan","Tom"),
  mid_score = c(29, 26, 15, 19, 22, 50, NA),
  final_score = c(NA, 15, 26, 19, 20, 18, 20)
)

# Display list of students who absent in each examination.
std_room %>% filter(is.na(mid_score)|is.na(final_score)) %>% count()

# Display list of students who has taking all exams.
std_room %>% na.omit()

# Handling Range Values
assert_all_are_in_closed_range(std_room$mid_score, lower = 0, upper = 30)
assert_all_are_in_closed_range(std_room$final_score, lower = 0, upper = 30)

std_room$mid_score <- replace(std_room$mid_score,std_room$mid_score == 50, 15)

# Student's who get highest midterm score in this room.
std_room %>% filter(mid_score==max(mid_score,na.rm = T))

## Teacher need your help more: (KEY)
# Cleaning Data
std_room$mid_score <- 
  replace(std_room$mid_score,is.na(std_room$mid_score), 0)
std_room$final_score <- 
  replace(std_room$final_score,is.na(std_room$final_score), 0)

# List all of students with total score in descending order.
std_room %>% mutate(total_score=mid_score+final_score) %>% 
  select(name,total_score) %>% arrange(desc(total_score))

