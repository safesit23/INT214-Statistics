# 01 Basic R
## 0. Installation and Setting Up
- Install R from https://cran.rstudio.com/
- Download RStudio Desktop from https://rstudio.com/products/rstudio/download/#download

### Setting preference (Optional)
You can set appearance and pane layout in Menu `Tools > Global Options...`

In R Studio compose of 4 Pane:
  1. Source: for script file
  2. Concole: for watch result from running
  3. Environment: show variable that you have assign
  4. Files, Plots, Packages, Help: show other information


## 1. Setup Directory
In this part you need to get and set working directory of program RStudio Desktop. It has 3 Step
- Step 1: Get working directory by using `getwd()`
- Step 2: Create new folder then set working directory to this folder by using `setwd("path")`
- Step 3: Try to add some file then check it that you are setting directory right.
````
#Get Working Directory
getwd()

#Set Working Directory
setwd("path")

#List the Files in a Directory/Folder
dir()
````
### Step 2: How can we get folder path
#### macOS:
open terminal app and then go to your folder with `cd` then using command `pwd` to print working directory
```
#Terminal App (Sample)
jatawatsafe@Safe-MBP ~ % pwd
/Users/jatawatsafe

jatawatsafe@Safe-MBP ~ % ls
Desktop			Library			Postman

jatawatsafe@Safe-MBP ~ % cd Desktop/R-214 

jatawatsafe@Safe-MBP R-214 % pwd
/Users/jatawatsafe/Desktop/R-214

# Back to R and put this path in setwd()
setwd("/Users/jatawatsafe/Desktop/R-214")
```
```
#Linux command in Terminal
ls                               #List file
cd  folderName/folderName        #Change directory
pwd                              #Print Working Directory
```
#### windows:
1. Open File Explorer and go to your folder
2. Right click at navigate and copy your address [(or use another ways)](https://www.top-password.com/blog/tag/how-to-find-file-path-windows-10/)
3. Put in command `setwd()` and change `\` to `/`     ***If not change it will Error
```
#When you get path from address
# C:\Users\safe\Desktop\R-INT214

setwd("C:/Users/safe/Desktop/R-INT214")
```

### Step 3: How can we create file
1. Create file `test.txt` in your folder
#### macos:
Open Terminal app (make sure that you are right working directory by using `pwd` to check) try to create new file by using command `touch test.txt` to create blank file
#### windows:
Right click on your folder select `New > Text Document` then save it to folder.

2. Go to console in R Studio use `dir()` to list all files in working directory

### Easy way:
Setting default working directory by use menu `Session > Set working directory > Choose...`

## 2. Basic Tools
```
#comment
1+1
# formula
2*100 - 5
# Print function
print("Hello")
```

## 3. Run Script
- `Command+Enter` Run the current line or selection
- `Command+option+R` Run all
- `Ctrl+L` Clear console

## 4. Basic Operation
```
# create variable
x <- 1
y <- 2
x+y
print(x + y)
z <- x+y
z
```

## 5. Data Types
There are 3 types: numeric, logical, character
```
# Numeric
varA <- 100
class(varA)
# Logical: TRUE, FALSE
varB <- TRUE
class(varB)
class(1==2)

varC <- "Hello, My name is Safe"
class(varC)
```

## Notes
```
# Directory
getwd()
setwd()

# Help Function
?
help()

# check data types
class()
```
