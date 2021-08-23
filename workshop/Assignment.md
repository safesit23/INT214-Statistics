# All Assignment

- [Assignment 1](##-Assignment-1) (Week 2: 16 Aug, 20 Aug)
- [Assignment 2](##-Assignment-2) (Week 3: 23 Aug, 27 Aug)

## Assignment 1 (Individual)
Create script file `HW01_63130500xxx.R` and do exercise in this file and answer by using comment.
### Exercise 1

Finding the average, sum, median, sd, variance of `10.4, 5.6, 3.1, 6.4, 21.7`

### Exercise 2

2.1. Create data structure in varaible named `marvel_movies` and explain why you using this data structure ?

```
# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
"The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
"Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
"Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
"Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
"Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

# Or using Function
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))
```

2.2 Finding the information:

- The numbers of movies
- Finding the 19th movies name
- Which year is most released movies

## Assignment 2 (Group)
### 2.1. Git
Our subject have git organization name [sit-2021-int214](https://github.com/sit-2021-int214). Please join as members in this git organization.
1. Create repository name as format `groupid-topics` (ex. `001-`)
2. Set structure file as [int214-template](https://github.com/sit-2021-int214/int214-template)

### 2.2. Explore Data
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.
#### Datasets:
- Cats (Ref: https://www.rdocumentation.org/packages/MASS/versions/7.3-47/topics/cats)
- Survey (Ref: https://www.rdocumentation.org/packages/MASS/versions/7.3-47/topics/survey)

#### For example:
- From survey, most students use left hand writing.
- The average of body weight of cats is xxx kg.
