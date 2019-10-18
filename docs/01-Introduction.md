# Introduction

*An Introduction to Statistical Software*


 
Unit Questions: 

1. Why Use R? (R versus Excel)

2. What is the role of statistics in Anthropology? 

3. How do you formulate statistical questions? 

4. How do you download the program?
 
 
R is an interactive statistical program that assists in the organization and analysis of data. R is a language that exists within an environment. The word environment is associated with the R software in that R allows the user to run linear models, nonlinear regressions, time series analysis, parametric tests, etc. within an open network. The R environment is a “planned and coherent system, rather than an incremental accretion of a very specific and inflexible tools, as is frequently the case with other data analysis software.” (cran.r-project.org). 
 
R differs from **Excel** in that it technically is a more user-friendly program [see chpt XXX on spreadsheets] . While Excel may appear to be an easier software to use, if a mistake or problem occurs in Excel, it can be very hard to find the origin of the issue and correct it. R does have a learning curve and it can be intimidating, but it can be a really amazing data tool once the basics are understood. R can do everything that excel does and more. Since many people prefer to use Excel, many of the data files that you will use and upload into R will be stored in an unreadable format. In order to upload an Excel file into R, you need to save the Excel file as a csv. There are packages that allow you to *read in* an Excel file as well. 
 
The word “code” refers to the text used in computer programming language which is called the source code. Metadata is the data about data, it contains analytical descriptions about the original data.
(explain base R verses Tidy Verse)
 
There are multiple packages available for download within R. These include base R, compiler, datasets, grDevices, graphics, graid, methods, parallel, splines, stats, stats4, tcltk, tools, utils. 
 
Most of readR’s functions are concerned with turning flat files into data frames. The command read_csv( ) creates a pathway by which a file is able to be transferred and read within the R environment. 
 
It is important to note that everything within R is an object. Everything object within R is either a call, an expression, a name or a null. 
 
There is a lot of available information on how to use R but filtering through online search results can be a challenge. Almost all of your questions can be answered by a google search and there are many online forums where R experts discuss the problems that they have had with R. 
 
If posed with a problem, try not to think big as it is likely that there is a singular small problem causing your issue. 

As we learned R we found ourselves struggling a lot. Don’t think that you are alone. 



## Ok, how do i get R?



### install R and R Studio

- https://cloud.r-project.org, (this shld make most of the install automatic)

note: I have multiple verions of R on computer. sometimes useful for packages that don't work w/ certain versions 

install R studio here: http://www.rstudio.com/download.
- get the free version

##  R Studio

R studio is an integrated development environment (IDE) for R that makes it easier to work with R.

