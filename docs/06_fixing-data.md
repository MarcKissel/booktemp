# Working with data

NEEDS A LOT OF EDITS

How do we manipulate the data to tell a story


1. How to get data from your collaborators  into a format for R...
2. how to organize data 
3.how to explore data


As we talked about in the previous chapter, most data live in spreadsheets.


## Tidy data
[maybe talk about this in the spreadsheet chpt?]

Data transformation is the key to R. we are going to take data in from a worksheet/csv/whatever and transform it.

There are a number of ways to do this. One  method that gives us many options is using a package called *dplyr.* This is part of a larger group of packages known as the *Tidyverse.*


## examples

- data i used from NSF 
- use data from the primate database
- a few from Tidytuesday so they are introduced to that
- another anthro dataset


## getting data into R

While it has gotten easier over the years to do this, one of the major struggles first-time R users (and seasoned professionals) have is getting data from a file into R. In this section we give a few different methods of doing this. 

examples:
read.csv and read_csv
using the 'import dataset' button
read_xl
datapasta
etc..




### reading in a CSV file

if you are lucky the data sent to you is in a CSV file  (see chpt 5 \@ref(Working with Spreadsheets)) for tips on what to do if this is not the case).

There are XXX ways to do this

#### read.csv vs read_csv vs fread (from data.table)



