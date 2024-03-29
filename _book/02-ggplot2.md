# Plotting with `ggplot2` {#ggplot2}

__Goals:__

1. Use the `ggplot2` package to make exploratory plots from STAT 113 of a single quantitative variable, two quantitative variables, a quantitative and a categorical variable, a single categorical variable, and two categorical variables.

1. Use the plots produced to answer questions about the Presidential election data set and the Fitness data set.

1. Further practice running code in `R`.

## Introduction and Basic Terminology

We will begin our data science journey with plotting in the `ggplot2` package. We are starting with plotting for a couple of reasons:

1. Plotting is cool! We get to see an immediate result of our coding efforts in the form of a nice-to-look-at plot.

1. In an exploratory data analysis, you would typically start by making plots of your data.

1. Plotting can lead us to ask and subsequently investigate interesting questions, as we will see in our first example.

We will first use a data set on the 2000 United States Presidential election between former President George Bush and Al Gore obtained from <a href="http://www.econometrics.com/intro/votes.htm" target="_blank">http://www.econometrics.com/intro/votes.htm</a>. For those unfamiliar with U.S. political elections, it is enough to know that each state is allocated a certain number of "electoral votes" for the president: states award all of their electoral votes to the candidate that receives the most ballots in that state. You can read more about this strange system <a href="https://en.wikipedia.org/wiki/United_States_Electoral_College" target="_blank">on Wikipedia</a>.

Florida is typically a highly-contentious "battleground" state. The data set that we have has the following variables, recorded for each of the 67 counties in Florida:

* `Gore`, the number of people who voted for Al Gore in 2000
* `Bush`, the number of people who voted for George Bush in 2000
* `Buchanan`, the number of people who voted for the third-party candidate Buchanan
* `Nader`, the number of people who voted for the third-party candidate Nader
* `Other`, the number of people who voted for a candidate other than the previous 4 listed
* `County`, the name of the county in Florida

To get started exploring the data, complete the following steps that you learned in Week 0:

1. Log-on to the SLU `R Studio` server <a href="http://rstudio.stlawu.local:8787" target="_blank">http://rstudio.stlawu.local:8787</a>

1. Create a new .Rmd file in the same folder as your Notes `R Project` using File -> New File -> `R Markdown`.

1. Finally, read in and name the data set `pres_df`, and take a look at the data set by running the `head(pres_df)` line, which shows the first few observations of the data set:


```r
library(tidyverse)
pres_df <- read_table("data/PRES2000.txt") 
## don't worry about the `read_table` function....yet
head(pres_df)
#> # A tibble: 6 x 6
#>     Gore   Bush Buchanan Nader Other County  
#>    <dbl>  <dbl>    <dbl> <dbl> <dbl> <chr>   
#> 1  47365  34124      263  3226   751 ALACHUA 
#> 2   2392   5610       73    53    26 BAKER   
#> 3  18850  38637      248   828   242 BAY     
#> 4   3075   5414       65    84    35 BRADFORD
#> 5  97318 115185      570  4470   852 BREVARD 
#> 6 386561 177323      788  7101  1623 BROWAR
```

Pay special attention to the variable names: we'll need to use these names when we make all of our plots. And, `R` is case-sensitive, meaning that we will, for example, need to use `Gore`, not `gore`.

We are trying to go very light on the technical code terminology to start out with (but we will come back to some things later in the semester). The terminology will make a lot more sense once you've actually worked with data. But, there are three terms that will be thrown around quite a bit in the next few weeks: _function_, _argument_, and _object_. 

* a _function_ in `R` is always* (*always for this class) followed by an open `(` and ended with a closed `)`. In non-technical terms, a _function_ __does__ something to its inputs and is often analogous to an English verb. For example, the `mean()` function calculates the mean, the `rank()` functions ranks a variable from lowest to highest, and the `labs()` is used to add labels to a plot. Every function has a help file that can be accessed by typing in `?name_of_function`. Try typing `?mean` in your lower left window.

* an _argument_ is something that goes inside the parentheses in a function. Arguments could include _objects_, or they might not. In the bottom-left window, type `?mean` to view the Help file on this `R` function. We see that `mean()` has 3 arguments: `x`, which is an `R` object, `trim`, and `na.rm`. `trim = 0` is the default, which means that, by default, `R` will not trim any of the numbers when computing the mean.

* an _object_ is something created in `R`, usually with `<-`. So, looking at the code above where we read in the data, `pres_df` is an `R` object. 

All of this will make more sense as we go through these first couple of weeks. 

## Basic Plot Structure 

We will use the `ggplot()` function in the `ggplot2` package to construct visualizations of data. the `ggplot()` function has 3 basic components:

* a `data` argument, specifying the name of your data set (`pres_df` above)
* a `mapping` argument, specifying that specifies the aesthetics of your plot (`aes()`). Common aesthetics are `x` position, `y` position, `colour`, `size`, `shape`, `group`, and `fill`.
* a `geom_    ()` component, specifying the geometric shape used to display the data.

The components are combined in the following form:


