# Sample datasets
sample1 <- c(29,49,42,43,32,38,37,41,27,27,30)
sample2 <- c(1,2,3,5,10,500)
sample3 <- c("Male","Female","Male","Female","Female")
### Cross Tabulation and Table Creation
table(sample1)

names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))
marvel_movies <- data.frame(names,years)
table(marvel_movies$years)

# DescTools package
install.packages("DescTools")

library(DescTools)
help(package=DescTools)

Mode(sample1)

factor(sample3)
# treats gender as a nominal variable
gender <- factor(sample3)
class(sample3)
class(gender)
summary(gender)

data()
View(iris)
help(iris)

str(mtcars)
head(mtcars)
summary(mtcars)
colMeans(mtcars)
?mtcars

# Find mean of miles per gallon (mpg)
mean(mtcars$mpg)  # 20.09062

Hotels <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Hotels.csv")
Hotels <- read.csv("../datasets/Hotels.csv")
View(Hotels)



