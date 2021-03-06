# 01 Introduction to R
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
### 1.1. How can we get folder path (Step 2)
#### for macOS:
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
#### for windows:
1. Open File Explorer and go to your folder
2. Right click at navigate and copy your address [(or use another ways)](https://www.top-password.com/blog/tag/how-to-find-file-path-windows-10/)
3. Put in command `setwd()` and change `\` to `/`     ***If not change it will Error
```
# When you get path from address: 
# C:\Users\safe\Desktop\R-INT214

# When using in R
setwd("C:/Users/safe/Desktop/R-INT214")
```

### 1.2. Create file and list file (Step 3)
Create file `test.txt` in your folder then go to console in R Studio and using `dir()` to list all files in working directory
#### for macos:
Open Terminal app (make sure that you are right working directory by using `pwd` to check) try to create new file by using command `touch test.txt` to create blank file
#### for windows:
Right click on your folder select `New > Text Document` then save it to folder.



## Easy way to set Directory:
Setting default working directory by use menu `Session > Set working directory > Choose...`


## 2. Basic Tools
Try to run this in console...
```{r}
#comment
1+1
# formula
2*100 - 5
# Print function
print("Hello")
```

## 3. Run Script
3.1. Create Script file and save `1-MyScript.R`

3.2. copy code in Topic 2 and paste in script file.

3.3. Run Script
- `Command+Enter` Run the current line or selection
- `Command+option+R` Run all
- `Ctrl+L` Clear console

## 4. Basic Operation
We can create variable by using `<-` it mean assign value (right) to variable (left)
```
# create variable
x <- 1
y <- 2
x+y
print(x + y)
z <- x+y
z
```

## Notes
```
# Directory
getwd()
setwd()

# Help Function
?
help()
```