```r
ggplot(data = name_of_data, mapping = aes(x = name_of_x_var, 
                                          y = name_of_y_var,
                                          colour = name_of_colour_var,
                                          etc.)) +
  geom_nameofgeom() +
  .....<other stuff>
```

The structure of `ggplot()` plots is based on the Grammar of Graphics <a href="https://www.springer.com/gp/book/9780387245447" target="_blank">https://www.springer.com/gp/book/9780387245447</a>. As with most new things, the components above will be easier to think about with some examples. 

## Graphing a Single Variable

### Histograms and Frequency Plots for a Quantitative Variable

Let's go ahead and begin our exploration of the data by making a histogram of the number of people who voted for `Gore` in each county. Recall that a histogram is useful if we would like a graph of a single quantitative variable. Copy the following code to an `R` chunk and run the code:


```r
ggplot(data = pres_df, mapping = aes(x = Gore)) +
  geom_histogram(colour = "black", fill = "white") +
  xlab("Votes for Gore in Florida")
#> `stat_bin()` using `bins = 30`. Pick better value with
#> `binwidth`.
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->

What do the 1e+05, 2e+05, etc. labels on the x-axis mean?

`R` gives us a message to "Pick a better value with `binwidth`" instead of the default `bins = 30`. Add `, bins = 15`  inside the parentheses of `geom_histogram()` to change the number of bins in the histogram.

Change the colour of the inside of the bins to "darkred". Do you think that the colour of the inside of the bins maps to `colour` or `fill`? Try both!

There are a couple of observations with very high vote values. What could explain these large outliers?

<br>

Another graph useful in visualizing a single quantitative variable is a frequency plot. The code to make a frequency plot is given below. We are simply replacing `geom_histogram()` with `geom_freqpoly()`.


```r
ggplot(data = pres_df, mapping = aes(x = Gore)) +
  geom_freqpoly(colour = "black") +
  xlab("Votes for Gore in Florida") 
#> `stat_bin()` using `bins = 30`. Pick better value with
#> `binwidth`.
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-4-1.png)<!-- -->

The frequency plot is just like a histogram but the counts are connected by a line instead of represented with bins. You can see how they relate by including __both__ a geom_freqpoly() and a geom_histogram() in your plot, though it doesn't make for the prettiest graph:


```r
ggplot(data = pres_df, mapping = aes(x = Gore)) +
  geom_freqpoly(colour = "black") +
  xlab("Votes for Gore in Florida") +
  geom_histogram() 
#> `stat_bin()` using `bins = 30`. Pick better value with
#> `binwidth`.
#> `stat_bin()` using `bins = 30`. Pick better value with
#> `binwidth`.
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->

### `R` Code Style

We want our code to be as readable as possible. This not only benefits other people who may read your code (like me), but it also benefits you, particularly if you read your own code in the future. I try to follow the Style Guide in the Advanced `R` book: <a href="http://adv-r.had.co.nz/Style.html" target="_blank">http://adv-r.had.co.nz/Style.html</a>. Feel free to skim through that, but you don't need to worry about it too much: you should be able to pick up on some important elements just from going through this course. You might actually end up having better code style if you _haven't_ had any previous coding experience.

As a quick example of why code style can be important, consider the following two code chunks, both of which produce the same graph.


```r
ggplot(data=pres_df,mapping=aes(x=Gore))+geom_histogram(colour="black",fill="white")+
  xlab("Votes for Gore in Florida")
```


```r
ggplot(data = pres_df, mapping = aes(x = Gore)) +
  geom_histogram(colour = "black", fill = "white") +
  xlab("Votes for Gore in Florida")
```

Which code chunk would you want to read two years from now? Which code chunk would you want your classmate/friend/coworker to read? (assuming you like your classmate/friend/coworker....)

### Bar Plots for a Categorical Variable

Recall from STAT 113 that bar plots are useful if you want to examine the distribution of one categorical variable. Side-by-side bar plots or stacked bar plots are plots that are useful for looking at the relationship between two categorical variables. There actually aren't any categorical variables that would be interesting to plot in this data set, so we'll make one, called `winner` using code that we don't need to understand until next week. `winner` will be `"Gore"` if Gore won the county and `"Bush"` if Bush won the county. We'll name this new data set `pres_cat`.


```r
pres_cat <- pres_df |> mutate(winner = if_else(Gore > Bush,
                                                true = "Gore",
                                                false = "Bush"))
pres_cat
#> # A tibble: 67 x 7
#>      Gore   Bush Buchanan Nader Other County    winner
#>     <dbl>  <dbl>    <dbl> <dbl> <dbl> <chr>     <chr> 
#>  1  47365  34124      263  3226   751 ALACHUA   Gore  
#>  2   2392   5610       73    53    26 BAKER     Bush  
#>  3  18850  38637      248   828   242 BAY       Bush  
#>  4   3075   5414       65    84    35 BRADFORD  Bush  
#>  5  97318 115185      570  4470   852 BREVARD   Bush  
#>  6 386561 177323      788  7101  1623 BROWAR    Gore  
#>  7   2155   2873       90    39    17 CALHOUN   Bush  
#>  8  29645  35426      182  1462   181 CHARLOTTE Bush  
#>  9  25525  29765      270  1379   261 CITRUS    Bush  
#> 10  14632  41736      186   562   237 CLAY      Bush  
#> # … with 57 more rows
```

Using this data set, we can make a bar plot with `geom_bar()`. The beauty of `ggplot()` is that the code is super-similar to what we used for histograms and frequency plots!


```r
ggplot(data = pres_cat, aes(x = winner)) +
  geom_bar()
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-9-1.png)<!-- -->

