# 08 Hypothesis Testing

## Agenda

- Review: Descriptive Statistics
- Sample and Population
- Point Estimation
- Normal Distribution
- Hypothesis testing

## 0. Prerequisites

1. Open progress form [Class 07](https://forms.gle/GbotmGNTwwa2yf3w7) and checked on Study Check-In
2. Open R Studio Desktop and setting working directory
3. Create Script file name `07_63130500xxx.R` and save in your working directory
4. Checked on 0 prerequisite in progress form
5. Loading `dplyr`, `readr` packages

## Review: Descriptive Statistics

- In R Programming, we can find descriptive statistics by using:
  `mean(), median(), min(), max(), quartile(), range(), sd(), var(), IQR()`
- You can find square-root by using function: `sqrt()`

## 1. Sample and Population

```
# Sample Data
sample(1:5, 3)

# Sample n rows from a table
mtcars %>% sample_n(2)
```

In R, we can using `rnorm()` to generate random data with Normal Distribution

```
# Generated Random Data with Normal Distribution
population_1 <- rnorm(20, mean=65, sd=3.5)

# Sample Data
sample_1 <- sample(population_1 , 3)
```

## 2. Point Estimation

Point estimation involves the use of sample data to calculate a single value. In Statistics, we use

- Mean: x̄ (sample), μ (population) Using`mean(nums)`
- S.D. : S (sample), σ (population) Using `sd(nums)`
- Proportion: p (sample), p (population)

### 2.1. Mean

1. Finding average height of `starwars` characters.
2. Finding average height of `starwars` characters which gender is male.

```
//Code
```

### 2.2. Proportion (สัดส่วน)

A frequency distribution shows the number (frequency) of items in each of several non-overlapping classes. However, we are often interested in the proportion, or percentage, of items in each class. The relative frequency of a class equals the fraction or proportion of items belonging to a class.

Formula: p = จำนวนที่สนใจ (i) / จำนวนทั้งหมด (n)

```
# Example Proportion of male
i <- starwars %>% filter(sex=="male") %>% count() %>% pull()
n <- starwars %>% count() %>% pull()
p <- i/n;   p
```

\*\* `pull()` is function in `dplyr` packages using for Extract a single column

## 3. Normal Distribution

### 3.1 Standard Score (Z)

- Formula: z = x-x̄ / S.D.

#### Finding Cumulative probability (พื้นที่ใต้กราฟ)

- In excel, we using `=NORM.DIST(x, mean, S.D ,cumulative)`
- In R, we using

```
pnorm(x, mean, sd)
```

#### Finding Z-Score

- In excel, we using `=NORM.S.INV(prob)` (ค่าผกผันของการแจกแจงสะสมปกติมาตรฐาน)
- In R, we using

```
qnorm(prob, mean = 0, sd = 1, lower.tail = TRUE)
```

### 3.2 Student’s t-Distribution

#### Finding Cumulative probability (พื้นที่ใต้กราฟ)

- In excel, we using `=T.DIST(x, deg_freedom, cumulative)` or `=T.DIST.RT(x,deg_freedom)`
- In R, we using

```
pt(q, df,lower.tail = TRUE)
```

#### Finding t-score

- In excel, we using `=T.INV(probability,deg_freedom)` (ค่าผกผันด้านซ้ายของการแจกแจงแบบ t)
- In R, we using

```
qt(p, df, lower.tail = TRUE)
```

## 4. Hypothesis testing

is a method of statistical inference. An alternative hypothesis is proposed for the probability distribution of the data, either explicitly or only informally. The comparison of the two models is deemed statistically significant if, according to a threshold probability—the significance level—the data would be unlikely to occur if the null hypothesis were true. [Ref](https://en.wikipedia.org/wiki/Statistical_hypothesis_testing)

### Step to do:

0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z <- (xbar - u0) / (sd/sqrt(n))
   - t <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion

### Example 1 (Ref: Chapter 9 Page 356)

The Federal Trade Commission (FTC) periodically conducts statistical studies designed to test the claims that manufacturers make about their products. For example, the label on a large can of Hilltop Coffee states that the can contains 3 pounds of coffee. Thus, the FTC interprets the label information on a large can of coffee as a claim by Hilltop that the population mean filling weight is at least 3 pounds per can. The director of the FTC’s testing program willing to risk a 1% chance of making such an error. Suppose a sample of 36 cans of coffee is selected and the population standard deviation can be assumed known with a value of σ = 0.18. Is x̄ = 2.92 pounds small enough to cause us to reject H0 ?

Step 0: Assign variables

```
n <-
sd <-
xbar <-
u0 <-
```

Step 1: State the hypothesis

```
#h0:   ,ha:
```

Step 2: Level of significance

```
alpha <-
```

Step 3: Test statistic

```
z <- (xbar - u0) / (sd/sqrt(n));z
```

Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha
```

Step 5: Compare

```
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
```

Step 6: Conclusion

//Answer

## 5. Exercise

### Practice 1 (Ref: Chapter 9 Question 42, Page 381)

According to the University of Nevada Center for Logistics Management, 6% of all mer- chandise sold in the United States gets returned (BusinessWeek, January 15, 2007). A Houston department store sampled 80 items sold in January and found that 12 of the items were returned. Construct a 95% confidence interval for the porportion of returns at the Houston store. Is the proportion of returns at the Houston store significantly different from the returns for the nation as a whole? Provide statistical support for your answer.

### Practice 2 (Ref: Chapter 9 Question 21, Page 370)

Fowle Marketing Research, Inc., bases charges to a client on the assumption that telephone surveys can be completed in a mean time of 15 minutes or less. If a longer mean survey time is necessary, a premium rate is charged. A sample of 35 surveys provided the survey times shown in the file named Fowle. Based upon past studies, the population standard deviation is assumed known with σ = 4 minutes. Is the premium rate justified ?

Get dataset here:

```
https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Time.csv
```

### Practice 3 (Ref: Chapter 10 Question 26, Page 422)

The College Board provided comparisons of Scholastic Aptitude Test (SAT) scores based on the highest level of education attained by the test taker’s parents. A research hypothesis was that students whose parents had attained a higher level of education would on average score higher on the SAT. During 2003, the overall mean SAT verbal score was 507 (The World Almanac, 2004). SAT verbal scores for independent samples of students follow. The first sample shows the SAT verbal test scores for students whose parents are college graduates with a bachelor’s degree. The second sample shows the SAT verbal test scores for students whose parents are high school graduates but do not have a college degree.

```

```

a. Formulate the hypotheses that can be used to determine whether the sample data sup- port the hypothesis that students show a higher population mean verbal score on the SAT if their parents attained a higher level of education.

b. What is the point estimate of the difference between the means for the two populations?

c. Compute the p-value for the hypothesis test.

d. At α = .05, what is your conclusion?

### Practice 4 (Ref: Chapter 10 Question 40, Page 439)
Mutual funds are classified as load or no-load funds. Load funds require an investor to pay an initial fee based on a percentage of the amount invested in the fund. The no-load funds do not require this initial fee. Some financial advisors argue that the load mutual funds may be worth the extra fee because these funds provide a higher mean rate of return than the no-load mutual funds. A sample of 30 load mutual funds and a sample of 30 no-load mutual funds were selected. Data were collected on the annual return for the funds over a five-year period. The data are contained in the data set Mutual. The data for the first five load and first five no-load mutual funds are as follows.
```

```
a. Formulate H0 and Ha such that rejection of H0 leads to the conclusion that the load mu- tual funds have a higher mean annual return over the five-year period.

b. Use the 60 mutual funds in the data set Mutual to conduct the hypothesis test. What is the p-value? At α = .05, what is your conclusion?

## Self Learning and Extra Knowledge:

### A.) Learning more

It has many free online course about Hypothesis Testing. You can study in these course to more understand by learning with yourself.

- [Datacamp: Hypothesis Testing in R](https://www.datacamp.com/courses/hypothesis-testing-in-r)
- [Codecademy: Hypothesis Testing](https://www.codecademy.com/courses/learn-r/lessons/hypothesis-testing-r)
- [Datacamp: Mini case study in A/B Testing](https://www.datacamp.com/courses/ab-testing-in-r)
- [Thepexcel: Statistics with Excel](https://www.thepexcel.com/stats-06-hypothesis-testing/)

### B.) More Practice

- Ref:
  https://www.kaggle.com/herminegrigoryan/hypothesis-testing-visualization
