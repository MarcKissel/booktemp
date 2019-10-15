# Technical Details



## notes while working on book

currently trying different formats
used msmbstyle (https://github.com/grimbough/msmbstyle) by installing package via devtools::install_github("grimbough/msmbstyle")

## basic R stuff


### working with factors

If there is one thing we could emphaize it is to pay attention to the class of the cols in the datasets you import. Many errors creep in when R makes an assumption about the class that doesn't fit how you interpert the data.




One issue is factors

factors are categorical data. In the old days
R used to import any string as a factor. This caused some problems! Now, readr fixes this but we still need
to be aware of how factors work. 


> read https://peerj.com/preprints/3163/ and XXXX


The following code, taken mostly from http://www.ats.ucla.edu/stat/r/
modules/factor_variables.htm gives a workthough on what factors are and how to think about them.

TKAE THIS EXAMPLE AND CHANCE TO BONES

run the following code. Note how R thinks the temp object is numeric


```r
set.seed(100) #this sets the randomizer so if you run this code you get the same results i did
temp <- sample(0:1, 20, replace=T)
temp
```

```
##  [1] 0 0 1 0 0 0 1 0 1 0 1 1 0 0 1 1 0 0 0 1
```

```r
is.factor(temp)
```

```
## [1] FALSE
```

```r
is.numeric(temp)
```

```
## [1] TRUE
```

ok, so we now have a list of numbers. Remember that factors are categories. So, we are going to assign factors to these values useing the argument labels


```r
temp_f <- factor(temp, labels = c("femur", "tibia"))
temp_f #hey, that is kinda cool! lets check if it still numeric
```

```
##  [1] femur femur tibia femur femur femur tibia femur tibia femur tibia
## [12] tibia femur femur tibia tibia femur femur femur tibia
## Levels: femur tibia
```

```r
is.numeric(temp_f)
```

```
## [1] FALSE
```

```r
is.factor(temp_f) #sweet!
```

```
## [1] TRUE
```

> take a minute and think about what we just did. check out the strcuture of temp_f to see that it still has the intergers there.  techincally A factor is an integer vector that has a 'mapping' betwen the integers and categorical values that are stored as a level attributre. R displays  the values associated with the integers

now, what happens if we start with charachets rather than numbers:


```r
size <- c("small", "medium", "small", "small", "small", "small", "medium", "small",
"medium", "medium", "medium", "medium", "medium", "tall", "tall",
"small", "medium", "medium", "small", "tall")
is.factor(size)
```

```
## [1] FALSE
```

R doesn't think it is a factor. We have to tell it what's up


```r
size_f <- factor(size)
size_f
```

```
##  [1] small  medium small  small  small  small  medium small  medium medium
## [11] medium medium medium tall   tall   small  medium medium small  tall  
## Levels: medium small tall
```

when you print the object *size_f* note that at the bottom it tells you the levels:
"Levels: medium small tall"

> using the help, explore what levels are. in plain language write down what they are?

notice the order they are printed in: medium small tall. This is because it is alphabetical. R doesn't know that it makes more senset to list them like this "small, medium, tall." Again, we have to tell it!
 
there are a few ways to do this. the following is the base R way. the Tidyverse gives another way too


```r
size_f2 <- factor(size, levels=c("small", "medium", "tall"))
levels(size_f2) #woot!
```

```
## [1] "small"  "medium" "tall"
```


sometimes you might need to use ordinal data. For that we use ordered factors. Ordinal data is when we the order of the values matters, but we can't say how much of a difference there is between each. The data is ranked but the distance between categories isn't clear. So, if we are measuring something like job satisifaction
hard to say how much better 'very happy' is from 'happy'.


```r
size_ordered <- ordered(size, levels =c("small", "medium", "tall"))
size_ordered
```

```
##  [1] small  medium small  small  small  small  medium small  medium medium
## [11] medium medium medium tall   tall   small  medium medium small  tall  
## Levels: small < medium < tall
```

```r
table(size_ordered)
```

```
## size_ordered
##  small medium   tall 
##      8      9      3
```

note in size ordered  you see arrows in the levels




the last thing i want to mention is adding data. now,
you might think this is easier to do in excel
but remember that R has the plus of perserving
all you steps. Plus, this way you aren't messing with
the original data.


```r
size_f2[21] <- "very.tall"
```

```
## Warning in `[<-.factor`(`*tmp*`, 21, value = "very.tall"): invalid factor
## level, NA generated
```

> what do you think this error code means? what do you see when you print the object size_f2



```r
size_f2 <- factor(size_f2, levels = c(levels(size_f2), "very.tall")) 
size_f2[21] <- "very.tall"
```


ok, so this is a bit long. but levels is the same. We are cheating a bit by using the levels(size_f2) function to get the original levels from the list. As you get better w/ R you learn these little tricks to help. avoids making mistakes...


Lets say we want to remove a level:
This could become problem when making images since it may still show up even if we just remove it
first, we get rid of the elements we don't want


```r
size_f2_new <- size_f2[size_f2 != "very.tall"]
#then, we 'refactor' it
size_f2_new <- factor(size_f2_new)
size_f2_new
```

```
##  [1] small  medium small  small  small  small  medium small  medium medium
## [11] medium medium medium tall   tall   small  medium medium small  tall  
## Levels: small medium tall
```

### factors in the tidyverse

working in the tidyverse we can use the forcats package to make factors easier to work with.

EXAMPLES HERE


fct_reorder : reorder factors by another varialne/ very useufl/
fct_relevel : reorder factors manually

fct_expand
fct_infreq : reorders factors by the frequecny in which they appear. 
fct_recode: changes the levels
fct_colaps: collaps many lekvel into one
fct_lump: lumps least common lelves togehter...USEFUL for visulzaions