Note that, sometimes, data are in format such that one column contains the _levels_ of the categorical variable while another column contains the counts directly. For example, we can create such a data set using code that we will learn next week:


```r
pres_cat2 <- pres_cat |> group_by(winner) |>
  summarise(nwins = n())
pres_cat2
#> # A tibble: 2 x 2
#>   winner nwins
#>   <chr>  <int>
#> 1 Bush      51
#> 2 Gore      16
```

This data set has just two observations and contains a column for the two major presidential candidates and a column for the number of counties that each candidate won. If we wanted to make a barplot showing the number of wins for each candidate, we can't use `geom_bar()`. Predict what the result will be from running the following code.


```r
ggplot(pres_cat2, aes(x = winner)) +
  geom_bar()
```

Instead, we can use `geom_col()`, which takes an `x` aesthetic giving the column with names of the levels of our categorical variable, and a `y` aesthetic giving the column with the counts:


```r
ggplot(pres_cat2, aes(x = winner, y = nwins)) +
  geom_col()
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-12-1.png)<!-- -->

### Exercises {#exercise-2-1}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-2).

1. Change the frequency plot to plot the number of votes for Bush instead of the number for Gore. Are there any obvious outliers in the Bush frequency plot?

2. Do you have a preference for histograms or a preference for frequency plots? Can you think of a situation where one would be more desirable than the other?

3. It looks like Bush won a lot more....does that necessarily mean that Bush won more votes in total in Florida? Why or why not?

We will be using survey data from STAT 113 in the 2018-2019 academic year for many exercises in this section. For those who may not have taken STAT 113 from having AP credit or another reason, the STAT 113 survey is given to all students in STAT 113 across all sections. Some analyses in Intro Stat are then carried out using the survey. 


```r
library(tidyverse)
stat113_df <- read_csv("data/stat113.csv")
head(stat113_df)
#> # A tibble: 6 x 12
#>   Year  Sex     Hgt   Wgt Haircut   GPA Exercise Sport    TV
#>   <chr> <chr> <dbl> <dbl>   <dbl> <dbl>    <dbl> <chr> <dbl>
#> 1 Soph… M        66   155       0  2.9        15 Yes       8
#> 2 Firs… F        69   170      17  3.87       14 Yes      12
#> 3 Firs… F        64   130      40  3.3         5 No        5
#> 4 Firs… M        68   157      35  3.21       10 Yes      15
#> 5 Firs… M        72   175      20  3.1         2 No        5
#> 6 Juni… F        62   150      50  3.3         8 Yes       5
#> # … with 3 more variables: Award <chr>, Pulse <dbl>,
#> #   SocialMedia <chr>
```

The data set contains the following variables:

* `Year`, FirstYear, Sophomore, Junior, or Senior
* `Sex`, M or F (for this data set, `Sex` is considered binary).
* `Hgt`, height, in inches.
* `Wgt`, weight, in pounds.
* `Haircut`, how much is paid for a haircut, typically.
* `GPA`
* `Exercise`, amount of hours of exercise in a typical week.
* `Sport`, whether or not the student plays a varsity sport.
* `TV`, amount of hours spent watching TV in a typical week.
* `Award`, Award preferred: choices are Olympic Medal, Nobel Prize, or Academy Award.
* `Pulse`, pulse rate, in beats per minute.
* `SocialMedia`, most used social media platform (Instagram, SnapChat, FaceBook, Twitter, Other, or None).

4. \* Create a histogram of the `Exercise` variable, change the x-axis label to be "Exercise (hours per typical week)", change the number of `bins` to `14`, and change the `fill` of the bins to be "lightpink2" and the outline `colour` of the bins to be black.

5. \* We can change the y-axis of a histogram to be "density" instead of a raw count. This means that each bar shows a __proportion__ of cases instead of a raw count. Google something like "geom_histogram with density" to figure out how to create a y `aes()` to show density instead of count.

6. Construct a histogram using a quantitative variable of your choice. Change the `fill` and `colour` using <a href="http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf" target="_blank">http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf</a> to help you choose colours. 



7. Construct a bar plot for a variable of your choosing. What do you find?



8. What format would the STAT 113 data set need to be in to construct your bar plot with `geom_col()` instead of `geom_bar()`?

## Graphing Two Quantitative Variables, Faceting, and `aes()` Options

### Scatterplots

Moving back to the 2000 presidential election data set, thus far, we've figured out that there a couple of counties with very large numbers of votes for Gore and very large number of votes for Bush. We don't know the reason for this (if some counties are very democratic, very republican, or if some counties are just more populous). Do the counties that have a large number of votes for Bush also tend to have a large number of votes for Gore? And what about the other candidates: do they have any interesting patterns?

Let's start by making a scatterplot of the number of votes for Gore and the number of votes for Bush. Note that the `geom_` for making a scatterplot is called `geom_point()` because we are adding a layer of points to the plot.


```r
ggplot(data = pres_df, mapping = aes(x = Gore, y = Bush)) +
  geom_point()
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-16-1.png)<!-- -->

