# 07 Data Visualization

## Agenda

- What is Data Visualization
- Creating a Basic Graph
- Using ggplot2 Package

## Objective

1. Understand what is Data Visualization.
2. Know basic command to create graph with ggplot2 package.

## 0. Prerequisites

1. Open progress form [Class 06](https://forms.gle/RVzkkH18FLRWaavW8) and checked on Study Check-In
2. Open R Studio Desktop and setting working directory
3. Create Script file name `06_63130500xxx.R` and save in your working directory
4. Install new packages: `ggplot2`.
5. Loading package: `dplyr`,`readr`
6. Checked on 0 prerequisite in progress form

## What is Data Visualization

Data Visualization (Data Viz) is an interdisciplinary field that deals with the graphic representation of data. It has its roots in the field of Statistics and is therefore generally considered a branch of **Descriptive Statistics**. However, because both design skills and statistical and computing skills are required to visualize effectively, it is argued by some authors that it is both an **Art and a Science**. You can learn Fundamentals of Data Visualization in [https://clauswilke.com/dataviz/](https://clauswilke.com/dataviz/)

Before to creating a graph in R you need to know that in this class, I want you to learn basic for creating a graphs only. Understand the data more. Don't focus or serious about design in R. After this part,I will let introduce you to using BI Tools with more easily to create and visualize the data.

## 1. Creating a Graph (Base R)

In R, graphs are typically created interactively. You can create several graphs. I have summary basic command to create graph with using data `starwars` from dplyr package:

| Graph        | Command                                                                            |
| ------------ | ---------------------------------------------------------------------------------- |
| Histogram    | `hist(starwars$height)`                                                            |
| Density Plot | `plot(density(starwars$height,na.rm = T))`                                         |
| Scatter Plot | `plot(x=starwars$height, y=starwars$mass)`                                         |
| Bar Chart    | `barplot(table(starwars$sex))`                                                     |
| Pie Chart    | `pie(table(starwars$sex))`                                                         |
| Box Plot     | `boxplot(starwars$mass,data=starwars)` or `boxplot(starwars$height,data=starwars)` |

### Marvel Cinematic Universe dataset

This dataset is about's film and television in Marvel Cinematic Universe. It includes name of movie and years of film that released. Let's using this dataset to explore and create a graph to shown "Number of Released Marvel Movies".

```
# Load data
Marvels <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Marvels.csv")
```

Step 1: Creating a basic Bar Graph

```
# Set data
count_marvel <-table(Marvels$years)

# Create graph
barplot(count_marvel)
```

Step 2: Adding component of graph

```
barplot(count_marvel,
        main = "Number of Released Marvel Movies",   # Title of graphs
        xlab = "Year Released",       # X-Axis Title
        ylab = "Number of Movies",    # Y-Axis Title
)
```

## 2. Using ggplot2 Package

ggplot2 is a system for declaratively creating graphics, based on **The Grammar of Graphics**. You provide the data, tell ggplot2 how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details. (See more details: [ggplot2 Package](https://ggplot2.tidyverse.org/), [ggplot2: elegant graphics for data analysis](https://ggplot2-book.org/index.html))

- Data: The dataset being plotted.
- Aesthetics: The scales onto which we map our data.
- Geometries: The visual elements ued for our data.

All ggplot2 plots begin with a call to ggplot(), supplying default data and aesthethic mappings, specified by aes(). You can add layers, scales, coords and facets with symbol `+` after ggplot().See more details: [Layers](https://ggplot2.tidyverse.org/reference/)

```
ggplot(dataset,aes(x=colName,y=colName)) + geom_xxxx()
```

### 2.1. Example 1: Bar chart with Marvels dataset

Step 1: Creating a basic Bar Graph

```
ggplot(Marvels,aes(x=years)) + geom_bar()
```

Step 2: Adding component of graph

```
# Save to object
marvel_plot <- ggplot(Marvels,aes(x=years)) + geom_bar()

# Adding component
marvel_plot + ggtitle("Number of Released Marvel Movies") +
  xlab("Year Released") + ylab("Number of Movies")
```

### 2.2. Example 2: Scatter Plot with starwars dataset

Step 1: Creating a scatter plot

```
starwars %>% ggplot(aes(x=height,y=mass))+geom_point()
```

Step 2: Using filter data to expand more details

```
starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass)) + geom_point()
```

Step 3: Label gender with color

```
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))
scat_plot
```

Step 4: Adding a line of best fit to a plot

```
scat_plot+geom_smooth() #default value - loess
scat_plot+geom_smooth(method="lm") #linear model
```

Try another graphs with yourself more: https://www.r-graph-gallery.com/

## 3. Exercise in Class

- Try to Create histogram graph to see the height \*\*Try to use `binwidth = 10` in geometries.

```
// Try with yourself
```

## Self Learning and Extra Knowledge:

### A.) Learning more

It has many free online course about Data Visualization. You can study in these course to more understand by learning with yourself.

- [Datacamp: Data Visualization in R](https://learn.datacamp.com/courses/data-visualization-in-r)
- [Datacamp: Introduction to Data Visualization with ggplot2](https://learn.datacamp.com/courses/introduction-to-data-visualization-with-ggplot2)
- [Datacamp: Intermediate Data Visualization with ggplot2](https://learn.datacamp.com/courses/intermediate-data-visualization-with-ggplot2)
- [codecademy: Fundamentals of Data Visualization with ggplot2](https://www.codecademy.com/courses/learn-r/lessons/intro-visualization-ggplot2-r)

### B.) More Practice

1. (Easy) Using [datasets](https://github.com/safesit23/INT214-Statistics/tree/main/datasets) that used in class (e.g. survey, cats, mtcars, products) and visualize the data.
2. (Advanced) Download full dataset from [Stack Overflow Annual Developer Survey](https://insights.stackoverflow.com/survey) and try to transform data and visualize data same as [result](https://insights.stackoverflow.com/survey/2021)

## Individual Assignment (5 %)

[Click here to see details](../assignment/04-week8.md)
