library(dplyr)
library(readr)

# Base R
hist(starwars$height)
plot(x=starwars$height, y=starwars$mass)

# Load data
Marvels <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Marvels.csv")

# Set data
count_marvel <-table(Marvels$years)

count_marvel

# Create graph
barplot(count_marvel)

barplot(count_marvel,
        main = "Number of Released Marvel Movies",   # Title of graphs
        xlab = "Year Released",       # X-Axis Title
        ylab = "Number of Movies",    # Y-Axis Title
)

library(ggplot2)
## Marvel Dataset - Bar Chart
#Step 1
ggplot(Marvels,aes(x=years)) + geom_bar()
#Step 2-1: Save to object
marvel_plot <- ggplot(Marvels,aes(x=years)) + geom_bar()
#Step 2-2: Adding component
marvel_plot + ggtitle("Number of Released Marvel Movies") +
  xlab("Year Released") + ylab("Number of Movies")

#2-2: Example 2: Scatter Plot
starwars %>% filter(mass>1000)

starwars %>% ggplot(aes(x=height,y=mass))+geom_point()

scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))
scat_plot

scat_plot+geom_smooth() #default value - loess
scat_plot+geom_smooth(method="lm") #linear model

# 3: Histogram
starwars %>% ggplot(aes(x=height))+geom_histogram(binwidth = 15)


