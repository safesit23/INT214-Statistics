library(dplyr)
library(readr)

# 1.) Sample and Population -------------
# Sample Data
sample(1:5, 3)
sample(1:5, 3,replace = T)

# Sample n rows from a table
glimpse(mtcars)
mtcars %>% sample_n(2)

# Generated Random Data with Normal Distribution
population_1 <- rnorm(20, mean=65, sd=3.5)
population_1

# Sample Data
sample_1 <- sample(population_1 , 3)
sample_1

# 2.) Point Estimation
# Explore
glimpse(starwars)
count(starwars)
# Mean
mean(starwars$height, na.rm = T)
starwars %>% filter(sex=="male") %>% 
  summarise(avg_height=mean(height,na.rm = T)) %>% pull()
# Proportion of male
i <- starwars %>% filter(sex=="male") %>% count() %>% pull();i
n <- starwars %>% count() %>% pull();n
p <- i/n; p

# 3.) Normal Distribution

# Finding Z
x <- 12
xbar <- 10
sd <- 1
z <- (x-xbar)/sd;z

# Finding Area
prob1 <- pnorm(x,xbar,sd); prob1
# Finding Z
z1 <- qnorm(prob1); z1


# 4.) Example 1: Case Study-Hilltop Coffee ---------
n <- 36
sd <- 0.18
xbar <- 2.92
u0 <- 3

#H0: u>=3, Ha: u<3
alpha <- 1/100;alpha

z <- (xbar - u0) / (sd/sqrt(n));z

# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}





