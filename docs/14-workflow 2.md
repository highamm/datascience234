# Workflow and "Soft" Skills {#workflow}

__Goals:__

1. Describe what a server is, what the benefits and drawbacks are of using a server to run `R Studio`, install `R` and `R Studio` on your own laptop, and install `R` packages. 

1. Describe how files are organized in an `R` project, describe the advantage of a common working directory through an `R` Project, and use the `here` package to assist in accessing and reading in files.

1. Use strategies to debug code that is not working correctly.

1. Explain how the context a data set comes from informs the analysis of the data. 

1. Find missing values and outliers, and explain how these might affect conclusions from a data analysis.

## Installing `R` and `R Studio`

The `R Studio` server is a computer that is set-up to carry out any `R`-based analyses for students with remote access to the computer (in our case, through SLU Login credentials). It might be helpful to think about the server as a large machine with no keyboard and no screen: it's only purpose is to execute the code.  

`R` and `R Studio` are completely free, so you can install both on most computers (not Chromebooks though). The `R Studio` server has a couple of advantages, particularly for a classroom or workshop setting:

* using the server ensures that we are all using the same version of `R`. In theory, if one person gets an error, then everyone should get that same error.

* installing `R` and `R Studio` on your personal device is much easier after you've had some experience using it through the server.

* you don't need a computer that is capable of running `R` to use the server (you can use a tablet or a Chromebook since the server does all of the actual computation).