What patterns do you see in the scatterplot?

Now, change the x variable from `Gore` to `Buchanan`. You should notice something strange in this scatterplot. Try to come up with one explanation for why the outlying point has so many votes for `Buchanan`.

In trying to come up with an explanation, it would be nice to figure out which Florida county has that outlying point and it would be nice if we knew something about Florida counties. To remedy the first issue, recall that we can type `View(pres_df)` to pull up the data set. Once you have the new window open, click on the column heading `Buchanan` to sort the votes for Buchanan from high to low to figure out which county is the outlier.

Use some Google sleuthing skills to find an explanation: try to search for "2000 united states presidential election [name of outlier county]". Write a sentence about what you find. Hint: if nothing useful pops up, try adding the term "butterfly ballot" to your search.

<br>

We have used the 2000 Presidential data set to find out something really interesting! In particular, we have used _exploratory data analysis_ to examine a data set, without having a specific question of interest that we want to answer. This type of exploring is often really useful, but does have some drawbacks, which we will discuss later in the semester.

### Aesthetics in `aes()`

For the remainder of this chapter, we will work with some fitness data collected from my Apple Watch since November 2018. The `higham_fitness_clean.csv` contains information on the following variables:

* `Start`, the month, day, and year that the fitness data was recorded on
* `month`, the month
* `weekday`, the day of the week
* `dayofyear`, the day of the year (so that 304 corresponds to the 304th day of the year)
* `distance`, distance walked in miles
* `steps`, the number of steps taken
* `flights`, the number of flights of stairs climbed
* `active_cals`, the number of calories burned from activity
* `stepgoal`, whether or not I reached 10,000 steps for the day
* `weekend_ind`, a variable for whether or not the day of the week was a weekend day (Saturday or Sunday) or a weekday (Monday - Friday).


```r
library(tidyverse)
fitness_full <- read_csv("data/higham_fitness_clean.csv") |> mutate(weekend_ind = case_when(weekday == "Sat" | weekday == "Sun" ~ "weekend",
  TRUE ~ "weekday"))
#> 
#> ── Column specification ────────────────────────────────────
#> cols(
#>   Start = col_date(format = ""),
#>   month = col_character(),
#>   weekday = col_character(),
#>   dayofyear = col_double(),
#>   distance = col_double(),
#>   steps = col_double(),
#>   flights = col_double(),
#>   active_cals = col_double(),
#>   stepgoal = col_character()
#> )
```

First, let's make a basic scatterplot to illustrate why it's so important to plot your data. I'll use the variable `distance` as the x-variable and `active_cals` as the y-variable.


```r
ggplot(data = fitness_full, aes(x = distance, y = active_cals)) +
  geom_point()
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-18-1.png)<!-- -->

One aspect of the plot that you may notice is that there are observations where I burned 0 or very few active calories, yet walked/jogged/ran/moved some distance. Is it possible to not burn any calories and move ~ 4 miles? Probably not, so let's drop these observations from the data set and make a note of why we dropped those observations. Unfortunately, we don't have the tools to do this yet, so just run the following chunk of code without worrying too much about the syntax.


```r
## drop observations that have active calories < 50. 
## assuming that these are data errors or 
## days where the Apple Watch wasn't worn.
fitness <- fitness_full |>
  filter(active_cals > 50)
```

Let's make the plot again with the `fitness` data set instead of `fitness_full` to see if the outliers are actually gone. This time, we will put the `aes()` in the `geom_point()` function:


```r
ggplot(data = fitness) +
  geom_point(aes(x = distance, y = active_cals))
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-20-1.png)<!-- -->

Putting the `aes()` in `ggplot()` and putting the `aes()` in `geom_point()` results in the same graph in this case. When you put the `aes()` in `ggplot()`,  `R` perpetuates these `aes()` aesthetics in all `geom_    `s in your plotting command. However, if you put your `aes()` in `geom_point()`, then any future `geom    `s that you use will need you to re-specify different `aes()`. We'll see an example of this in the exercises.

__Other `aes()` Options__

In addition to `x` and `y`, we can also use `aes()` to map variables to things like `colour`, `size`, and `shape`. For example, we might make a scatterplot with `Start` on the x-axis (for the date) and `active_cals` on the y-axis, colouring by whether or not the day of the week was a weekend.


```r
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, colour = weekend_ind))
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-21-1.png)<!-- -->

Is there anything useful that you notice about the plot? Is there anything about the plot that could be improved?

Instead of using colour, you can also specify the point shape. This could be useful, for example, if you are printing something in black and white.


```r
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, shape = weekend_ind))
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-22-1.png)<!-- -->

Do you prefer the colour or the shape? Why?

