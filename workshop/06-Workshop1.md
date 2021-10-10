# 06 Workshop I: Data Analysis with Descriptive Statistics

## Let's Exploratory Data Analysis (EDA)

1. Data Exploration (การสำรวจข้อมูล)
2. Data Transformation (การแปลงข้อมูล)
3. Data Analysis with Descriptive Statistics (การวิเคราะห์ข้อมูลโดยใช้สถิติเชิงพรรณนา)

## Instruction

1. Create folder named `WS01_studentid` with consist of 2 files ([Sample Output](https://github.com/sit-2021-int214/int214-template/tree/main/assignment))
   - R file named `WS01_63130500xxx.R` for your coding ([See sample file](https://raw.githubusercontent.com/sit-2021-int214/int214-template/main/assignment/WS01_studentId/WS01_studentId.R))
   - Markdown file named `WS01_63130500xxx.md` for writing description steps with your code and result ([Copy template files to your files](https://raw.githubusercontent.com/sit-2021-int214/int214-template/main/assignment/WS01_studentId/WS01_studentId.md))
2. Read information about SAT Scores dataset.
3. Explore the data and finding descriptive Statistics. (you can add more question from given question)
4. Push your folder `WS01_studentid` into your GIT group repository in folder assignment

## SAT Scores dataset

(This dataset is references dataset from [NYC Open Data](https://data.cityofnewyork.us/Education/2012-SAT-Results/f9bf-2cp4))

The most recent school level results for New York City on the SAT. Results are available at the school level for the graduating seniors of 2012. Records contain 2012 College-bound seniors mean SAT scores taken during SY 2012. In this dataset, some school didn't send avg scores and some has record wrong data.

**About SAT**

The SAT is a standardized test widely used for college admissions in the United States. This test divided into 3 parts. There are Critical Reading, Math, and Writing. (Ref: [Wikipedia](https://en.wikipedia.org/wiki/SAT)) Section scores are reported on a scale of 200 to 800. Total SAT score is in range of 600 to 2400. (ข้อสอบแบ่งออกเป็นสามส่วนโดยคะแนนแต่ละ ส่วนมีคะแนนเต็มอยู่ที่ 800 คะแนน และมีคะแนนต่ำสุดของแต่ละส่วนอยู่ที่ 200 คะแนนแม้ไม่ได้ทำก็ตาม โดยเมื่อรวมคะแนนทั้ง 3 ส่วนแล้วจะอยู่ที่ช่วง 600 ถึง 2400)

## Define a question

1. How many observation of this dataset (before cleaning) ?
2. Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
3. How many distinct school in this dataset ? (Know after drop duplicate data)
4. What is min, max, average, quartile of each part in SAT ?
5. What is min, max, average, quartile of total score in SAT ?
6. Which school is get highest SAT score ?

## Guideline Steps to do:

0. Loading dataset from [SAT_original.csv](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv) and assign variable named `sat_score`
1. Observe the data and answer the question:
   - How many observation before cleaning ?
   - List variable name
2. Changing the types of values
3. List duplicate data and count number of duplicate data.
4. Removing duplicate data and reassign value in `sat_score` variable
5. Check range value of each score by using `filter`
6. Handling out of range with NA value
7. Calculate total score and assign in `sum_score` column
8. Finding descriptive statistics

## Extra Knowledge (Optional)

### 1. Write CSV file

Try to save your clean data into CSV file
```
write_csv(sat_score,file = "SAT_clean.csv")
```

### 2. R Markdown files

R Markdown is a file format for making dynamic documents with R. An R Markdown document is written in markdown (an easy-to-write plain text format) and contains chunks of embedded R code, like the document below. (Read more:[rmarkdown](http://rmarkdown.rstudio.com))

- See [Sample Rmd Files](https://github.com/safesit23/INT214-Statistics/blob/main/files/SampleRDoc.Rmd)
- See [Sample HTML output](https://safesit23.github.io/INT214-Statistics/files/SampleRDoc.html)

**Try with yourself**

1. Create new file `R Markdown` named `WS01_studentid.Rmd`
2. Copy code from [Sample Rmd Files](https://github.com/safesit23/INT214-Statistics/blob/main/files/SampleRDoc.Rmd) to your file
3. Click button `Knit` to save in HTML (In same tabs of Run button)
4. Try to instead content with WS01_63130500xxx.md
5. Click button `Knit` to save in HTML files again
6. Open recented html file with browser

You will see that Rmd file can display output of your code. In this way, it not necessary to copy output into md file. You can use Rmd file instead to show output.

Study more: [Datacamp](https://www.datacamp.com/courses/reporting-with-rmarkdown)

### 3. GitHub Pages
In github, it cannot show output of Rmd file or HTML file. You can using [GitHub Pages](https://pages.github.com/) for hosting directly from your GitHub repository. Just edit, push, and your changes are live.

1. Go to setting of repository > Pages
2. Choose Source as 'Main' and then save (Setting Finished !)
3. Push your file to your repository
4. Link your HTML file to README.md