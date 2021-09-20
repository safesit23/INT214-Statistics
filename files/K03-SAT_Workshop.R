library(readr)
library(assertive)
library(stringr)
library(dplyr)

sat_score <- read_csv("../datasets/SAT_original.csv")

# Step 1: Observe data
glimpse(sat_score)
colnames(sat_score)

# Step 2: Change type of data
sat_score$math_score <- as.numeric(sat_score$math_score)
assert_is_numeric(sat_score$math_score)

sat_score <- sat_score %>% mutate(
  reading_score = as.numeric(reading_score),
  writing_score = as.numeric(writing_score)
)

# Step 3: See the Duplicate Data
sat_score %>% duplicated() %>% table()
sat_score %>% duplicated() %>% sum()

sat_score %>% group_by(DBN,school_name) %>% count() %>% filter(n>1)
sat_score %>% filter(duplicated(sat_score))

# Step 4: Clear duplicate data
sat_score %>% distinct() %>% count() #478 Data
sat_score <- sat_score %>% distinct()

# Step 5: Check Range of score
sat_score %>% filter(
  math_score<200|math_score>800|
    reading_score<200|reading_score>800|
    writing_score<200|writing_score>800
)

as.vector(sat_score$math_score) %>% na.omit()  %>%
  assert_all_are_in_closed_range(lower=200,upper = 800)
as.vector(sat_score$reading_score) %>% na.omit()  %>%
  assert_all_are_in_closed_range(lower=200,upper = 800)
as.vector(sat_score$writing_score) %>% na.omit()  %>%
  assert_all_are_in_closed_range(lower=200,upper = 800)

# Step 6: Handling out of range
sat_score <- sat_score %>% 
  mutate(
    math_score=replace(math_score, math_score<200|math_score>800,NA),
    reading_score=replace(reading_score, reading_score<200|reading_score>800,NA),
    writing_score=replace(writing_score, writing_score<200|writing_score>800,NA),
  )

# Step 7: Calculate total score
sat_score <- sat_score %>% mutate(total_score = math_score+reading_score+writing_score)

# Step 8: Find Stat
summary(sat_score)
# or
sat_score %>% summarise(
  min_score = min(total_score,na.rm = T),
  avg_score = mean(total_score,na.rm = T),
  max_score = max(total_score,na.rm = T)
)

# count school
sat_score %>% count() #478 School which sent data
sat_score %>% filter(is.na(total_score)) %>% count() #62
sat_score %>% na.omit() %>% count() #416 school with complete data

# School that get highest total score
sat_score %>% arrange(desc(total_score))
sat_score %>% filter(total_score==max(total_score,na.rm = T))

# Step 9: Write file
write_csv(sat_score,file = "SAT_clean.csv")


# Don't do like this ----------------
sat_score %>% filter(sum_score<600|sum_score>2400)  #because some data is wrong