Finally, another common `aes()` is `size`. For example, we could make the size of the points in the scatterplot change depending on how many `flights` of stairs I climbed.


```r
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, size = flights))
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-23-1.png)<!-- -->

I don't think any of the previous three plots are necessarily the "best" and need some work, but, part of the fun of exploratory data analysis is making trying out different plots to see what "works."

__Inside vs Outside `aes()`__

We've changed the colour of the points to correspond to `weekend_ind`, but what if we just wanted to change the colour of points to all be the same colour, `"purple"`. Try running the following code chunk:


```r
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, colour = "purple"))
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-24-1.png)<!-- -->

What does the graph look like? Did it do what you expected?

Putting `colour = ____` inside `aes()` or outside `aes()` achieves different things. In general,

* when we want to map something in our data set (`fitness`) to something in our plot (`x`, `y`, `colour`, `size`, etc.), we put that __inside__ the `aes()` as in `geom_point(aes(colour = weekend_ind))`. 

* When we assign fixed characteristics that don't come from the data, we put them __outside__ the `aes()`, as in `geom_point(colour = "purple")`. 

You can also change the overall point size and shape. The standard size is `1` so the following code chunk makes the points bigger. The standard shape is `19`: you can try changing that to other integers to see what other shapes you can get.


```r
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals), size = 1.5, shape = 19)
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-25-1.png)<!-- -->

### Using More Than One `geom()`

We might also be interested in fitting a smooth curve to our scatterplot. When we want to put more than one "geom" on our plot, we can use multiple `geoms`. Since I want the `aes()` to apply to __both__ `geom_point()` and `geom_smooth()`, I am going to move the `aes()` command to the overall `ggplot()` line of code:


```r
ggplot(data = fitness, aes(x = Start, y = active_cals)) +
  geom_point() +
  geom_smooth()
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-26-1.png)<!-- -->

Within `geom_smooth()`, you can set `se = FALSE` to get rid of the grey standard errors around each of the lines, and you can set`method = "lm"` to fit straight linear regression lines instead of smooth curves:


```r
ggplot(data = fitness, aes(x = Start, y = active_cals)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
#> `geom_smooth()` using formula 'y ~ x'
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-27-1.png)<!-- -->

Does it look like there is an increasing overall trend? decreasing? Does it make sense to use a line to model the relationship or did you prefer the smooth curve?

### Line Plots with `geom_line()`

Line plots are often useful when you have a quantitative variable that you'd like to explore over time. The y-axis is the quantitative variable while the x-axis is typically time. More generally, line plots are often used when the x-axis variable has one discrete value for each y-axis variable. For example, suppose we want to explore how my step count has changed through time over the past couple of years. Compare the standard scatterplot with the following line plot: which do you prefer?


```r
ggplot(data = fitness, mapping = aes(x = Start, y = steps)) +
  geom_point() + geom_smooth() + xlab("Date")
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-28-1.png)<!-- -->

```r
ggplot(data = fitness, mapping = aes(x = Start, y = steps)) +
  geom_line() + geom_smooth() + xlab("Date")
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-28-2.png)<!-- -->

Can you spot the start of the pandemic in the graph? What seemed to happen with the step count?

### Faceting

Using colour to colour points of different levels of a categorical variable is generally fine when there are just a couple of levels and/or there is little overlap among the levels. But, what if there are a lot more than two categories to colour by. For example, let's move back to the STAT 113 survey data set and investigate the relationship between `Pulse` and `Exercise` for different class `Year`'s. We might hypothesize that students who get more exercise tend to have lower pulse rates.


```r
ggplot(data = stat113_df, aes(x = Exercise, y = Pulse,
                           colour = Year)) +
  geom_point() +
  geom_smooth(se = TRUE)
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
#> Warning: Removed 40 rows containing non-finite values
#> (stat_smooth).
#> Warning: Removed 40 rows containing missing values
#> (geom_point).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-29-1.png)<!-- -->

When there are many different categories for a categorical variable (there are only 4 categories for `Year`, but this particular plot is still a bit difficult to read), it can sometimes be useful to `facet` the plot by that variable instead of trying to use different `colour`s or `shape`s.