These are very similar functions. The read.csv is part of base R whil read_csv is from the Tidyverse. Most of the differences between the two functions aren't really useful for us (see XXXX for details) but there are two things to mention. One is that unlike read.csv, read_csv doesn't automatically imports strings as factors. This might be useful since the assumption that strings should be factors has a bit of history attached to it ![](https://simplystatistics.org/2015/07/24/stringsasfactors-an-unauthorized-biography/). Moreover, read_csv seems to do a better job of 'guessing' the type of data in each column. It parses  the cols and puts them in the data type that it guesses they should be in


read_csv also tells you what it parsed each col as.

fread has the nice output that it tells you had big the file is

read_csv will import the data as a tibble vs as a dataframe so keep that in mind. It is also faster than read.csv, while fread seems to be the fastest overall 

As with anything, people disagree about this. honestly you caa get bogged down in this or just pick one and learn that one. and if you need a different method know it exists.

also, keep in mind that there are other types of data you can read in with these. 

examples:



```r
library(tidyverse)
```

```
## Warning: package 'tidyverse' was built under R version 3.5.3
```

```
## -- Attaching packages ----------------------------------------------------- tidyverse 1.2.1 --
```

```
## v ggplot2 3.1.0     v purrr   0.3.2
## v tibble  2.1.3     v dplyr   0.8.1
## v tidyr   0.8.3     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.3.0
```

```
## Warning: package 'ggplot2' was built under R version 3.5.2
```

```
## Warning: package 'tibble' was built under R version 3.5.3
```

```
## Warning: package 'tidyr' was built under R version 3.5.3
```

```
## Warning: package 'readr' was built under R version 3.5.2
```

```
## Warning: package 'purrr' was built under R version 3.5.3
```

```
## Warning: package 'dplyr' was built under R version 3.5.3
```

```
## Warning: package 'stringr' was built under R version 3.5.2
```

```
## -- Conflicts -------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(data.table)
```

```
## 
## Attaching package: 'data.table'
```

```
## The following objects are masked from 'package:dplyr':
## 
##     between, first, last
```

```
## The following object is masked from 'package:purrr':
## 
##     transpose
```

```r
body_mass_base <- read.csv("https://zenodo.org/record/2600338/files/BodyMass.csv")

body_mass_tidy <- read_csv("https://zenodo.org/record/2600338/files/BodyMass.csv")
```

```
## Parsed with column specification:
## cols(
##   Family = col_character(),
##   Genus = col_character(),
##   CommonName = col_character(),
##   Species = col_character(),
##   `Species (ITIS)` = col_character(),
##   BodyMass_kg = col_double(),
##   BodyMassMale_kg = col_double(),
##   BodyMassFemale_kg = col_double(),
##   Refs1 = col_character()
## )
```

```r
body_mass_datatable <- fread("https://zenodo.org/record/2600338/files/BodyMass.csv")
```


> look at each of the objects imported above. compare them with str function. What differences do you see? 

If you are using Rstudio there is another way to do this. if you look at the enviotnment pane you will see an 'import dataset' button (next to the little broom). clicking that gives you a point-and-click interface that will generate the function calls to read in various datasets

> using the button play around with the various options in readr and see what you can find out. HOw can you change the way readr parses a speicfic col? 


### reading in a Excel file

How to import/ a dataset from Excel into R:
I. Open Excel data 
a.  File/ Save As/ Name/ *Before clicking save, make sure to change the file format to Comma Delimited Text and better set the directory to My Documents folder, for Windows
b. When Saved, this file will have a name Data.csv. 
II   Now Open R and run 
a.     MyRData <- read.csv(“Data.csv”, header = TRUE) 
                                               i.     The argument header= TRUE tells R that the first row of the data labels of every column 
1.   If set to FALSE then the first row of the data are not labels but are considered as data points
b.    If data is saved in Text (.txt) format, use the read.table function
                                               i.     Run 
  MyRData2 <- read.table(“Data1.text”, header = TRUE) 

read_xl





### Datapasta



### cleaning the data once it is in R

sometimes the col heads are messy. the wonderful janitor package comes in useful here



```r
home_range <- read_csv("https://zenodo.org/record/2600338/files/HomeRange.csv")
```

```
## Parsed with column specification:
## cols(
##   Family = col_character(),
##   Genus = col_character(),
##   CommonName = col_character(),
##   Species = col_character(),
##   `Species (ITIS)` = col_character(),
##   HomeRange_ha = col_double(),
##   Low_range = col_character(),
##   High_range = col_character(),
##   N_groups = col_character(),
##   Mean_individuals = col_character(),
##   Method = col_character(),
##   Alternative_HomeRange_ha = col_character(),
##   Alternative_HomeRange_method = col_character(),
##   Study_duration_months = col_character(),
##   Refs = col_double()
## )
```

```r
home_range_clean <- janitor::clean_names(home_range)
```

> How does home_range differ from home_range_clean? look at the online help for the Janitor package and figure out what other functions it has? how would you find duplicate rows of data? 





## You got the data into R, now what?

Once you get data into R the question becomes what to do with it. 
EDA 
when doing EDA we need to be careful. as you 'explore' data you are also affecting your view of it. for example as we look at the dataset we may play around and start to see patterns. these patterns might be there because we choose to look for patterns and not becuse they are real..good practice is to take a 'training set' of your data and explore that.
Or use a dataset that you aren't studying to learn

## lets look at the primate dataset

This comes from XXXXXX

### viewing the data


```r
home_range <- read_csv("https://zenodo.org/record/2600338/files/HomeRange.csv")
```

```
## Parsed with column specification:
## cols(
##   Family = col_character(),
##   Genus = col_character(),
##   CommonName = col_character(),
##   Species = col_character(),
##   `Species (ITIS)` = col_character(),
##   HomeRange_ha = col_double(),
##   Low_range = col_character(),
##   High_range = col_character(),
##   N_groups = col_character(),
##   Mean_individuals = col_character(),
##   Method = col_character(),
##   Alternative_HomeRange_ha = col_character(),
##   Alternative_HomeRange_method = col_character(),
##   Study_duration_months = col_character(),
##   Refs = col_double()
## )
```

we can explore the data that is in R with different functions.

just enter the name of the object spits out some info


```r
home_range
```

```
## # A tibble: 748 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Alle~ Allen_s_S~ Alleno~ Allenopithecus_~        NA    <NA>     
##  2 Cheir~ Allo~ Hairy_ear~ Alloce~ Allocebus_trich~        25.8  16       
##  3 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~       117.   NI       
##  4 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~        61.3  51.81    
##  5 Cerco~ Allo~ Preuss_s_~ Alloch~ Allochrocebus_p~        NA    <NA>     
##  6 Cerco~ Allo~ Sun_taile~ Alloch~ Allochrocebus_s~        NA    <NA>     
##  7 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~         7.52 NI       
##  8 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~        14.5  4        
##  9 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~         5.5  4        
## 10 Ateli~ Alou~ Red_hande~ Alouat~ Alouatta_belzeb~         7.12 4.75     
## # ... with 738 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```

```r
print(home_range)
```

```
## # A tibble: 748 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Alle~ Allen_s_S~ Alleno~ Allenopithecus_~        NA    <NA>     
##  2 Cheir~ Allo~ Hairy_ear~ Alloce~ Allocebus_trich~        25.8  16       
##  3 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~       117.   NI       
##  4 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~        61.3  51.81    
##  5 Cerco~ Allo~ Preuss_s_~ Alloch~ Allochrocebus_p~        NA    <NA>     
##  6 Cerco~ Allo~ Sun_taile~ Alloch~ Allochrocebus_s~        NA    <NA>     
##  7 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~         7.52 NI       
##  8 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~        14.5  4        
##  9 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~         5.5  4        
## 10 Ateli~ Alou~ Red_hande~ Alouat~ Alouatta_belzeb~         7.12 4.75     
## # ... with 738 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```

notes a couple of things about the output in the console.

1. it might not all fit on the screen
2. if you scroll to the top you see that it is a 'tibble' that is 748 x 15. This means there are 748 rows and 15 columns

FIND ANOTHER DATASET
> how many observatiosn are ther
> How many variables? 
 
If you want to see just the first few rows use head


```r
head(home_range)
```

```
## # A tibble: 6 x 15
##   Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##   <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
## 1 Cerco~ Alle~ Allen_s_S~ Alleno~ Allenopithecus_~         NA   <NA>     
## 2 Cheir~ Allo~ Hairy_ear~ Alloce~ Allocebus_trich~         25.8 16       
## 3 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~        117.  NI       
## 4 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~         61.3 51.81    
## 5 Cerco~ Allo~ Preuss_s_~ Alloch~ Allochrocebus_p~         NA   <NA>     
## 6 Cerco~ Allo~ Sun_taile~ Alloch~ Allochrocebus_s~         NA   <NA>     
## # ... with 8 more variables: High_range <chr>, N_groups <chr>,
## #   Mean_individuals <chr>, Method <chr>, Alternative_HomeRange_ha <chr>,
## #   Alternative_HomeRange_method <chr>, Study_duration_months <chr>,
## #   Refs <dbl>
```

```r
tail(home_range)
```

```
## # A tibble: 6 x 15
##   Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##   <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
## 1 Cerco~ Trac~ Selangor_~ Trachy~ Trachypithecus_~         31.5 NI       
## 2 Cerco~ Trac~ Shortridg~ Trachy~ Trachypithecus_~         NA   <NA>     
## 3 Lemur~ Vare~ Red_Ruffe~ Vareci~ Varecia_rubra            24.6 23.3     
## 4 Lemur~ Vare~ Red_Ruffe~ Vareci~ Varecia_rubra            10.5 5.42     
## 5 Lemur~ Vare~ Black_and~ Vareci~ Varecia_variega~        117.  100      
## 6 Lemur~ Vare~ Black_and~ Vareci~ Varecia_variega~        139   NI       
## # ... with 8 more variables: High_range <chr>, N_groups <chr>,
## #   Mean_individuals <chr>, Method <chr>, Alternative_HomeRange_ha <chr>,
## #   Alternative_HomeRange_method <chr>, Study_duration_months <chr>,
## #   Refs <dbl>
```

You can also use the built-in dataviwer with the View function. this makes a spreadsheet that you can quickly explore


```r
View(home_range)
```

finally, if the data is a tibble you can use glimpse


```r
glimpse(home_range)
```

```
## Observations: 748
## Variables: 15
## $ Family                       <chr> "Cercopithecidae", "Cheirogaleida...
## $ Genus                        <chr> "Allenopithecus", "Allocebus", "A...
## $ CommonName                   <chr> "Allen_s_Swamp_Monkey", "Hairy_ea...
## $ Species                      <chr> "Allenopithecus_nigroviridis", "A...
## $ `Species (ITIS)`             <chr> "Allenopithecus_nigroviridis", "A...
## $ HomeRange_ha                 <dbl> NA, 25.750, 116.600, 61.325, NA, ...
## $ Low_range                    <chr> NA, "16", "NI", "51.81", NA, NA, ...
## $ High_range                   <chr> NA, "35.5", "NI", "70.84", NA, NA...
## $ N_groups                     <chr> NA, "2", "NI", "2", NA, NA, "NI",...
## $ Mean_individuals             <chr> NA, "3", "NI", "27", NA, NA, "NI"...
## $ Method                       <chr> NA, "Minimum convex polygon", "NI...
## $ Alternative_HomeRange_ha     <chr> NA, "10.4", "NI", "75.5", NA, NA,...
## $ Alternative_HomeRange_method <chr> NA, "Kernel density estimators", ...
## $ Study_duration_months        <chr> NA, "8", "NI", "11", NA, NA, "NI"...
## $ Refs                         <dbl> NA, 373, 1174, 245, NA, NA, 381, ...
```

>what differences exist betwen print and glimpse


### exploring the data

Much of this usse the dplyr package which is part of the tidyverse. We also show how to use the data.tables pacakge as well.

As its authors point out, a good way to think of dplyr is in terms of verbs. the verbs do things to the object

#### count

this function provides a count by varibale 


```r
count(home_range, Family)
```

```
## # A tibble: 17 x 2
##    Family              n
##    <chr>           <int>
##  1 <NA>                2
##  2 Aotidae            13
##  3 Atelidae           54
##  4 Callitrichidae     86
##  5 Cebidae            41
##  6 Cercopithecidae   228
##  7 Cheirogaleidae     45
##  8 Daubentoniidae      1
##  9 Galagidae          32
## 10 Hominidae          13
## 11 Hylobatidae        30
## 12 Indriidae          26
## 13 Lemuridae          38
## 14 Lepilemuridae      29
## 15 Lorisidae          19
## 16 Pitheciidae        76
## 17 Tarsiidae          15
```

> look at the help for count and figure out how to make it order the output from large to small


add_count adds a new col at the end of the dataframe with these data


```r
 add_count(home_range, Family, name = "family_count") 
```

```
## # A tibble: 748 x 16
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Alle~ Allen_s_S~ Alleno~ Allenopithecus_~        NA    <NA>     
##  2 Cheir~ Allo~ Hairy_ear~ Alloce~ Allocebus_trich~        25.8  16       
##  3 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~       117.   NI       
##  4 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~        61.3  51.81    
##  5 Cerco~ Allo~ Preuss_s_~ Alloch~ Allochrocebus_p~        NA    <NA>     
##  6 Cerco~ Allo~ Sun_taile~ Alloch~ Allochrocebus_s~        NA    <NA>     
##  7 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~         7.52 NI       
##  8 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~        14.5  4        
##  9 Ateli~ Alou~ Ursine_Re~ Alouat~ Alouatta_arctoi~         5.5  4        
## 10 Ateli~ Alou~ Red_hande~ Alouat~ Alouatta_belzeb~         7.12 4.75     
## # ... with 738 more rows, and 9 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>, family_count <int>
```

Count is a great way to start exploring your dataset. 



One nice way to make complex code easier to read is to chain arguments togehter w/ the "%>%" symobl. This comes from the AAAAAA pacakage and also is loaded when you load the tidyverse. the %>%  can be read as "then"

so the same code to get the counts of Famlies can be done like this


```r
home_range %>% count(Family, sort = T)
```

```
## # A tibble: 17 x 2
##    Family              n
##    <chr>           <int>
##  1 Cercopithecidae   228
##  2 Callitrichidae     86
##  3 Pitheciidae        76
##  4 Atelidae           54
##  5 Cheirogaleidae     45
##  6 Cebidae            41
##  7 Lemuridae          38
##  8 Galagidae          32
##  9 Hylobatidae        30
## 10 Lepilemuridae      29
## 11 Indriidae          26
## 12 Lorisidae          19
## 13 Tarsiidae          15
## 14 Aotidae            13
## 15 Hominidae          13
## 16 <NA>                2
## 17 Daubentoniidae      1
```

This is sometimes easier when you have a long code and want to make it readable


#### Filter


this function searches for rows that match the arguement. For example, lets say you want all the speices in the genus Allenopithecus

**note the == rather than =**


```r
filter(home_range, Genus == "Macaca")
```

```
## # A tibble: 38 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Maca~ Stump_tai~ Macaca~ Macaca_arctoides        462.  NI       
##  2 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~        434.  352      
##  3 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~        208.  65.6     
##  4 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~         59   53       
##  5 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis         120   NI       
##  6 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis         200   NI       
##  7 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis          97   NI       
##  8 Cerco~ Maca~ Long_tail~ Macaca~ Macaca_fascicul~        157   14       
##  9 Cerco~ Maca~ Japanese_~ Macaca~ Macaca_fuscata           24.0 3.9      
## 10 Cerco~ Maca~ Japanese_~ Macaca~ Macaca_fuscata          366   NI       
## # ... with 28 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```

```r
#or

home_range %>% filter(Genus == "Macaca")
```

```
## # A tibble: 38 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Maca~ Stump_tai~ Macaca~ Macaca_arctoides        462.  NI       
##  2 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~        434.  352      
##  3 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~        208.  65.6     
##  4 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~         59   53       
##  5 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis         120   NI       
##  6 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis         200   NI       
##  7 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis          97   NI       
##  8 Cerco~ Maca~ Long_tail~ Macaca~ Macaca_fascicul~        157   14       
##  9 Cerco~ Maca~ Japanese_~ Macaca~ Macaca_fuscata           24.0 3.9      
## 10 Cerco~ Maca~ Japanese_~ Macaca~ Macaca_fuscata          366   NI       
## # ... with 28 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```


You can do more complex filters too:

lets say you want two genra


```r
filter(home_range, Genus == "Macaca" | Genus == "Allochrocebus")
```

```
## # A tibble: 42 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~        117.  NI       
##  2 Cerco~ Allo~ L_Hoest_s~ Alloch~ Allochrocebus_l~         61.3 51.81    
##  3 Cerco~ Allo~ Preuss_s_~ Alloch~ Allochrocebus_p~         NA   <NA>     
##  4 Cerco~ Allo~ Sun_taile~ Alloch~ Allochrocebus_s~         NA   <NA>     
##  5 Cerco~ Maca~ Stump_tai~ Macaca~ Macaca_arctoides        462.  NI       
##  6 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~        434.  352      
##  7 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~        208.  65.6     
##  8 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~         59   53       
##  9 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis         120   NI       
## 10 Cerco~ Maca~ Taiwanese~ Macaca~ Macaca_cyclopis         200   NI       
## # ... with 32 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```

or you want to match two varibales


```r
filter(home_range, Genus == "Macaca" & N_groups == 2)
```

```
## # A tibble: 4 x 15
##   Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##   <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
## 1 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~         208. 65.6     
## 2 Cerco~ Maca~ Assamese_~ Macaca~ Macaca_assamens~          59  53       
## 3 Cerco~ Maca~ Rhesus_Ma~ Macaca~ Macaca_mulatta            83  1        
## 4 Cerco~ Maca~ Tonkean_M~ Macaca~ Macaca_tonkeana          105. 66.75    
## # ... with 8 more variables: High_range <chr>, N_groups <chr>,
## #   Mean_individuals <chr>, Method <chr>, Alternative_HomeRange_ha <chr>,
## #   Alternative_HomeRange_method <chr>, Study_duration_months <chr>,
## #   Refs <dbl>
```






> how would you find HomeRange_ha greater than 75 and then save that to a new dataset. look at the dplyr help to figure this out


```r
over75 <- filter(home_range, HomeRange_ha > 75)
```



#### Select


this verb searches the dataframe and only returns cols that you ask for. For example. lets say i just want the speceis and home range


```r
home_range %>% select(Species, HomeRange_ha)
```

```
## # A tibble: 748 x 2
##    Species                     HomeRange_ha
##    <chr>                              <dbl>
##  1 Allenopithecus_nigroviridis        NA   
##  2 Allocebus_trichotis                25.8 
##  3 Allochrocebus_lhoesti             117.  
##  4 Allochrocebus_lhoesti              61.3 
##  5 Allochrocebus_preussi              NA   
##  6 Allochrocebus_solatus              NA   
##  7 Alouatta_arctoidea                  7.52
##  8 Alouatta_arctoidea                 14.5 
##  9 Alouatta_arctoidea                  5.5 
## 10 Alouatta_belzebul                   7.12
## # ... with 738 more rows
```

This is useful when you want to look at only some things

> select has a lot of arguments. HOw would you select all the cols that habe the startes with the prefix "Alt"



YOu can also chain verbs together


```r
home_range %>% filter(Genus == "Macaca") %>% select(Species)
```

```
## # A tibble: 38 x 1
##    Species            
##    <chr>              
##  1 Macaca_arctoides   
##  2 Macaca_assamensis  
##  3 Macaca_assamensis  
##  4 Macaca_assamensis  
##  5 Macaca_cyclopis    
##  6 Macaca_cyclopis    
##  7 Macaca_cyclopis    
##  8 Macaca_fascicularis
##  9 Macaca_fuscata     
## 10 Macaca_fuscata     
## # ... with 28 more rows
```


#### arrange

this sorts the data


```r
home_range %>% arrange(HomeRange_ha)
```

```
## # A tibble: 748 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Lepil~ Lepi~ Weasel_Sp~ Lepile~ Lepilemur_muste~        0.3   NI       
##  2 Lepil~ Lepi~ Petter_s_~ Lepile~ Lepilemur_pette~        0.3   NI       
##  3 Cheir~ Micr~ Gray_brow~ Microc~ Microcebus_gris~        0.3   NI       
##  4 Calli~ Cebu~ Pygmy_Mar~ Cebuel~ Cebuella_pygmaea        0.34  NI       
##  5 Cheir~ Micr~ Goodman_s~ Microc~ Microcebus_lehi~        0.35  0.1      
##  6 Lepil~ Lepi~ White_foo~ Lepile~ Lepilemur_leuco~        0.5   NI       
##  7 Lepil~ Lepi~ Small_too~ Lepile~ Lepilemur_micro~        0.5   NI       
##  8 Cheir~ Micr~ Golden_br~ Microc~ Microcebus_rave~        0.570 0.54     
##  9 Cheir~ Micr~ Gray_brow~ Microc~ Microcebus_gris~        0.66  0.43     
## 10 Lepil~ Lepi~ Sahafary_~ Lepile~ Lepilemur_septe~        0.7   NI       
## # ... with 738 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```

if you put a minus sign in from of the variable it will organiz in descnein order



```r
home_range %>% arrange(-HomeRange_ha)
```

```
## # A tibble: 748 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Mand~ Mandrill   Mandri~ Mandrillus_sphi~        18147 NI       
##  2 Cerco~ Semn~ Malabar_S~ Semnop~ Semnopithecus_h~        12328 NI       
##  3 Cerco~ Semn~ Nepal_Sac~ Semnop~ Semnopithecus_s~         6987 NI       
##  4 Cerco~ Eryt~ Patas_Mon~ Erythr~ Erythrocebus_pa~         5200 NI       
##  5 Cerco~ Papio Olive_Bab~ Papio_~ Papio_anubis             4357 NI       
##  6 Cerco~ Mand~ Mandrill   Mandri~ Mandrillus_sphi~         4000 NI       
##  7 Homin~ Pan   Bonobo     Pan_pa~ Pan_paniscus             4000 2200     
##  8 Cerco~ Rhin~ Guizhou_S~ Rhinop~ Rhinopithecus_b~         3450 NI       
##  9 Cerco~ Papio Guinea_Ba~ Papio_~ Papio_papio              3250 2000     
## 10 Homin~ Gori~ Eastern_G~ Gorill~ Gorilla_beringei         3060 2110     
## # ... with 738 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```

```r
#or
home_range %>% arrange(desc(HomeRange_ha))
```

```
## # A tibble: 748 x 15
##    Family Genus CommonName Species `Species (ITIS)` HomeRange_ha Low_range
##    <chr>  <chr> <chr>      <chr>   <chr>                   <dbl> <chr>    
##  1 Cerco~ Mand~ Mandrill   Mandri~ Mandrillus_sphi~        18147 NI       
##  2 Cerco~ Semn~ Malabar_S~ Semnop~ Semnopithecus_h~        12328 NI       
##  3 Cerco~ Semn~ Nepal_Sac~ Semnop~ Semnopithecus_s~         6987 NI       
##  4 Cerco~ Eryt~ Patas_Mon~ Erythr~ Erythrocebus_pa~         5200 NI       
##  5 Cerco~ Papio Olive_Bab~ Papio_~ Papio_anubis             4357 NI       
##  6 Cerco~ Mand~ Mandrill   Mandri~ Mandrillus_sphi~         4000 NI       
##  7 Homin~ Pan   Bonobo     Pan_pa~ Pan_paniscus             4000 2200     
##  8 Cerco~ Rhin~ Guizhou_S~ Rhinop~ Rhinopithecus_b~         3450 NI       
##  9 Cerco~ Papio Guinea_Ba~ Papio_~ Papio_papio              3250 2000     
## 10 Homin~ Gori~ Eastern_G~ Gorill~ Gorilla_beringei         3060 2110     
## # ... with 738 more rows, and 8 more variables: High_range <chr>,
## #   N_groups <chr>, Mean_individuals <chr>, Method <chr>,
## #   Alternative_HomeRange_ha <chr>, Alternative_HomeRange_method <chr>,
## #   Study_duration_months <chr>, Refs <dbl>
```

#### mutate

This is a powerhouse and one that you will probably use a lot. it is simialr to some of the stuff you might do in Excel



## another example


```r
squirrel_raw <- read_csv("datasets/2018_Central_Park_Squirrel_Census_-_Squirrel_Data (1).csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   X = col_double(),
##   Y = col_double(),
##   Date = col_double(),
##   `Hectare Squirrel Number` = col_double(),
##   Running = col_logical(),
##   Chasing = col_logical(),
##   Climbing = col_logical(),
##   Eating = col_logical(),
##   Foraging = col_logical(),
##   Kuks = col_logical(),
##   Quaas = col_logical(),
##   Moans = col_logical(),
##   `Tail flags` = col_logical(),
##   `Tail twitches` = col_logical(),
##   Approaches = col_logical(),
##   Indifferent = col_logical(),
##   `Runs from` = col_logical(),
##   `Zip Codes` = col_double(),
##   `Community Districts` = col_double(),
##   `Borough Boundaries` = col_double()
##   # ... with 2 more columns
## )
```

```
## See spec(...) for full column specifications.
```

```r
squirrel <- squirrel_raw %>% janitor::clean_names()
squirrel %>% count(date, sort=T)
```

```
## # A tibble: 11 x 2
##        date     n
##       <dbl> <int>
##  1 10132018   434
##  2 10072018   405
##  3 10142018   368
##  4 10062018   337
##  5 10102018   335
##  6 10082018   285
##  7 10122018   218
##  8 10172018   216
##  9 10182018   200
## 10 10192018   158
## 11 10202018    67
```

```r
library(lubridate)
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following objects are masked from 'package:data.table':
## 
##     hour, isoweek, mday, minute, month, quarter, second, wday,
##     week, yday, year
```

```
## The following object is masked from 'package:base':
## 
##     date
```

```r
squirrel %>% mutate(parsed_date = mdy(date))
```

```
## # A tibble: 3,023 x 36
##        x     y unique_squirrel~ hectare shift   date hectare_squirre~ age  
##    <dbl> <dbl> <chr>            <chr>   <chr>  <dbl>            <dbl> <chr>
##  1 -74.0  40.8 13A-PM-1014-04   13A     PM    1.01e7                4 <NA> 
##  2 -74.0  40.8 15F-PM-1010-06   15F     PM    1.01e7                6 Adult
##  3 -74.0  40.8 19C-PM-1018-02   19C     PM    1.02e7                2 Adult
##  4 -74.0  40.8 21B-AM-1019-04   21B     AM    1.02e7                4 <NA> 
##  5 -74.0  40.8 23A-AM-1018-02   23A     AM    1.02e7                2 Juve~
##  6 -74.0  40.8 38H-PM-1012-01   38H     PM    1.01e7                1 Adult
##  7 -74.0  40.8 3D-AM-1006-06    03D     AM    1.01e7                6 <NA> 
##  8 -74.0  40.8 42C-AM-1007-02   42C     AM    1.01e7                2 <NA> 
##  9 -74.0  40.8 9A-PM-1010-02    09A     PM    1.01e7                2 Adult
## 10 -74.0  40.8 9B-AM-1010-04    09B     AM    1.01e7                4 <NA> 
## # ... with 3,013 more rows, and 28 more variables:
## #   primary_fur_color <chr>, highlight_fur_color <chr>,
## #   combination_of_primary_and_highlight_color <chr>, color_notes <chr>,
## #   location <chr>, above_ground_sighter_measurement <chr>,
## #   specific_location <chr>, running <lgl>, chasing <lgl>, climbing <lgl>,
## #   eating <lgl>, foraging <lgl>, other_activities <chr>, kuks <lgl>,
## #   quaas <lgl>, moans <lgl>, tail_flags <lgl>, tail_twitches <lgl>,
## #   approaches <lgl>, indifferent <lgl>, runs_from <lgl>,
## #   other_interactions <chr>, zip_codes <dbl>, community_districts <dbl>,
## #   borough_boundaries <dbl>, city_council_districts <dbl>,
## #   police_precincts <dbl>, parsed_date <date>
```

```r
squirrel <- squirrel %>% mutate(date = mdy(date))
squirrel %>% select(other_interactions) %>% filter(!is.na(other_interactions)) %>%  View()

squirrel %>% count(other_interactions, sort=T)
```

```
## # A tibble: 198 x 2
##    other_interactions                    n
##    <chr>                             <int>
##  1 <NA>                               2783
##  2 runs from (dog)                       9
##  3 curious                               6
##  4 runs from (me)                        5
##  5 me                                    4
##  6 stared                                4
##  7 avoided people                        3
##  8 ran up tree when approached           3
##  9 could not get close due to fences     2
## 10 dog                                   2
## # ... with 188 more rows
```

```r
squirrel %>% count(other_activities, sort=T)
```

```
## # A tibble: 308 x 2
##    other_activities     n
##    <chr>            <int>
##  1 <NA>              2586
##  2 digging             19
##  3 sitting             16
##  4 walking             14
##  5 burying             12
##  6 playing             11
##  7 jumping              6
##  8 grooming             5
##  9 cleaning             4
## 10 hopping              4
## # ... with 298 more rows
```