It also does a lot of other things, likes let you [build websites](https://marckissel.netlify.com), create documents, and makes slides all with embeded stats and visualizations  

There are different panels. 
  + the source - this is where we we write most of our code. R  Studio allows for all sorts of tips and tricks here. That is one of the reasons we use this and not R itself
  + The console - this is where the R code is run. all lines in the console start with a '>'. You can send stuff from the source to the console in a few ways. this is  what R looks like without R studo
  
  lets look at what we can do in the panel 
    - hit up to do histor
    - text then ctrl up 
    - tab completion 
  
  + the history - shows what has been run
  + the Enviornment 
  + plots
  + and many others that become useful over time...

> Examine each of these and think about what they do?

### lets look around...

1. it should open and see panels
2. if you go to profile -> Global options can see all kinds of stuff
  - take a look at what is there
3. general layout of the program....what each pane is and how it works
4. where is R looking for stuff? 



## R projects

Probably the best thing you can do is learn to think in terms of **projects**. When we make a project we create a self-contained unit

**This helps us with a key feature - reproducibility**

If you have ever used Excel  you may have made a chart. But can you remake that chart? not always easy. In R since everything is written down it is super easy to update/fix/edit things on the fly. This is a happy thing, especially if you want to ever publish something


## Short overview of how R works

One way that i think about R that helps me to work it is to remember that everything in R is an "object." What this means is that in R we make objects (or we assign values to objects) and then do things to these objects. 
for example check out the code below



```r
a <- 4
```

what this says is that we are going to create the object 'a' and then assign the value '4' to it. if you run the code in R Studio you will see that the 'environment'  panel now lists 'a' and gives its value. 



### Incomplete Code

If you mess up (e.g. leave off a parenthesis), R might show a `+` sign prompting you to finish the command:


```r
> (11+17-8
+
```

Finish the command or hit `Esc` to get out of this.



>look at these fucntions and think about what they will do before running them..
>LIST HERE


2. some data analysis (http://datacarpentry.org/semester-biology/assignments/r-intro/)
use the bird banding example maybe but turn it into an archy example


take a dataset and import it into R. then do something to it. use my example above as a start

## lets practice


```r
#library(ggnet)
```


1. start R and open the project folder
2. open a new R script and title it LASTNAME_FIRSTNAME_HW1
3. follow along with the info below. when it is time to do the excersie simply type in the Source and then run the command. This way you have a easy way to keep track of what you did

to keep track of where you are, use # to make a comment like this


```r
# question 1
5 + 3
```

```
## [1] 8
```


4. make sure to save your file often
5. when you reach the end, save the file  again!


note: some of this comes from datacamp and other sources


#### Running Code

The first thing we want to do is to learn how to run something in R. take a look at the code below:


```r
6 + 7
```

```
## [1] 13
```

the part in grey is the code that is entered into R. If you copy that over to your R console and hit enter you should see the answer

> a. how can you send a command from the Source pane to the Console Pane?



#### Basic math

Now lets learn how to do basic math. Using whatever sources you can think of, figure out how to add, subtract, divide, multiply, take an exponent (i.e. square a number), get the square root. In other words, lets learn how to take an expensive computer and turn it into a $10 calculator 

>solve the following using R

>a. 3-4
b. 7 divided by 10
c. 6 times 89
d. 8 rasied to the 7th power
e. the square root of 52


#### Assigning variables:

One of the key things you will do is assign a value to an object.

To do this we use this symbol <-. 


```r
x <- 42
```

Read the above like: "assign the value of 42 to the object x." or "x gets the value 42."



**to store more than one element in an object we need to remember a trick**

if you want to make a series of numbers, characters, whatever, you need to use a special sequence. to do this, we must combine the values we want to assign with the c function, which combines values into a vector or list



```r
my_list <- c(1,2,3,4,5)
my_list_2 <- c("my_name", "my_address", "my_number")
```


>a. How would you create a variable y and assign it the value 334
b. How you you add the x and y together to get the sum of the to numbers?
c. How would you create a new varibale (x) that stores the result of x +y
d. Now, change the value of x to be 500 and see what happens when you add x + y together? if you ask for the value of x now what do you get? why?
e. What are the rules for what the name of an object in R can be?


#### Types  of data

Whe you assign a value to a variable, it is given a specific *class*. the class is VERY important and is probably the #1 reason for having troubles with R.
The way in which you can interact with the object is based on the class of the object. The class of the object is assigned by R based on what it thinks the object is supposed to be



it is always good to check the class of an object. to do this, we can use a specific *function* in R called class

class types: (note: maybe make a table?)
1. intergers - 'natural numbers': 5, 6, 987
2. numerics - decimal numbers: 4.5, 8.76666
3. characters - text (sometimes called strings): "hello", "goodbye"
4. logical - boolean: True or False
5. factors - categorical data. This is  different from characters because factors are given numbers (or *levels*) that are assocated with that factor and then used for analysis.....we will come back to this later

ADD LINK TO FACTOR SECTION 



```r
a <- 4
b <- "my name"
c <- FALSE
d <- c(1,2,3.0,4)
```



```r
class(a)
```

```
## [1] "numeric"
```

```r
class(b)
```

```
## [1] "character"
```

```r
class(c)
```

```
## [1] "logical"
```

```r
class(d)
```

```
## [1] "numeric"
```




```r
x <- 42
class(x)
```

```
## [1] "numeric"
```

Note that the class of X here is numeric rather than an interger (which might not be want you expected). why? well, it has to do with some inside stuff on computer languages but in general R is going to store everything as numeric unless you tell it differently. In order to make  it be an interger we need to use a trick, which is to add the suffix L to the number


```r
xx <- 42L
is.integer(xx)
```

```
## [1] TRUE
```



>a. assign my_value to be "hello". then check its class
b. you can also ask R directly if something is a specific type. 


```r
my_value <- 1+ 3
is.numeric(my_value)
```

```
## [1] TRUE
```

```r
my_name <- "Marc Kissel"
is.numeric(my_name)
```

```
## [1] FALSE
```

```r
is.character(my_name) #and how!
```

```
## [1] TRUE
```


>a. below is some R code. guess what each type of object will be and then use R to find the answer



```r
a <- 1.333
b <- TRUE
c <-  "my name is"
d <- Sys.Date() # tricky
```

**remember: A class defines what kinds of operations can be implemented on an object & how a function will return a value.** 

It is important to keep track of the classes of your objects. Class mistakes are probably the most common kind of problem in R

#### What's your vector, Victor?

so far we have only stored one value into an object. but most of the time we are going to have to work with a lot of data. say you have a series of numbers and want to add 7 to each of them. it would be a pain to have to do that manually. we can use  r to store a series of vaules (called a *vector*)


```r
my_vector <- c(1,2,3,4,5)
my_new_vector <- c(6,7,8,9,10)
```



let's say you are doing some research and want to record the biological sex of the skeltons in your study. after analyzing them you decide that this is the correct designation

male
male
female
male
female
female
female

>a. make a new object called **my_study** and make it a vector of the recorded biological sex
b. print the object to R




congrats! you now have a *vector*! 

lets say you want to figure out how what the sex of the 5th skeleton is. you could print the object and count, but that takes time and an get difficult. R makes things easier for people like me who are lazy and what the computer to do it all.

to get an *element* from a list we  use square brackets


```r
my_study[2]
```

```
##    two 
## "male"
```


>c. how would you get the sex of the third skeleton?
>d. can you figure out how, in one line of code, to get the sex of the 1st and 4th skeleton?


Ok, but it is kinda confusing what these stand for. you know that they are skeletons 1-7, but maybe someone else doesn't. We can assign names to objects  using a special function called *names*


```r
names(my_study) <- c("one", "two", "three", "four", "five", "six", "seven")
```

>d. print my_study now and see how it differs.

Note: now that they have names we can also get the values that way


```r
my_study[2]
```

```
##    two 
## "male"
```

```r
my_study["two"]
```

```
##    two 
## "male"
```

```r
#these are the same

my_study[2] == my_study["two"] # the '==' asks R to tell you if the value on the left and the value on the right are the same....
```

```
##  two 
## TRUE
```


to be fair, most of the time there are easier ways to name things, but having a basic understanding of how R works helps a lot

#### Matrices

A vector is simply a list of numbers
A matrix is  a **rectangular** array of numbers


```r
cx1980 <- c(7, 13, 8, 13, 5, 35, 9)
cx1988 <- c(9, 11, 15, 8, 9, 38, 0)
chimp <- cbind(cx1980, cx1988) # cbind binds the vectors together a columns
class(chimp)
```

```
## [1] "matrix"
```

```r
chimp
```

```
##      cx1980 cx1988
## [1,]      7      9
## [2,]     13     11
## [3,]      8     15
## [4,]     13      8
## [5,]      5      9
## [6,]     35     38
## [7,]      9      0
```


One thing you want to learn is how to read a matrix and identify elements. Lets say you want to get a vector of just the ages from 1980. we can use the square brackets again but need to know a trick. 




```r
chimp[1,] #note the comma
```

```
## cx1980 cx1988 
##      7      9
```

```r
chimp[,1]
```

```
## [1]  7 13  8 13  5 35  9
```

```r
#putting the number before the comma gets us the row. putting it after the comma gets column. 
#one way to remeber that Rows come first is the menominc Railway Cars
chimp[3,2] # third row, second column
```

```
## cx1988 
##     15
```


>a. how would you make a matrix by row rather than column (use google if need be)
b. There are others ways to make a matirx
look at the code below and figure out how it works


```r
freq <- c(32,11,10,3,  38,50,25,15,  10,10,7,7,  3,30,5,8)
hair <- c("Black", "Brown", "Red", "Blond")
eyes <- c("Brown", "Blue", "Hazel", "Green")
freqmat <- matrix(freq, nr=4, nc=4, byrow=TRUE)
dimnames(freqmat)[[1]] <- hair
dimnames(freqmat)[[2]] <- eyes
freqmat
```

```
##       Brown Blue Hazel Green
## Black    32   11    10     3
## Brown    38   50    25    15
## Red      10   10     7     7
## Blond     3   30     5     8
```


> Now, create your own matrix with madeup data...


#### Dataframes

A dataframe stores data! it can hold different kinds of varibales/classes so it is different from a matrix. You cna think of it as a list of varibales that are all the same length. Data frames are probably the most common way we will work with R



```r
bone <- c("humerus", "radius", "ulna", "femur", "tibia", "fibula")
size_inches <- c(14.4, 10.4, 11.1, 19.9, 16.9, 15.9)
injury <- sample(c("yes","no"),6,replace=TRUE)
sample_letter <- LETTERS[1:6]
my_sample <- data.frame(bone, size_inches, injury, sample_letter)
my_sample
```

```
##      bone size_inches injury sample_letter
## 1 humerus        14.4    yes             A
## 2  radius        10.4     no             B
## 3    ulna        11.1     no             C
## 4   femur        19.9     no             D
## 5   tibia        16.9    yes             E
## 6  fibula        15.9     no             F
```

If you use the function *View* you can see a spreadsheet of the data frame you just made


```r
View(my_sample)
```

you can view a specifc column/vector using the $


```r
my_sample$bone
```

```
## [1] humerus radius  ulna    femur   tibia   fibula 
## Levels: femur fibula humerus radius tibia ulna
```



>a.run the code below. it should show an error. Why? rewrite the code so it works!

NOTE: make this appear but not run?


```r
#num <- c(1,2,3,4,5)
#food <- c("bread", "butter", "milk", "cheese","coffee", "tea")
#quantity <-  c(1,1,3,5,7,1)
#shopping <- data.frame(num, food, quantity)
```

>b. what is the class type of the different vectors in the my_sample  dataframe?

#### Comparing values

Often times we are going to want to compare things. 

>a. run the code below


```r
a <- 5
b <- 9
c <- 7
d <- sqrt(49)
```

>Now,  figure out how to have R evaluate the following:
- is a bigger than b?
- is c equal to d (careful with this one..)
- is c less than or equal to b?

>b. make a new vector called *temp* with the values of 1,5,7,9,11,14,6,8. then write a single line of code that evalautes if 3 is greater than each of the values in the vector

>c. how would you ask R if the 5th value in  *temp* is larger than 5?