```r
ggplot(data = stat113_df, aes(x = Exercise, y = Pulse)) +
  geom_point() +
  geom_smooth(se = TRUE) +
  facet_wrap(~ Year)
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
#> Warning: Removed 40 rows containing non-finite values
#> (stat_smooth).
#> Warning: Removed 40 rows containing missing values
#> (geom_point).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-30-1.png)<!-- -->

We have eliminated the `colour = ` argument and added `facet_wrap( ~ name_of_facet_variable)`. Doing so creates a different scatterplot and smooth line for each level of `name_of_facet_variable`. 

What can you see from this plot that was harder to see from the plot with colour?

Does the data seem to support the hypothesis that more exercise is associated with lower pulse rates in this sample of students?

### Exercises {#exercise-2-2}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-2).

1. Fix the code chunk where we tried to specify the colour of all points to be purple to actually make all of the points "purple" by moving `colour = "purple"` outside the parentheses in `aes()` (but still inside `geom_point()`).

2. In the console (bottom-left) window, type `?geom_smooth` and scroll down to "Arguments." Find `span`, read about it, and then, within the  `geom_smooth()` argument of the line plot with steps vs. date, add a `span` argument to make the smooth line wigglier. 

3. Explain why it doesn't make sense to construct a line plot of `Exercise` vs. `GPA`.

4. \* Make a scatterplot of `Hgt` on the y-axis and `Wgt` on the x-axis, colouring by `Sport`. Add a smooth fitted curve to your scatterplot. Then, move `colour = Sport` from an `aes()` in the `ggplot()` function to an `aes()` in the `geom_point()` function. What changes in the plot? Can you give an explanation as to why that change occurs?

5. \* Faceting can be used for other types of plots too! Make a pair of faceted histograms for a quantitative variable of your choosing that are faceted by a categorical variable of your choosing.

<br>

## Boxplots, Stacked Barplots and Others

There are a few other common geoms that will be useful throughout the semester. These only skim the surface: we'll come back to plotting in a few weeks, after we're able to do more with data wrangling and reshaping.

### Graphing a Quant. Variable vs. a Cat. Variable 

Another common plot used in Intro Stat courses is a boxplot. Side-by-side boxplots are particularly useful if you want to compare a quantitative response variable across two or more levels of a categorical variable. Let's stick with the STAT 113 survey data to examine the relationship between `Exercise` and `Award` preference.


```r
ggplot(data = stat113_df, aes(x = Award, y = Exercise)) +
  geom_boxplot()
#> Warning: Removed 7 rows containing non-finite values
#> (stat_boxplot).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-31-1.png)<!-- -->

What can you conclude from the plot?

<br>

An alternative to side-by-side boxplots are violin plots:


```r
ggplot(data = stat113_df, aes(x = Award, y = Exercise)) +
  geom_violin()
#> Warning: Removed 7 rows containing non-finite values
#> (stat_ydensity).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-32-1.png)<!-- -->

Read about Violin plots by typing `?geom_violin` into your console (bottom-left window). How are they different than boxplots?

### Graphing Two Categorical Variables

The only combination of two variables that we have yet to explore are two variables that are both categorical. Let's look at the relationship between `Year` and `SocialMedia` first using a stacked bar plot.

To make the graph, we specify `position = "fill"` so that the bars are "filled" by `stepgoal`.


```r
ggplot(data = stat113_df, aes(x = Year, fill = SocialMedia)) +
  geom_bar(position = "fill") +
  ylab("Proportion")
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-33-1.png)<!-- -->

What patterns do you notice from the plot? Is there anything about the plot that could be improved?

### Exercises {#exercise-2-3}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-2).

1. \* Change the colour of the inside of the boxplots in the Exercise vs. Award graph to be `"blue"`. Do you think you'll use `colour = "blue"` or `fill = "blue"`?

2. \* Create a side-by-side boxplot that compares the `GPA`s of students who prefer different `Award`s. Then change the fill of the boxplot to be a colour of your choice. What do you notice in the plot?

3. \* When making the previous plot, `R` gives us a warning message that it "Removed 70 rows containing non-finite values". This is `R`'s robotic way of telling us that 70 `GPA` values are missing in the data set. Use what you know about how the data was collected (Fall and Spring semester of the 2018-2019 school-year) to guess why these are missing.

4. \* Make a stacked bar plot for two variables of your choosing in the STAT 113 data set. Comment on something that you notice in the plot.

## Chapter Exercises {#chapexercise-2}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-2).

1. \* The default of `geom_smooth()` is to use LOESS (locally estimated scatterplot smoothing). Read about LOESS here: <a href="https://19january2017snapshot.epa.gov/sites/production/files/2016-07/documents/loess-lowess.pdf" target="_blank">here</a>. Write one or two sentences explaining what LOESS does.

2. \* Thus far, we have only faceted by a single variable. Use Google to figure out how to facet by two variables to make a plot that shows the relationship between GPA (y-axis) and Exercise (x-axis) with four facets: one for male students who play a sport, one for female students who play a sport, one for male students who do not play a sport, and one for female students who do not play a sport.

3. \* In Intro-Stat, boxplots are typically introduced using the `*` symbol to identify outliers. Using a combination of the help `?geom_boxplot` and Googling "R point shapes", figure out how to modify your side-by-side boxplots so that the outliers are shown using `*`, not the default dots. 

Then, using Google, figure out how to add the mean to each boxplot as a "darkgreen" diamond-shaped symbol with `stat_summary()`.

4. A common theme that we'll see throughout the course is that it's advantageous to know as much background information as possible about the data set we are analyzing. Data sets will be easier to analyze and pose questions about if you're familiar with the subject matter. 

Give an example of something that you know about STAT 113 and the survey data set that helped you answer or pose a question that someone from another university (and therefore unfamiliar with our intro stat course) wouldn't know.

Give an example of something that you don't know about the fitness data set that the person who owns the fitness data would know. Why does that give an advantage to the person who is more familiar with the fitness data?

## Exercise Solutions {#solutions-2}

### Introduction  etc. S

