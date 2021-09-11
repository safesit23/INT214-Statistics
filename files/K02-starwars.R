library(dplyr)
#1. Find a list of name and height who is the first 12 tallest star wars characters.
starwars %>% dplyr::select(name,height) %>% arrange(desc(height)) %>% head(12)

#2. Finding name of star wars characters who is height equal 202.
starwars %>% filter(height=="202") %>% dplyr::select(name)

#3. How many star wars characters who has blue eye but not human species ?
starwars %>% filter(eye_color=="blue",!(species=="Human")) %>% count()

#4. From question 3, how many characters in each species ?
starwars %>% group_by(species) %>% filter(eye_color=="blue",!(species=="Human")) %>% count()

#5. Finding average height and mass of each species then show only 10 species 
#   that have average height by descending order.
starwars %>% group_by(species) %>% 
  summarise(height=mean(height,na.rm = T),mass=mean(mass,na.rm = T)) %>% 
  arrange(desc(height))%>% head(10)


#6. From question 5, using `mutate()` to create new column `BMI` and calculate BMI 
# and order by BMI in descending order.
starwars %>% group_by(species) %>%
  summarise(height=mean(height,na.rm = T),mass=mean(mass,na.rm = T)) %>%
  mutate(BMI = mass / ((height/100)^2)) %>% 
  arrange(desc(BMI)) %>%
  head(10)