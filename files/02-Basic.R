# create variable
x <- 1
y <- 2
x+y
print(x + y)
z <- x+y
z

# Numeric ex 1, 1.0
varA <- 1.0
class(varA)
?class
help(class)
# Logical: TRUE, FALSE
varB <- 1!=2
varB
class(varB)
class(1==2)
# Character
varC <- "Hello, My name is Safe"
class(varC)

# Character Vectors
animals <- c("Ant","Bird","Cat")
class(animals)
length(animals)
animals[2]

# Create Variable name
v1 <- c(1,2,3,4)
v2 <- c(2,3,0,0)
v1+v2

# Replicate
v3 <- rep(c(1,2,3),5)

# Creating integer sequences
v4 <- c(1:100)
# WHAT IF ?
v1+v4

v5 <- c(1,2,3)
v6 <- c(1,2,0)
v5+v6

# Initial
name <- c("Antony","Boky","Caty")
age <-c(10,25,30)
club <-c("Sec A","Sec B","Sec A")
retired <- c(T,F,T)

# Create list
myList <- list(name,age,club,retired)
myList

# Or assign name
myList <- list(stdName = name,
               stdAge = age,
               stdClub = club,
               retired = retired)

myList[2] #get variable stdAge

View(myList)
myList <- data.frame(name,age,club,retired)

continent <- c("Africa","Asia","Europe","North America","Oceania","South America","Antarctica")
countries <- c(54,48,51,23,14,12,0)
world <- data.frame(continent,countries)
View(world)

x <- c(1:10)
x
?mean
mean(x)
sum(x)

# Summaries
summary(x)