This week, however, we will move away from the server and, if you have a device that can install `R` (pretty much any computer that isn't a Chromebook), you will install `R` on your own device. Though the server does have some advantages, there are also some disadvantages:

* you won't have your SLU login forever, so, if you wanted to use `R` post graduation, you'd need to know how to install it.

* you haven't had experience installing `R` packages. This is quite easy to do, but I've installed all necessary `R` packages on the server for us so you haven't had to worry about this step.

* the server requires good Internet access and also has the potential to crash.

In this next section, we will work on installing `R` and `R Studio` to your personal laptop. The following videos provide instructions on how to install `R` and `R Studio` to your laptop computer. It will be easiest if you complete all of these steps consecutively in one sitting. So, you should ideally have about 45 minutes to an hour of your time blocked off to complete the "getting started" process using the videos below.

<input type="checkbox"> Watch and follow along with a <a href="https://www.youtube.com/watch?v=-WNEPGMpzns" target="_blank">video on installing R</a>. </input>

<input type="checkbox"> Watch and follow along with a <a href="https://www.youtube.com/watch?v=urw6AMOzAUo" target="_blank">video on installing R Studio</a>. </input>

<input type="checkbox"> Watch and follow along with a <a href="https://www.youtube.com/watch?v=IaONPkvjNZM" target="_blank">video on installing R packages and changing other options</a>. </input>

### Installing `R` Packages

So far, either myself or one of the other statistics faculty members have installed all packages that we've needed to use on the server globally. These packages include `tidyverse`, `ggthemes`, and `ggrepel`. However, if you want to use a package that isn't installed on the server, or, you want to use a package using `R Studio` on your own personal computer, you need to install it first. 

Installation only needs to happen once (or until you upgrade `R`, which usually doesn't happen too often), whereas the package needs to be loaded with `library()` __every__ time you open `R`. The analogy of a  <a href="https://hbctraining.github.io/Intro-to-R/img/install_vs_library.jpeg" target="_blank">lightbulb might be helpful</a>. You only need to screw in the lightbulb into a socket once, but, every time you want the lightbulb to provide light, you need to flip the light switch.

In the lightbulb analogy, what does putting the lightbulb into the socket correspond to? What does flipping the light switch correspond to?

Now that you have `R` on your own computer, you'll need to install __all__ packages that you want to use (but, remember that you just need to install each package once). 

### Exercises {#exercise-14-1}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-14).

1. \* Click the "Packages" button in the lower-right hand window to bring up the packages menu. Instead of using `library(name_of_package)`, you can click the checkbox by the package name to load it into `R`. Try it out by un-checking and then re-checking `tidyverse`. Explain, from a reproducibility perspective, why loading packages this way is __not__ good practice.

## `R Projects` and File Organization

`R Projects` are a convenient way to keep related code, data sets, and analyses together. Read this very short introduction in `R` for Data Science here: <a href="https://r4ds.had.co.nz/workflow-projects.html#paths-and-directories" target="_blank">https://r4ds.had.co.nz/workflow-projects.html#paths-and-directories</a> and <a href="https://r4ds.had.co.nz/workflow-projects.html#rstudio-projects" target="_blank">https://r4ds.had.co.nz/workflow-projects.html#rstudio-projects</a>.

Why should you rarely use an absolute directory?

Look at the top of your bottom-left terminal window. If you've made an `R project` (which you should have!), you should see that a file path that is the current folder you're working in. This is where `R Studio` will look for files by default. 

The `here` package can help keep track of where files are and with reading in files. Install the `here` package with `install.packages("here")`. Then, load the package and run the `here()` function with 


```r
library(here)
#> here() starts at /Users/highamm/Desktop/datascience234
here()
```

`here()` prints the directory of where your current `R` project is. When reading in a data set with `read_csv()`, we would use


```r
library(tidyverse)
#> ── Attaching packages ─────────────────── tidyverse 1.3.1 ──
#> ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
#> ✓ tibble  3.1.2     ✓ dplyr   1.0.7
#> ✓ tidyr   1.1.3     ✓ stringr 1.4.0
#> ✓ readr   2.0.2     ✓ forcats 0.5.1
#> ── Conflicts ────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
athletes_df <- read_csv("data/athletesdata.csv")
#> New names:
#> * `` -> ...1
#> Rows: 100 Columns: 9
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr (3): Name, Sport, Gender
#> dbl (6): ...1, Rank, endorsements, totalpay, salary, age
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

`R` can read in this data set successfully: it starts at the path given in the console that was printed from `here()`, looks for a folder called `data` in that path and looks for a file called `athletesdata.csv` in the data folder. 

So, if you zipped up your project and sent it to someone else, they'd be able to open it and read that data file without needing to change any directory code!

The `here()` function from the `here` package can be used for more than just printing out the current working directory. To see its usefulness, suppose that, in the folder that has your current `R` project, you want to make a folder called `Quizzes` that has your `.Rmd` files for your quizzes in this class. Make this folder, create a new `.Rmd` file, paste in the `R` chunk that reads in the `athletesdata.csv` data set, save the file, and then try to knit the file. 

You should get an error that the `athletesdata.csv` data file is not found. When knitting a `.Rmd` file, `R` looks for the `data/` folder __within the folder that contains the .Rmd file__. Since the `data/` folder is in the folder with your `R` Project, not in the folder with your `.Rmd` file, `R` can't find it.

To fix the issue, we could specify the entire file path to the `data/` file. But, a better fix would be to use the `here()` function, which tells `R` to start looking for folders and files in the folder with our `R` Project:


```r
athletes_test_read <- read_csv(here("data/athletesdata.csv"))
#> New names:
#> * `` -> ...1
#> Rows: 100 Columns: 9
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr (3): Name, Sport, Gender
#> dbl (6): ...1, Rank, endorsements, totalpay, salary, age
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

This allows us to have `R Markdown` files within folders in our `R` project.

### Exercises {#exercise-14-2}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-14).

1. Take some time to modify your files in this course by creating a few folders to help keep things a bit more organized. You might consider having a `Quizzes` folder, an `Exercises` folder, etc. Move the relevant files to these folders and modify each file to load in the `here` package and use the `here()` function to read in any relevant data sets. 

## Code Style

Writing code that is "readable" is helpful not only for others but also for yourself, especially if the project you are working on is long-term. What constitutes "readable" code varies a bit, but there are some general principles that are more widely accepted for "good" code. Much of the coding "style" you have seen so far has been imposed by me: I have my own style for writing code so naturally, I use that style in the code I write for our course materials. 

### Names

Names of objects that we create should be descriptive yet short. Sometimes, thinking of a name that makes sense can be very challenging! Some examples of "bad" names for objects include names that are too generic that we won't be able to distinguish them later:


```r
df1 <- mtcars |> filter(cyl == 4)
df2 <- mtcars |> filter(cyl == 6)
df3 <- mtcars |> filter(cyl == 8)
```

Better names for the above data frames would be `cyl4_df`, `cyl6_df`, and `cyl8_df`, respectively, as these names tell us more about what is in each data frame.

Other "bad" names for objects are names that are too long:


```r
cars_with_4_cylinders_data_set <- mtcars |> filter(cyl == 4)
```

Long names are descriptive but can be a pain to type out and to read.

You may have noticed that my coding "style" is to separate words in names with an `_`: `cyl4_df`. Others may choose to separate words in names with a `.`: `cyl4.df` while others may use capitalization for the second word: `cyl4Df`. The most important thing here is to __be consistent__ in your choice. In other words, using `_` instead of `.` isn't necessarily better, but it would be poor practice to mix naming notation. 


```r
cyl4_df <- mtcars |> filter(cyl == 4)
cyl6.df <- mtcars |> filter(cyl == 6)
```

If we mixed, then we always have to keep track of whether an object is named with `_` or `.` or with capitalization.

Finally, you may have noticed that most of our data frames our named with the suffix `_df`. I have worked that into my own coding style because I like keeping track of what is a dataframe (or `tibble`) and what isn't. This is generally more helpful as you encounter different types of objects (model output, lists, matrices, vectors, etc.).

### Code Readability

We can also follow some general practices to make our code more "readable." We have already been employing most of these practices throughout the semester: `R Studio` generally makes code readable by indenting appropriately.

Appropriately using spacing can make code much more readable. Consider the following `ggplot()` code. For example, the following code chunk executes a scatterplot with a fitted regression line but it's generally tough to read.


```r
ggplot(data=mtcars,aes(x=wt,y=drat))+geom_point()+geom_smooth(method="lm",se=FALSE)
#> `geom_smooth()` using formula 'y ~ x'
```

<img src="14-workflow_files/figure-html/unnamed-chunk-7-1.png" width="672" />

A couple of conventions can help: (1) spaces around any equal sign, plus sign, and after any comma and (2) putting code after each plus sign on a different line.


```r
ggplot(data = mtcars, aes(x = wt, y = drat)) +
geom_point() +
geom_smooth(method = "lm", se = FALSE)
#> `geom_smooth()` using formula 'y ~ x'
```

<img src="14-workflow_files/figure-html/unnamed-chunk-8-1.png" width="672" />

Indenting subsequent lines in `ggplot2` code or in a `dplyr` pipeline shows that the subsequent lines "go with" the first line:


```r
ggplot(data = mtcars, aes(x = wt, y = drat)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
#> `geom_smooth()` using formula 'y ~ x'
```

<img src="14-workflow_files/figure-html/unnamed-chunk-9-1.png" width="672" />

The same concepts of using multiple lines holds for a piping statement as well. In general,


```r
mtcars |> filter(cyl == 4) |>
  group_by(vs) |>
  summarise(mean_mpg = mean(mpg, na.rm = TRUE))
#> # A tibble: 2 x 2
#>      vs mean_mpg
#>   <dbl>    <dbl>
#> 1     0     26  
#> 2     1     26.7
```

is easier to read than


```r
mtcars |> filter(cyl == 4) |> group_by(vs) |> summarise(mean_mpg = mean(mpg, na.rm = TRUE))
#> # A tibble: 2 x 2
#>      vs mean_mpg
#>   <dbl>    <dbl>
#> 1     0     26  
#> 2     1     26.7
```

### Exercises {#exercise-14-3}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-14).

1. Change the following object names to be "better:"


```r
cars_where_wt_is_larger_than_3_tons <- mtcars |> filter(wt > 3)
```


```r
dataset <- mtcars |> group_by(am) |>
  summarise(mean_disp = mean(disp),
            med_disp = median(disp),
            sd_disp = sd(disp))
```

2. Change the style of the following code to make the code more readable.


```r
ggplot(data=mtcars,aes(x = mpg))+geom_histogram(colour="black",fill="white",bins=15) + facet_wrap(~cyl, ncol=1)
```

<img src="14-workflow_files/figure-html/unnamed-chunk-14-1.png" width="672" />

## Debugging Code

The previous section on code readability can be seen as one step to helping with code debugging: code that is easier to read is code that is easier to spot errors in. Additionally, there are some other strategies we can take when our code is not working to figure out what the issue is.

### Identify the Problem

We run `R` code for our data analyses from "top to bottom," which makes it a bit easier to identify where the problem code is occurring. We can run our code from the top of our `.Rmd` file, line by line, until we see the red `Error` message. 

Often this `Error` message will occur in a `ggplot` statement or a piping statement. If this is the case, then a further strategy is to run the `ggplot` statement `+` sign by `+` sign or to run the piping statement pipe by pipe to further isolate the error. For example, take the following `ggplot` code, which generates a somewhat cryptic error.


```r
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(colour = disp) +
  facet_wrap(~ cyl) 
```

In this case, the error message does help us locate the issue, but that is not always the case. If we are not sure what the error is, what we can do is run


```r
ggplot(data = mtcars, aes(x = wt, y = mpg))
```

to see if we get an error. We don't, so we move on to the code after the next `+` sign:


```r
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point()
```

We still don't get an error so we move on to the code after the next `+` sign:


```r
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(colour = disp)
```

We have our error. So now, instead of isolating the error to a particular chunk of code, we have isolated the error to a particular __line__ of code: we know the issue is something with how we are using `geom_smooth()`. (We are missing `aes()` to refer to the variable `disp`).

The same strategy can be used with piping. The following code, used to figure out the average bill length to bill depth ratio in Adelie penguins, does not give an error but instead outputs something that we might not expect: a `tibble` with an `NaN` value


```r
library(palmerpenguins)
penguins |> filter(species == "Adeie") |>
  mutate(bill_ratio = bill_length_mm / bill_depth_mm) |>
  summarise(mean_ratio = mean(bill_ratio))
```

We can troubleshoot by running the code "pipe by pipe," starting with the code through the first `filter()` pipe:


```r
penguins |> filter(species == "Adeie")
```

Right away, we see a problem: we get a tibble with no data because we misspelled `Adelie`:


```r
penguins |> filter(species == "Adelie")
```

After correcting this issue, we can continue through the pipes:


```r
penguins |> filter(species == "Adelie") |>
  mutate(bill_ratio = bill_length_mm / bill_depth_mm)
```

There doesn't seem to be any issues in our `mutate()` statement so we can go to the next pipe.


```r
penguins |> filter(species == "Adelie") |>
  mutate(bill_ratio = bill_length_mm / bill_depth_mm) |>
  summarise(mean_ratio = mean(bill_ratio))
```

We get an `NA` value, and we have isolated the issue to something with `summarise()`, or, possibly something with `mutate()` that does not set something up quite right for `summarise()`. Can you figure out the issue?

In addition to isolating the coding issue, a couple of other very basic strategies for trying to fix problematic code are to use a search engine like google to see if anyone else has a similar error message to the one you may have and to restart `R` to make sure that you are working from a clean slate.

The "restart `R`" strategy can be particularly helpful if you have code that will run but your `.Rmd` file will not knit. This can happen if you have, for example, created a data set that you use in a later chunk of code but have since deleted the code that created that data set. For example, suppose we create `cyl4_df` and make a plot:


```r
cyl4_df <- mtcars |> filter(cyl == 4)

ggplot(data = cyl4_df, aes(x = mpg)) +
  geom_histogram()
#> `stat_bin()` using `bins = 30`. Pick better value with
#> `binwidth`.
```

<img src="14-workflow_files/figure-html/unnamed-chunk-24-1.png" width="672" />

But, later we delete the line creating `cyl4_df`. The plot will still work because `cyl4_df` is already in our environment but the file will not knit because we are missing that crucial line of code. Restarting `R` can help us identify this issue because the plot will no longer work and we will get a sensible error message like `cyl4_df` not found.

### Exercises {#exercise-14-4}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-14).

1. Find the error in the following code chunk by running the code "`+` sign by `+` sign).


```r
ggplot(data = mtcars, aes(x = hp, y = drat)) +
  geom_point(aes(colour = factor(gear))) +
  facet_wrap(cyl) +
  geom_smooth()
```

2. Find the error in the following code chunk by running the code "pipe by pipe."


```r
penguins |> mutate(flipper_ratio = flipper_length_mm / body_mass_g) |>
  group_by(species, island) |>
  summarise(mean_flipper = mean(flipper_ratio, na.rm = TRUE)) |>
  arrange(flipper_ratio) |>
  pivot_wider(names_from = c("species"), values_from = "mean_flipper")
```

3. Find the error in the following code chunk by running the code "pipe by pipe."


```r
penguins |> mutate(flipper_ratio = flipper_length_mm / body_mass_g) |>
  filter(flipper_ratio > median(flipper_ratio)) |>
  group_by(species) |>
  summarise(count_var = n())
```

## Context, Outliers, and Missing Values

The primary purpose of this section is to explore why we should always think critically about the data set we are analyzing as opposed to simply making summary tables without thinking about how they could be interpreted. In other words, we need to both examine the data set to see if there are things like missing values or outliers that could affect interpretation as well as consider the context that the data set comes from. 

### Context

Considering context includes thinking about questions like:

* where did the data set come from? Who collected it?

* are there missing values coded as `NA`s in the data set. Would these affect our analysis or are they missing "at random." Missing values coded as `NA` are referred to as __explicitly__ missing values.

* are there missing values in the data set that are not actually observations at all? These are __implicitly__ missing. An example might be collecting data on students attending this class. Students not present at the time the data was collected are implicitly missing.

* does the data come from an observational study or an experiment?

There are many other questions we could ask pertaining to context, but many such questions depend on the particular data collected. As an example, consider 

need to finish this section.


```r
library(openintro)
#> Warning: package 'openintro' was built under R version 4.1.2
#> Loading required package: airports
#> Loading required package: cherryblossom
#> Loading required package: usdata
```

### Outliers and Missing Values

Outliers in a data analysis can affect certain summary statistics, like the mean and the standard deviation (as you learned in STAT 113). They could also be observations that warrant further investigation if we are interested in _why_ a particular point is an outlier.

Missing values can also cause us to reach a potentially misleading conclusion if we do not carefully consider why such values are missing.

We will talk about the consequences of outliers and missing values next, but first, we will discuss how to determine if there are outliers or missing values in the data set. An easy function to use for this purpose is the `skim()` function from the `skimr` package. Install the `skimr` package and then use the `skim()` function on the`videogame_clean.csv` file, which contains variables on video games from 2004 - 2019, including

* `game`, the name of the game
* `release_date`, the release date of the game
* `release_date2`, a second coding of release date
* `price`, the price in dollars,
* `owners`, the number of owners (given in a range)
* `median_playtime`, the median playtime of the game
* `metascore`, the score from the website Metacritic
* `price_cat`, 1 for Low (less than 10.00 dollars), 2 for Moderate (between 10 and 29.99 dollars), and 3 for High (30.00 or more dollars)
* `meta_cat`, Metacritic's review system, with the following categories: "Overwhelming Dislike", "Generally Unfavorable", "Mixed Reviews", "Generally Favorable", "Universal Acclaim".
* `playtime_miss`, whether median play time is missing (`TRUE`) or not (`FALSE`)

The data set was modified from <a href="https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-07-30" target="_blank">https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-07-30</a>.


```r
library(skimr)
library(here)
videogame_df <- read_csv(here("data/videogame_clean.csv"))
#> Rows: 26688 Columns: 15
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr  (7): game, release_date, owners, meta_cat, develope...
#> dbl  (6): price, median_playtime, metascore, price_cat, ...
#> lgl  (1): playtime_miss
#> date (1): release_date2
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
skim(videogame_df)
```


Table: (\#tab:unnamed-chunk-29)Data summary

|                         |             |
|:------------------------|:------------|
|Name                     |videogame_df |
|Number of rows           |26688        |
|Number of columns        |15           |
|_______________________  |             |
|Column type frequency:   |             |
|character                |7            |
|Date                     |1            |
|logical                  |1            |
|numeric                  |6            |
|________________________ |             |
|Group variables          |None         |


**Variable type: character**

|skim_variable   | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:---------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|game            |         3|          1.00|   1| 212|     0|    26610|          0|
|release_date    |         0|          1.00|   8|  12|     0|     2977|          0|
|owners          |         0|          1.00|  11|  26|     0|       13|          0|
|meta_cat        |     23838|          0.11|  13|  21|     0|        4|          0|
|developer       |       151|          0.99|   1| 237|     0|    16752|          0|
|publisher       |        95|          1.00|   1| 131|     0|    13953|          0|
|meta_cat_factor |     23838|          0.11|  13|  21|     0|        4|          0|


**Variable type: Date**

|skim_variable | n_missing| complete_rate|min        |max        |median     | n_unique|
|:-------------|---------:|-------------:|:----------|:----------|:----------|--------:|
|release_date2 |         1|             1|2004-01-11 |2018-12-31 |2017-06-09 |     2951|


**Variable type: logical**

|skim_variable | n_missing| complete_rate| mean|count                |
|:-------------|---------:|-------------:|----:|:--------------------|
|playtime_miss |         0|             1| 0.97|TRU: 25837, FAL: 851 |


**Variable type: numeric**

|skim_variable    | n_missing| complete_rate|    mean|      sd|    p0|    p25|     p50|     p75|    p100|hist  |
|:----------------|---------:|-------------:|-------:|-------:|-----:|------:|-------:|-------:|-------:|:-----|
|price            |      3095|          0.88|    8.95|   12.16|  0.49|   2.99|    5.99|    9.99|  595.99|▇▁▁▁▁ |
|median_playtime  |        12|          1.00|    5.16|   68.91|  0.00|   0.00|    0.00|    0.00| 3293.00|▇▁▁▁▁ |
|metascore        |     23838|          0.11|   71.90|   11.02| 20.00|  66.00|   73.00|   80.00|   98.00|▁▁▃▇▂ |
|price_cat        |      3095|          0.88|    1.25|    0.49|  1.00|   1.00|    1.00|    1.00|    3.00|▇▁▂▁▁ |
|number           |         0|          1.00| 2904.19| 2377.07|  1.00| 821.00| 2356.00| 4523.25| 8846.00|▇▅▃▂▁ |
|average_playtime |         9|          1.00|    9.06|  117.94|  0.00|   0.00|    0.00|    0.00| 5670.00|▇▁▁▁▁ |

See if you can find in the output the following:

* the number of rows in the data set and the number of columns
* the number of missing values for each variable
* the number of unique values for each character variable
* the completion rate (the proportion of values that are non-missing).

In particular, the number of missing values is given by `nmissing` and `complete_rate` gives the proportion of values that are non-missing. These give us some idea about if missing values exist for certain variables, and, if so, how many exist for each variable.

Also, at the bottom of the output, you should see tiny histograms of each numeric variable and some summary statistics. Looking at the min, max, and the histograms of each variable can inform us about whether each variable has any outliers. For example, we see that the histograms for `price`, `median_playtime`, and `average_playtime` all look extremely skewed right because of the outlier(s) on the upper end.

<br>

<br>

So, we now know that there are outliers and missing values for certain variables in the videogame data set. How might these affect the tables and graphs that we make? 

First, let's focus on the `metascore` variable, which gives Metacritic's overall aggregated review score for the videogames. Note that the `complete_rate` for the `metascore` variable is only 0.107: almost 90% of the videogames do not have a metascore. 

So, suppose we are interested in exploring what the "typical" metascore is. We can figure out what the average metascore and what the median metascore of the non-missing videogames is with:


```r
videogame_df |> summarise(mean_meta = mean(metascore, na.rm = TRUE),
                          med_meta = median(metascore, na.rm = TRUE))
#> # A tibble: 1 x 2
#>   mean_meta med_meta
#>       <dbl>    <dbl>
#> 1      71.9       73
```

Ignoring the missing values, we would say that, on average, videogames receive metascores around 72 points. The question we need to ask ourselves is: "Is it reasonable to assume that the missing games receive similar reviews to the non-missing games so that we can thin about the 71.9 as the average review score of all games?"

How you answer might depend on what you understand about videogames and the review process. But I would argue that the missing games would be reviewed worse than the non-missing games. Major games usually get the most reviews and also usually have the most funding while there are many minor games that have little funding, would not get reviewed, and, if they did get reviewed, may get a lower rating.

You can certainly make a different argument: we don't know if my argument is correct or not without further data. The most important thing to do is to at least think about and make clear possible limitations in your conclusions from a data analysis.

As a second example, consider an exploration of the relationship between `median_playtime` of a game and its `metascore`. We can make a scatterplot of the relationship, ignoring the missing values, with


```r
ggplot(data = videogame_df, aes(x = metascore, y = median_playtime)) +
  geom_point() +
  geom_smooth()
#> `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
#> Warning: Removed 23843 rows containing non-finite values
#> (stat_smooth).
#> Warning: Removed 23843 rows containing missing values
#> (geom_point).
```

<img src="14-workflow_files/figure-html/unnamed-chunk-31-1.png" width="672" />

We see some clear outliers, which we will talk about next, but would the missing values for `metascore` affect conclusions we draw from the graph? The answer would be "yes" if we think videogames with missing metascores would follow a different overall trend than those with non-missing metascores and "no" if we think that, if the videogames with missing metascores were rated, they would follow a similar trend as those already in the graph. 

For this question, I would make the argument that the games would follow a similar trend. But again, that is an assumption I would need to make and need to be explicit about.

We also mentioned the idea of implicit missing values. These would be videogames that do not appear in the data set at all. In other words, was this set of videogames a sample or is it all videogames ever published in the United States? If it is a sample, how were they selected, and, if they are a __convenience sample__, what were the types of games that were left out?

<br>

Outliers can also pose interesting challenges in data analysis. For example, consider again the graph of `median_playtime` vs. `metascore`. To focus on outliers now, we will ignore the missing values in `metascore`.


```r
ggplot(data = videogame_df, aes(x = metascore, y = median_playtime)) +
  geom_point() +
  geom_smooth()
#> `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
#> Warning: Removed 23843 rows containing non-finite values
#> (stat_smooth).
#> Warning: Removed 23843 rows containing missing values
#> (geom_point).
```

<img src="14-workflow_files/figure-html/unnamed-chunk-32-1.png" width="672" />

We see some clear outliers in `median_playtime`: games with a median playtime of thousands of hours. Once again, having some knowledge about videogames can help us determine what to do with these outliers. 

The most important thing to do when dealing with outliers is to __be explicit__ about what you, as the analyst, choose to keep in the graph or summary table and what you choose to remove. If you choose to remove values, give your reasoning, and, if there is space, you can also give a second graph that has the data without removing any outliers.

In this example, a median playtime of `3000+` hours seems a bit excessive, but it's more challenging to determine what a reasonable cutoff for "excessive" is. Is it reasonable for a game to have a median playtime of `1000` hours? What aobut `2000` hours? `500` hours? Choosing which points to keep will affect the fit of the smoother. As you may have learned in STAT 113 or STAT 213, observations that have a high control over the fit of a smoother or regression line are __influential__. 

### Exercises {#exercise-14-5}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-14).

1. The STAT 113 survey data set contains responses from 397 STAT 113 students from a survey that students take at the beginning of the semester. There are 5 categorical variables and 7 numeric variables. Of the categorical variables, how many variables have __0__ missing values? Of the numeric variables, how many variables have __0__ missing values?


```r
library(tidyverse)
stat113_df <- read_csv(here("data/stat113.csv"))
#> Rows: 397 Columns: 12
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr (5): Year, Sex, Sport, Award, SocialMedia
#> dbl (7): Hgt, Wgt, Haircut, GPA, Exercise, TV, Pulse
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

2. Choose a variable that has some missing values that you __would__ feel comfortable ignoring the missing values in a table or graph. Give a one to two sentence reason.

3. Choose a variable that has some missing values that you __would not__ feel comfortable ignoring the missing values in a table or graph. Give a one to two sentence reason.

4. Find the __mean__ and __median__ `median_playtime` for all videogames in the data set. Then, remove the games with a `median_playtime` over `1000` hours. Compute the __mean__ and __median__ `median_playtime` of the data set without these games. Which measure, the __mean__ or the __median__ was more affected by having the outliers present?

## Chapter Exercises {#chapexercise-14}

There are no chapter exercises for this section on workflow.

## Exercise Solutions {#solutions-14}

### Installing `R` and `R Studio` S 

1. \* Click the "Packages" button in the lower-right hand windown to bring up the packages menu. Instead of using `library(name_of_package)`, you can click the checkbox by the package name to load it into `R`. Try it out by un-checking and then re-checking `tidyverse`. Explain, from a reproducibility perspective, why loading packages this way is __not__ good practice.

If I loaded a package by checking the box, did some analysis, and gave my code to someone else, that person couldn't easily see which packages I loaded in. Therefore, they wouldn't necessarily be able to reproduce my results exactly.

### `R Projects` and File Organization S

### Code Style S

### Debugging Code S

### Context, Outliers, and Missing Values S

## Non-Exercise `R` Code {#rcode-14}


```r
library(here)
here()
library(tidyverse)
athletes_df <- read_csv("data/athletesdata.csv")
athletes_test_read <- read_csv(here("data/athletesdata.csv"))
df1 <- mtcars |> filter(cyl == 4)
df2 <- mtcars |> filter(cyl == 6)
df3 <- mtcars |> filter(cyl == 8)
cars_with_4_cylinders_data_set <- mtcars |> filter(cyl == 4)
cyl4_df <- mtcars |> filter(cyl == 4)
cyl6.df <- mtcars |> filter(cyl == 6)
ggplot(data=mtcars,aes(x=wt,y=drat))+geom_point()+geom_smooth(method="lm",se=FALSE)
ggplot(data = mtcars, aes(x = wt, y = drat)) +
geom_point() +
geom_smooth(method = "lm", se = FALSE)
ggplot(data = mtcars, aes(x = wt, y = drat)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
mtcars |> filter(cyl == 4) |>
  group_by(vs) |>
  summarise(mean_mpg = mean(mpg, na.rm = TRUE))
mtcars |> filter(cyl == 4) |> group_by(vs) |> summarise(mean_mpg = mean(mpg, na.rm = TRUE))
cyl4_df <- mtcars |> filter(cyl == 4)

ggplot(data = cyl4_df, aes(x = mpg)) +
  geom_histogram()
library(openintro)
library(skimr)
library(here)
videogame_df <- read_csv(here("data/videogame_clean.csv"))
skim(videogame_df)
videogame_df |> summarise(mean_meta = mean(metascore, na.rm = TRUE),
                          med_meta = median(metascore, na.rm = TRUE))
ggplot(data = videogame_df, aes(x = metascore, y = median_playtime)) +
  geom_point() +
  geom_smooth()
ggplot(data = videogame_df, aes(x = metascore, y = median_playtime)) +
  geom_point() +
  geom_smooth()
```