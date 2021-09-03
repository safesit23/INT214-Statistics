library(dplyr)
glimpse(mtcars)

# Import datasets from CSV
Hotels <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Hotels.csv")

# Sample 1: head()
head(Hotels,9)
Hotels %>% head(9) %>% tail(1)
Hotels %>% tail(1)

# Sample 2: mean()
mean(Hotels$RateperNight)
Hotels$RateperNight %>% mean()

str(Hotels)

Hotels <- as_tibble(Hotels)
str(Hotels)
glimpse(Hotels)

#Starwar
glimpse(starwars)
# MASS is DBL --> double

starwars$height %>% 
  mean(na.rm=T)

# Topic 2 Data Manipulation
# Select
starwars %>% select(-height,-gender)
# Filter
starwars %>% filter(sex == "male")
starwars %>% filter(!(sex == "male"))
starwars %>% filter(sex == "male" | skin_color == "light")  # or
starwars %>% filter(sex == "male",skin_color == "light")    # and
#Summarise
starwars %>% summarise(avg_height = mean(height, na.rm = TRUE),
                       max_height = max(height, na.rm = TRUE))

# Combining
# Case 1 :correct
starwars %>% select(name,height,mass, skin_color) %>% 
  filter(skin_color=="light")
#case 2: error
starwars %>% select(name,height,mass) %>% 
  filter(skin_color=="light")
#case 3:
starwars %>% 
  filter(skin_color=="light") %>% 
  select(name,height,mass) 
  


