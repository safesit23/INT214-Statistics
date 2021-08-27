### Exercise 1
num <- c(10.4, 5.6, 3.1, 6.4, 21.7)
#average
mean(num) #9.44
#sum
sum(num) #47.2
#median
median(num) #6.4
#sd
sd(num) #7.33846
#variance
var(num) #53.853

### Exercise 2
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

# Using Data Frame because names and years are related
marvel_movies <- data.frame(names,years)

#1.The numbers of movies
length(marvel_movies$names) #27

#2.Finding the 19th movies name
View(marvel_movies) # Using Data Viewer to view 19th movies name. It is "Avengers: Infinity War"
#or using position
marvel_movies$names[19]

#3.Which year is most released movies
View(marvel_movies) # Manual you will see 2017 and 2021
##Or using Table
table(marvel_movies$years)

#2017 and 2021
table_year <- table(years)
names(table_year)[table_year==max(table_year)]

## Using DescTools Library
install.packages("DescTools")
library(DescTools)
Mode(marvel_movies$years)
print(paste("Most released year is:",mode_year[1],mode_year[2]))

## Using dplyr Library
install.packages("dplyr")
library(dplyr)
count(marvel_movies,years,sort=TRUE) #2017 and 2021