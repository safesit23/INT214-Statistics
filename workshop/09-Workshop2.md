# 09 Workshop II

## Outlines

- Get the data from Database by using SQL
- Working with Rmd file
- Publishing your own portfolio website with Github Pages

## 0. Prerequisites
1. Open progress form [Class 08](https://forms.gle/8C188D1uRwZUozxu5) and checked on Study Check-In
2. Open R Studio Desktop and install package `rmarkdown`
3. Checked on 0 prerequisite in progress form

## 1. Preparing Repository with `GitHub fork`
A fork is a copy of a repository. Forking a repository allows you to freely experiment with changes without affecting the original project. [Ref: Fork a repo](https://docs.github.com/en/get-started/quickstart/fork-a-repo)

### Let's fork repository
1. On GitHub.com, navigate to the [int214-workshop](https://github.com/sit-2021-int214/int214-workshop) repository.
2. In the top-right corner of the page, click Fork.

![image](https://docs.github.com/assets/images/help/repository/fork_button.jpg)

3. Cloning your forked repository for access this repository locally on your computer. [(Guideline: Cloning)](https://docs.github.com/en/get-started/quickstart/fork-a-repo#cloning-your-forked-repository)

Now, you will have own repository and you can access file on your computer


## 2.) Get the data from Database by using SQL
In this part we will using knowledge about SQL to get data from database. We using **sqliteonline**  which is User-friendly interface for data science to connect the database. I have provide `database_int214.db` which is mockup database file to do this step. You can see this file in your repository.

1. Go to URL: https://sqliteonline.com/
2. Load DB: File > Open DB
3. Let's try to use sql command to explore dataset in database
4. Export to csv named `db_int214` which set the first line is column name then saved to your folder.

## 3.) Working with Rmd file
R Markdown is a file format for making dynamic documents with R. An R Markdown document is written in markdown (an easy-to-write plain text format) and contains chunks of embedded R code. [Ref: Rmd](https://rmarkdown.rstudio.com/articles_intro.html) We can using Rmd to make a report.

```
install.packages("rmarkdown")
```

### 3.1. Let's try Rmd file !

1. Open R Studio desktop and **setting working directory** to your repository folder.
2. Open file `index.Rmd` in your repository folder
3. Click run all and see result

### 3.2. Transform an R Markdown file to HTML file

Click button `Knit` in R Studio Desktop to save in HTML file

## 4.) Publishing your own portfolio website with Github Pages
GitHub Pages is a static site hosting service that takes HTML, CSS, and JavaScript files straight from a repository on GitHub, optionally runs the files through a build process, and publishes a website. [(Ref: GitHub Pages)](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages). We will using Github Pages to publish the website from previous step.

> Tip: If `index.html` is present, this will be used instead of `index.md`. If neither `index.html` nor `index.md` are present, `README.md` will be used. [(Ref)](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site)

### Creating a GitHub Pages site
0. Commit and push file `index.html` to your repository
1. On GitHub.com, navigate to your repository.
2. Under your repository name, click Settings.
3. In the left sidebar, click Pages.
4. Under "GitHub Pages", use the None or Branch drop-down menu and select a publishing source.
5. Optionally, use the drop-down menu to select a folder for your publishing source.
6. Click Save.
7. Waiting and see the result. (If your Github Pages site is not detecting index.html you can concatenate `/index.html` at the end of your web url)

> See Instruction with Image at: [GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)