### Basic Plot Structure S

### Graphing a Single Variable S

4. \* Create a histogram of the `Exercise` variable, change the x-axis label to be "Exercise (hours per typical week)", change the number of `bins` to `14`, and change the `fill` of the bins to be "lightpink2" and the outline `colour` of the bins to be black.


```r
ggplot(data = stat113_df, aes(x = Exercise)) +
  geom_histogram(bins = 14, fill = "lightpink2", colour = "black") +
  xlab("Exercise (hours per typical week)")
#> Warning: Removed 7 rows containing non-finite values
#> (stat_bin).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-34-1.png)<!-- -->

5. \* We can change the y-axis of a histogram to be "density" instead of a raw count. This means that each bar shows a __proportion__ of cases instead of a raw count. Google something like "geom_histogram with density" to figure out how to create a y `aes()` to show density instead of count.


```r
ggplot(data = stat113_df, aes(x = Exercise, y = ..density..)) +
  geom_histogram(bins = 14, fill = "lightpink2", colour = "black") +
  xlab("Exercise (hours per typical week)")
#> Warning: Removed 7 rows containing non-finite values
#> (stat_bin).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-35-1.png)<!-- -->

### Graphing Two Quant. etc. S

4. \* Make a scatterplot of `Hgt` on the y-axis and `Wgt` on the x-axis, colouring by `Sport`. Add a smooth fitted curve to your scatterplot. Then, move `colour = Sport` from an `aes()` in the `ggplot()` function to an `aes()` in the `geom_point()` function. What changes in the plot? Can you give an explanation as to why that change occurs?


```r
ggplot(data = stat113_df, aes(x = Wgt, y = Hgt, colour = Sport)) +
  geom_point() +
  geom_smooth()
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-36-1.png)<!-- -->

```r

ggplot(data = stat113_df, aes(x = Wgt, y = Hgt)) +
  geom_point(aes(colour = Sport)) +
  geom_smooth()
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-36-2.png)<!-- -->

The points are now coloured by `Sport` but there is only one smooth fitted line. This makes sense because `geom_point()` now has the two global aesthetics x and y, as well as the colour aesthetic. `geom_smooth()` no longer has the colour aesthetic but still inherits the two global aesthetics, x and y.

5. \* Faceting can be used for other types of plots too! Make a pair of faceted histograms for a quantitative variable of your choosing that are faceted by a categorical variable of your choosing.

Answers will vary:


```r
ggplot(data = stat113_df, aes(x = GPA)) + 
  geom_histogram(bins = 15) +
  facet_wrap( ~ Sport)
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-37-1.png)<!-- -->

### Boxplots, Stacked, etc. S

1. \* Change the colour of the inside of the boxplots in the Exercise vs. Award graph to be `"blue"`. Do you think you'll use `colour = "blue"` or `fill = "blue"`?


```r
ggplot(data = stat113_df, aes(x = Award, y = Exercise)) +
  geom_boxplot(fill = "blue")
#> Warning: Removed 7 rows containing non-finite values
#> (stat_boxplot).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-38-1.png)<!-- -->

`fill` because it's the inside of the boxplots that we want to modify. `colour` will modify the outline colour. 

2. \* Create a side-by-side boxplot that compares the `GPA`s of students who prefer different `Award`s. Then change the fill of the boxplot to be a colour of your choice. What do you notice in the plot?


```r
ggplot(data = stat113_df, aes(x = Award, y = GPA)) +
  geom_boxplot(fill = "lightpink1")
#> Warning: Removed 70 rows containing non-finite values
#> (stat_boxplot).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-39-1.png)<!-- -->

There are a few outlier students, but the three groups overall seem to have similar GPAs.

3. \* When making the previous plot, `R` gives us a warning message that it "Removed 70 rows containing non-finite values". This is `R`'s robotic way of telling us that 70 `GPA` values are missing in the data set. Use what you know about how the data was collected (Fall and Spring semeseter of the 2018-2019 school-year) to guess why these are missing.

STAT 113 has first-year students: first-years taking the course in the fall would not have a GPA to report. Additionally, another reason might be that a student chose not to report his or her GPA.

4. \* Make a stacked bar plot for two variables of your choosing in the STAT 113 data set. Comment on something that you notice in the plot.

Answers will vary.


```r
ggplot(data = stat113_df, aes(x = Sport, fill = Award)) +
  geom_bar(position = "fill")
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-40-1.png)<!-- -->

As we might expect, it does seem like a higher proportion of students who play a sport would prefer to win an Olympic medal, compared with students who do not play a sport.

### Chapter Exercises S {#chapexercise-2-S}

1. \* The default of `geom_smooth()` is to use LOESS (locally estimated scatterplot smoothing). Read about LOESS here: <a href="https://19january2017snapshot.epa.gov/sites/production/files/2016-07/documents/loess-lowess.pdf" target="_blank">here</a>. Write one or two sentences explaining what LOESS does.

Loess uses a bunch of local regressions to predict the y-variable at each point, giving more weight to observations near the point of interest on the x-axis. Once this is done for every point, the predictions are connected with a smooth curve. 

