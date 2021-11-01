# 08 Hypothesis Testing

## Agenda
- Random Sample Data

## 0. Prerequisites

1. Open progress form [Class 07](https://forms.gle/GbotmGNTwwa2yf3w7) and checked on Study Check-In
2. Open R Studio Desktop and setting working directory
3. Create Script file name `07_63130500xxx.R` and save in your working directory
4. Checked on 0 prerequisite in progress form

## 1. Sample and Population



## 2. Hypothesis testing

### Exercise 1 (Ref: Chapter 9 Page 356)

The Federal Trade Commission (FTC) periodically conducts statistical studies designed to test the claims that manufacturers make about their products. For example, the label on a large can of Hilltop Coffee states that the can contains 3 pounds of coffee. Thus, the FTC interprets the label information on a large can of coffee as a claim by Hilltop that the population mean filling weight is at least 3 pounds per can. The director of the FTC’s testing program willing to risk a 1% chance of making such an error. Suppose a sample of 36 cans of coffee is selected and the population standard deviation can be assumed known with a value of σ = 0.18. Is x̄ =  2.92 pounds small enough to cause us to reject H0 ?

Assign variables
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


### Exercise 2



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