2. \* Thus far, we have only faceted by a single variable. Use Google to figure out how to facet by two variables to make a plot that shows the relationship between GPA (y-axis) and Exercise (x-axis) with four facets: one for male students who play a sport, one for female students who play a sport, one for male students who do not play a sport, and one for female students who do not play a sport.


```r
ggplot(data = stat113_df |> filter(!is.na(Sport) & !is.na(Sex)),
  aes(x = Exercise, y = GPA)) + 
  geom_point() + geom_smooth() +
  facet_grid(Sex ~ Sport)
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
#> Warning: Removed 71 rows containing non-finite values
#> (stat_smooth).
#> Warning: Removed 71 rows containing missing values
#> (geom_point).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-41-1.png)<!-- -->

3. \* In Intro-Stat, boxplots are typically introduced using the `*` symbol to identify outliers. Using a combination of the help `?geom_boxplot` and Googling "R point shapes", figure out how to modify your side-by-side boxplots so that the outliers are shown using `*`, not the default dots. 

Then, using Google, figure out how to add the mean to each boxplot as a "darkgreen" diamond-shaped symbol with `stat_summary()`.


```r
ggplot(data = stat113_df, aes(x = Sex, y = GPA)) +
  geom_boxplot(fill = "lightpink1", outlier.shape = 8) +
  stat_summary(fun = mean, shape = 18, colour = "darkgreen")
#> Warning: Removed 70 rows containing non-finite values
#> (stat_boxplot).
#> Warning: Removed 70 rows containing non-finite values
#> (stat_summary).
#> Warning: Removed 3 rows containing missing values
#> (geom_segment).
```

![](02-ggplot2_files/figure-epub3/unnamed-chunk-42-1.png)<!-- -->

## Non-Exercise `R` Code {#rcode-2}


```r
library(tidyverse)
pres_df <- read_table("data/PRES2000.txt") 
## don't worry about the `read_table` function....yet
head(pres_df)
ggplot(data = pres_df, mapping = aes(x = Gore)) +
  geom_histogram(colour = "black", fill = "white") +
  xlab("Votes for Gore in Florida")
ggplot(data = pres_df, mapping = aes(x = Gore)) +
  geom_freqpoly(colour = "black") +
  xlab("Votes for Gore in Florida") 
ggplot(data = pres_df, mapping = aes(x = Gore)) +
  geom_freqpoly(colour = "black") +
  xlab("Votes for Gore in Florida") +
  geom_histogram() 
pres_cat <- pres_df |> mutate(winner = if_else(Gore > Bush,
                                                true = "Gore",
                                                false = "Bush"))
pres_cat
ggplot(data = pres_cat, aes(x = winner)) +
  geom_bar()
pres_cat2 <- pres_cat |> group_by(winner) |>
  summarise(nwins = n())
pres_cat2
ggplot(pres_cat2, aes(x = winner)) +
  geom_bar()
ggplot(pres_cat2, aes(x = winner, y = nwins)) +
  geom_col()
ggplot(data = pres_df, mapping = aes(x = Gore, y = Bush)) +
  geom_point()
library(tidyverse)
fitness_full <- read_csv("data/higham_fitness_clean.csv") |> mutate(weekend_ind = case_when(weekday == "Sat" | weekday == "Sun" ~ "weekend",
  TRUE ~ "weekday"))
ggplot(data = fitness_full, aes(x = distance, y = active_cals)) +
  geom_point()
## drop observations that have active calories < 50. 
## assuming that these are data errors or 
## days where the Apple Watch wasn't worn.
fitness <- fitness_full |>
  filter(active_cals > 50)
ggplot(data = fitness) +
  geom_point(aes(x = distance, y = active_cals))
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, colour = weekend_ind))
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, shape = weekend_ind))
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, size = flights))
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals, colour = "purple"))
ggplot(data = fitness) +
  geom_point(aes(x = Start, y = active_cals), size = 1.5, shape = 19)
ggplot(data = fitness, aes(x = Start, y = active_cals)) +
  geom_point() +
  geom_smooth()
ggplot(data = fitness, aes(x = Start, y = active_cals)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
ggplot(data = fitness, mapping = aes(x = Start, y = steps)) +
  geom_point() + geom_smooth() + xlab("Date")
ggplot(data = fitness, mapping = aes(x = Start, y = steps)) +
  geom_line() + geom_smooth() + xlab("Date")
ggplot(data = stat113_df, aes(x = Exercise, y = Pulse,
                           colour = Year)) +
  geom_point() +
  geom_smooth(se = TRUE)
ggplot(data = stat113_df, aes(x = Exercise, y = Pulse)) +
  geom_point() +
  geom_smooth(se = TRUE) +
  facet_wrap(~ Year)
ggplot(data = stat113_df, aes(x = Award, y = Exercise)) +
  geom_boxplot()
ggplot(data = stat113_df, aes(x = Award, y = Exercise)) +
  geom_violin()
ggplot(data = stat113_df, aes(x = Year, fill = SocialMedia)) +
  geom_bar(position = "fill") +
  ylab("Proportion")
```
