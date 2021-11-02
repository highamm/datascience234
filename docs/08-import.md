# Reprexes and Import

__Goals:__

* Use `tibble` to create data sets in `R`, and describe the benefits of __reprexes__.

* Use `readr` to read in data to `R` from .csv, .txt, and .tsv files.

* Use `rvest` to scrape data from public websites.

* Use `jsonlite` to read in data in JSON (Java Script Object Notation) files.

## Reprexes and `tibble`

We can also create a data set directly within `R` with the `tibble()` function in the `tibble` package. This is most useful when we want to make a small reproducible example so that someone else may help with our code.

A _reproducible example_, or __reprex__, is a chunk of code that we can give to someone else that runs without any outside data. These are used often on StackExchange. The following code chunk is __not__ a reprex because people would not necessarily have the data set `parsedf.csv`.


```r
## Hello! How do I get rid of the units from the values in
## my variable `x`? Thanks!
library(tidyverse)
test_df <- read_csv("data/parsedf.csv")
head(test_df)
#> # A tibble: 3 x 2
#>   x                   y
#>   <chr>           <dbl>
#> 1 20,000 dollars      1
#> 2 40 dollars          2
#> 3 only 13 dollars     3
```

We want to post on StackExchange for someone to help us convert a variable from a character vector with units to a numeric vector without units. We want to be able to give any possible helpers a small example data set to work with. For this, we can create our own tiny data set with `tibble()`:


```r
## Hello! How do I get rid of the units from the values in
## my variable `xvar`? Thanks!
library(tidyverse)
test_df2 <- tibble(xvar = c("20,000 dollars", "40 dollars"),
                   yvar = c(1, 2))
test_df2
#> # A tibble: 2 x 2
#>   xvar            yvar
#>   <chr>          <dbl>
#> 1 20,000 dollars     1
#> 2 40 dollars         2
```

Why is `library(tidyverse)` necessary in the code chunk above for my reprex?

We can copy and paste the code chunk above to our question: it's code that anyone can run as long as they have the `tidyverse` package installed, and really encourages more people to help. 

### Exercises {#exercise-8-1}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-8).

For Project 2, we will work with some course evaluation data for a professor at SLU. Overall, you'll answer some questions about how the professor can improve their courses at SLU by looking at course evaluation data. The variables and data set will be described in more detail in the project description.

1. \* Suppose that you can't figure out how to create a semester variable and a year variable from `Term` in `evals_prof_S21.csv`. (You want to split the `Term` variable into two variables: `Semester` with levels `F` and `S` and `Year` with levels `19`, `20`, and `21`).


```r
library(tidyverse)
evals_df <- read_csv("data/evals_prof_S21.csv")
head(evals_df)
#> # A tibble: 6 x 10
#>   Term  Course Question               `Agree strongly` Agree
#>   <chr> <chr>  <chr>                             <dbl> <dbl>
#> 1 F19   113-02 1. Course has been a …                9     9
#> 2 F19   113-02 2. Effectively Organi…               12     8
#> 3 F19   113-02 3. Environment Conduc…               11     8
#> 4 F19   113-02 5a. Fair Assessment o…                5    13
#> 5 F19   113-02 5b. Timely Assessment…                8    12
#> 6 F19   113-02 5c. Constructive Asse…                5     8
#> # … with 5 more variables: Agree Somewhat <dbl>,
#> #   Neutral <dbl>, Disagree Somewhat <dbl>, Disagree <dbl>,
#> #   Disagree Strongly <dbl>
```

Put together a reprex using `tibble()` that someone would be able to run to help you figure out your question.

2. \* You should actually be able to answer your own question using a function that we learned a couple of weeks ago. Do so, creating a `Semester` and `Year` variable.


## `readr` to Read in Data 

Up to now, we have mostly worked with data that was "`R` Ready": meaning that it was in a nice .csv file that could be read into `R` easily with `read_csv()` from the `readr` package. We will begin by looking at some options in the `read_csv()` function and then move into formats other than .csv that data are commonly stored in.

### `read_csv()` Options

The `mtcarsex.csv` has observations on different car models with variables that include things like gas mileage, number of cylinders, etc. Read in the `mtcarsex.csv` data set with the following code. Then, examine the data set with `head()`.


```r
library(tidyverse)
cars_df <- read_csv("data/mtcarsex.csv")
head(cars_df)
#> # A tibble: 6 x 11
#>   `This is a data… ...2  ...3  ...4  ...5  ...6  ...7  ...8 
#>   <chr>            <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#> 1 "I'm a na\x95ve… <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
#> 2 "mpg"            cyl   disp  hp    drat  wt    qsec  vs   
#> 3  <NA>            <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
#> 4  <NA>            <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
#> 5 "-999"           6     160   110   3.9   2.62  16.46 0    
#> 6 "21"             6     160   110   3.9   2.875 17.02 0    
#> # … with 3 more variables: ...9 <chr>, ...10 <chr>,
#> #   ...11 <chr>
```

What do you notice about the data set that seems odd? Open the .csv file with Excel or some other program to examine the data set outside of `R`.

Type in `?read_csv` in the bottom-left window and look at some of the options in `read_csv()`. In particular, we will use the `na` and the `skip` arguments to fix up our reading.

Let's start with `skip` so that we aren't reading in the first two rows of the data set:


```r
cars_df <- read_csv("data/mtcarsex.csv", skip = 2)
## first two lines will be skipped
head(cars_df)
#> # A tibble: 6 x 11
#>      mpg   cyl  disp    hp  drat    wt  qsec    vs    am
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1   NA      NA    NA    NA NA    NA     NA      NA    NA
#> 2   NA      NA    NA    NA NA    NA     NA      NA    NA
#> 3 -999       6   160   110  3.9   2.62  16.5     0     1
#> 4   21       6   160   110  3.9   2.88  17.0     0     1
#> 5   22.8     4   108    93  3.85  2.32  18.6     1     1
#> 6   21.4     6   258   110  3.08  3.22  19.4     1     0
#> # … with 2 more variables: gear <dbl>, carb <dbl>
```

That looks better, but there are still a couple of problems. What do you notice?

Go the help and read about the `na` argument. Let's add that as an option to fix the missing value issue.


```r
cars_df <- read_csv("data/mtcarsex.csv", na = c(NA, "-999"), skip = 2)
head(cars_df)
#> # A tibble: 6 x 11
#>   mpg   cyl   disp  hp    drat  wt    qsec  vs    am   
#>   <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#> 1 NA    NA    NA    NA    NA    NA    NA    NA    NA   
#> 2 NA    NA    NA    NA    NA    NA    NA    NA    NA   
#> 3 <NA>  6     160   110   3.9   2.62  16.46 0     1    
#> 4 21    6     160   110   3.9   2.875 17.02 0     1    
#> 5 22.8  4     108   93    3.85  2.32  18.61 1     1    
#> 6 21.4  6     258   110   3.08  3.215 19.44 1     0    
#> # … with 2 more variables: gear <chr>, carb <chr>
```

Now look at the classes of each variable. Which classes look like they are incorrect?

We've talked about how to re-specify classes of variables using `mutate()` and the `as.factor()` or `as.Date()` or `as.numeric()` functions, but sometimes it's easier just to respecify the class when we are reading in the data. Notice how, when we use `read_csv()`, `R` gives us a message about each of the column types. This is actually an argument in `read_csv()` called `col_types`. `R` prints it so that it's easy for us to copy and paste it into `read_csv()` and change any classes. For example, notice how `cyl = col_double()` is changed to `cyl = col_factor()` in the code chunk below:


```r
cars_df <- read_csv("data/mtcarsex.csv", na = c(NA, "-999"), skip = 2,
  col_types = cols(
  mpg = col_double(),
  cyl = col_factor(),
  disp = col_double(),
  hp = col_double(),
  drat = col_double(),
  wt = col_double(),
  qsec = col_double(),
  vs = col_factor(),
  am = col_double(),
  gear = col_double(),
  carb = col_double()
))
```

Finally, there are two rows with all missing values. These aren't providing anything useful so we can `slice()` them out:


```r
cars_df <- read_csv("data/mtcarsex.csv", na = c(NA, "-999"), skip = 2,
  col_types = cols(
  mpg = col_double(),
  cyl = col_factor(),
  disp = col_double(),
  hp = col_double(),
  drat = col_double(),
  wt = col_double(),
  qsec = col_double(),
  vs = col_factor(),
  am = col_double(),
  gear = col_double(),
  carb = col_double()
)) %>%
  slice(-(1:2))
head(cars_df)
#> # A tibble: 6 x 11
#>     mpg cyl    disp    hp  drat    wt  qsec vs       am
#>   <dbl> <fct> <dbl> <dbl> <dbl> <dbl> <dbl> <fct> <dbl>
#> 1  NA   6       160   110  3.9   2.62  16.5 0         1
#> 2  21   6       160   110  3.9   2.88  17.0 0         1
#> 3  22.8 4       108    93  3.85  2.32  18.6 1         1
#> 4  21.4 6       258   110  3.08  3.22  19.4 1         0
#> 5  NA   8       360   175  3.15  3.44  17.0 0         0
#> 6  18.1 6       225   105  2.76  3.46  20.2 1         0
#> # … with 2 more variables: gear <dbl>, carb <dbl>
```

There are __many__ other possible file formats for data storage. For example, there is a data set called `oscars.tsv`, which is a tab-separated file. You can read it in with `read_tsv()` instead of `read_csv()`. 


```r
oscars_df <- read_tsv("data/oscars.tsv")
head(oscars_df)
#> # A tibble: 6 x 51
#>   FilmName            OscarYear Duration Rating DirectorName
#>   <chr>                   <dbl>    <dbl>  <dbl> <chr>       
#> 1 Crash                    2006      113      4 Haggis      
#> 2 Brokeback Mountain       2006      134      4 Lee         
#> 3 Capote                   2006      114      4 Miller      
#> 4 Good Night, and Go…      2006       93      2 Clooney     
#> 5 Munich                   2006      164      4 Spielberg   
#> 6 The Departed             2007      151      4 Scorsese    
#> # … with 46 more variables: DirectorGender <dbl>,
#> #   OscarWinner <dbl>, GenreName <chr>, Genre_Drama <dbl>,
#> #   Genre_Bio <dbl>, CountryName <chr>,
#> #   ForeignandUSA <dbl>, ProductionName <chr>,
#> #   ProductionCompany <dbl>, BudgetRevised <chr>,
#> #   Budget <chr>, DomesticBoxOffice <dbl>,
#> #   WorldwideRevised <dbl>, WorldwideBoxOffice <dbl>,
#> #   DomesticPercent <dbl>, LimitedOpeningWnd <dbl>,
#> #   LimitedTheaters <dbl>, LimitedAveragePThtr <dbl>,
#> #   WideOpeningWkd <dbl>, WideTheaters <dbl>,
#> #   WideTheaterAverage <dbl>, WidestTheaters <dbl>,
#> #   Days <chr>, Rotten <dbl>, Metacritic <dbl>, IMDb <dbl>,
#> #   CriticAverage <dbl>, MPrinicpalCast <dbl>,
#> #   FPrincipalCast <dbl>, FPercentPrincipalCast <dbl>,
#> #   MLeadTime <dbl>, FLeadTime <dbl>, GuestMLeadTIme <dbl>,
#> #   GuestFLEadTime <dbl>, MLeadPercentinFilm <dbl>,
#> #   FLeadPercentinFilm <dbl>, GMLeadPerinFilm <chr>,
#> #   GFLeadPerinFilm <chr>, M/FDifference <dbl>,
#> #   F/MRatio <dbl>, M/FPercentMore <dbl>, FHighLow <dbl>,
#> #   LeadTime <dbl>, MorF <dbl>, MaleLAA <dbl>,
#> #   FemaleLAA <dbl>
```

You'll be able to work with .txt files and Excel files in the Exercises. Check out <a href="https://rawgit.com/rstudio/cheatsheets/master/data-import.pdf" target="_blank">https://rawgit.com/rstudio/cheatsheets/master/data-import.pdf</a> for a data import cheatsheet. 

The final issue that we will discuss in this section occurs when a data set has units within its cells. Consider the earlier example that we used in the reprex section:


```r
test_df <- read_csv("data/parsedf.csv")
head(test_df)
#> # A tibble: 3 x 2
#>   x                   y
#>   <chr>           <dbl>
#> 1 20,000 dollars      1
#> 2 40 dollars          2
#> 3 only 13 dollars     3
```

The `parse_number()` function is really useful if you just want the number (no commas, no units, etc.). The function is often paired with `mutate()` since we are creating a new variable:


```r
test_df %>% mutate(x2 = parse_number(x))
#> # A tibble: 3 x 3
#>   x                   y    x2
#>   <chr>           <dbl> <dbl>
#> 1 20,000 dollars      1 20000
#> 2 40 dollars          2    40
#> 3 only 13 dollars     3    13
```

### Exercises {#exercise-8-2}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-8).

1. \* The `birthdays.txt` file has information on the birthdays of various animals on my Animal Crossing island. There are also columns for the Animal's Name, Animal Type, and how long the animal has lived on the island (in weeks). Click on the file to open it to look at the format of the data.

Start with the following code chunk and use the options of `read_delim()` to read in the data (`?read_delim`). The `delim` argument that's already provided specifies that the delimiter (separator) that you'll use is a `-`, as opposed to, for example, a `,` in a .csv file. Arguments that you may need to change include 

* `skip`
* `col_names`
* `na`
* `trim_ws`
* `col_types`


```r
library(tidyverse)
df <- read_delim("data/birthdays.txt", delim = " - ")
head(df)
```

2. \* Another common format for data to be stored in is an Excel file. Often, it's easiest just to save the Excel file as a .csv file and read it in using `read_csv()`. But, sometimes this route can be difficult (for example, if your Excel file has thousands of sheets). To read in directly from Excel, you'll need to install the `readxl` with `install.packages("readxl")`. Once installed, load the package with `library(readxl)`, and read in the first sheet `evals_prof.xlsx` data set, the data set used for Project 2, with the `read_excel()` function.

3. \* Now, read in the second sheet in the Excel file, using the help file for `?read_excel` to change one of the arguments.

## Data Scraping with `rvest`

Sometimes, you might want data from a public website that __isn't__ provided in a file format. To obtain this data, you'll need to use web scraping, a term which just means "getting data from a website." The easiest way to do this in `R` is with the `rvest` package. Note that we could spend an entire semester talking about web scraping, but we will focus only on websites where the scraping of data is "easy" and won't give us any major errors.

Go to the following website and suppose that you wanted the table of gun violence statistics in `R`: <a href="https://en.wikipedia.org/wiki/Gun_violence_in_the_United_States_by_state" target="_blank">https://en.wikipedia.org/wiki/Gun_violence_in_the_United_States_by_state</a>. You could try copy-pasting the table into Excel and reading the data set in with `read_excel()`. Depending on the format of the table, that strategy may work but it may not. Another way is to scrape it directly with `rvest`. Additionally, if the website continually updates (standings for a sports league, enrollment data for a school, best-selling products for a company, etc.), then scraping is much more convenient, as you don't need to continually copy-paste for updated data. 

In the following code chunk, `read_html()` reads in the entire html file from the url provided while `html_nodes()` extracts only the tables on the website.


```r
library(tidyverse)
library(rvest)

## provide the URL and name it something (in this case, url).
url <- "https://en.wikipedia.org/wiki/Gun_violence_in_the_United_States_by_state"

## convert the html code into something R can read
h <- read_html(url)

## grabs the tables
tab <- h %>% html_nodes("table")
```

You'll see that, for this example, there are 3 tables provided. The tables are stored in a `list` and we can reference the first table using `[[1]]`, the second table using `[[2]]`, etc. For the purposes of this class, we will figure out which of the 3 tables is the one we actually want using trial and error.

The `html_table()` function converts the table into a `data.frame` object.


```r
test1 <- tab[[1]] %>% html_table()
test2 <- tab[[2]] %>% html_table()
test3 <- tab[[3]] %>% html_table()

head(test1)
head(test2)
head(test3)
```

Which of the 3 tables is the one that we would want to use for an analysis on gun violence in the United States?

As another example, consider scraping data from SLU's athletics page. In particular, suppose we want to do an analysis on SLU's baseball team.

Go to the following website to look at the table of data that we want to scrape: <a href="https://saintsathletics.com/sports/baseball/stats/2021" target="_blank">https://saintsathletics.com/sports/baseball/stats/2021</a>.

After looking at the website, use the following code to scrape the data set.


```r
url <- "https://saintsathletics.com/sports/baseball/stats/2021"
h <- read_html(url)
tab <- h %>% html_nodes("table")
tab
obj <- tab[[1]] %>% html_table(fill = TRUE)
head(obj)
tail(obj)
obj2 <- tab[[2]] %>% html_table(fill = TRUE)
head(obj2)
tail(obj2)
```

There's now 72 different tables! See if you can figure out where the first few tables are coming from on the website.

### Exercises {#exercise-8-3}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-8).

1. Choose a topic/person/place/etc. that interests you that has tables on Wikipedia and scrape the table that is related to that topic.

2. \* SLU keeps track of diversity of faculty through time and makes this data public on the following website: <a href="https://www.stlawu.edu/ir/diversity/faculty" target="_blank">https://www.stlawu.edu/ir/diversity/faculty</a>. Use `rvest` to scrape the data tables into `R`. 

__Hint__: You may need to use an extra argument in `html_table()` like `fill`.

## JSON Files with `jsonlite`

A final common data format that we will discuss is JSON (JavaScript Object Notation). We will only cover the very basics of JSON data and use the `jsonlite` package in `R` to read in some .json files. JSON files are read in to `R` as a `list` object. 

### Everything Working Well

First, consider data from the mobile game Clash Royale. Install the `jsonlite` package and then use it to read in the `json` file with the function `fromJSON()`:


```r
## install.packages("jsonlite")
library(jsonlite)
cr_cards <- fromJSON("data/clash_royale_card_info.json")
```

You should get a warning message, which we will investigate in class.

Next, type `View(cr_cards)` in your console (bottom-left) window to look at the data. See if you can pull out the data set by clicking on some things in the `View()` window.

The following give a couple of ways to grab the data using code. The `as_tibble()` function converts a rectangular object into our familiar `tibble`.

The first option specifies the name of the table that's in the JSON file (in this case, the name is `"cards"`):


```r
library(tidyverse)
cr_cards_flat <- cr_cards[["cards"]]
cr_cards_df <- as_tibble(cr_cards_flat)
head(cr_cards_df)
#> # A tibble: 6 x 8
#>   key    name  elixir type  rarity arena description      id
#>   <chr>  <chr>  <int> <chr> <chr>  <int> <chr>         <int>
#> 1 knight Knig…      3 Troop Common     0 A tough mel… 2.6 e7
#> 2 arche… Arch…      3 Troop Common     0 A pair of l… 2.60e7
#> 3 gobli… Gobl…      2 Troop Common     1 Three fast,… 2.60e7
#> 4 giant  Giant      5 Troop Rare       0 Slow but du… 2.60e7
#> 5 pekka  P.E.…      7 Troop Epic       4 A heavily a… 2.60e7
#> 6 minio… Mini…      3 Troop Common     0 Three fast,… 2.60e7
```

The second method uses the `flatten()` function from the `purrr` package, the only package in the core `tidyverse` that we do not talk about in detail in this class. There is also a different `flatten()` function in the `jsonlite` package. In the code below, we specify that we want to use `flatten()` from `purrr` with `purrr::flatten()`. If we wanted to use `flatten()` from `jsonlite`, we'd use `jsonlite::flatten()`


```r
cr_cards_flat2 <- purrr::flatten(cr_cards)
cr_cards_df2 <- as_tibble(cr_cards_flat2)
head(cr_cards_df2)
#> # A tibble: 6 x 8
#>   key    name  elixir type  rarity arena description      id
#>   <chr>  <chr>  <int> <chr> <chr>  <int> <chr>         <int>
#> 1 knight Knig…      3 Troop Common     0 A tough mel… 2.6 e7
#> 2 arche… Arch…      3 Troop Common     0 A pair of l… 2.60e7
#> 3 gobli… Gobl…      2 Troop Common     1 Three fast,… 2.60e7
#> 4 giant  Giant      5 Troop Rare       0 Slow but du… 2.60e7
#> 5 pekka  P.E.…      7 Troop Epic       4 A heavily a… 2.60e7
#> 6 minio… Mini…      3 Troop Common     0 Three fast,… 2.60e7
```

Both methods give a `tibble` that we can then use our usual `tidyverse` tools `ggplot2`, `dplyr`, `tidyr`, etc. on.

### Things Aren't Always So Easy

Now let's try to look at some animal crossing data that were obtained from <a href="https://github.com/jefflomacy/villagerdb" target="_blank">https://github.com/jefflomacy/villagerdb</a>. We first just want to look at the data from one individual villager (ace) in the file `ace.json`.


```r
acedata <- fromJSON("data/ace.json")
aceflat <- purrr::flatten(acedata)
head(aceflat)
#> $gender
#> [1] "male"
#> 
#> $species
#> [1] "bird"
#> 
#> $birthday
#> [1] "3-13"
#> 
#> $ac
#> $ac$personality
#> [1] "jock"
#> 
#> $ac$clothes
#> [1] "spade-shirt"
#> 
#> $ac$song
#> [1] "K.K. Parade"
#> 
#> $ac$phrase
#> [1] "ace"
#> 
#> 
#> $`afe+`
#> $`afe+`$personality
#> [1] "jock"
#> 
#> $`afe+`$clothes
#> [1] "spade-shirt"
#> 
#> $`afe+`$song
#> [1] "K.K. Parade"
#> 
#> 
#> $name
#> [1] "Ace"
```

Things are now....more complicated. This example is just to show that it's not always easy working with JSON data. Lists can be nested and that creates problems when trying to convert a deeply nested list into our "rectangular" format that's easy to work with. 

There's also the added problem of reading in the `.json` files from all villagers at the same time We could do this with a for loop or a mapping function from `purrr` to download and read in the JSON files for all villagers. We won't delve any more deeply into this, but there's a lot more to all of the file formats that we've discussed this week, particularly web scraping and .json files.

### Exercises {#exercise-8-4}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-8).

1. \* Read in the `pokedex.json` file, a data set that has information on the 151 original Pokemon. Then, use the `flatten()` function from `purrr` to flatten the list.

2. \* Use `as_tibble()` to convert your flattened list to a `tibble`.

3. \* Use `parse_number()` with `mutate()` to tidy two of the variables in the data set.

4. \* Look at the `type` variable. What looks odd about it? What happens when you try to use it, either in a plot, or using a `dplyr` function?

You can `unnest()` the `Type` variable with the `unnest()` function from `tidyr`. We didn't discuss this function but feel free to read about it with `?unnest`




```r
pokemon_unnest <- unnest(pokemon_df, cols = c(type))
```

5. There are 6 pokemon with a `spawn_chance` of 0. Figure out what these 6 pokemon are.



6. Figure out what the 5 most common Pokemon types are in the first generation (you'll need to use the `unnest()`-ed data set for this: why?). 



## Chapter Exercises {#chapexercise-8}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-8).

1. Choose a sports team at SLU, and go to that team's website (by simply googling SLU name_of_sport). Scrape the data tables from the "Results" or "Statistics" section of this sport. After you scrape the data, tidy the data set. Then, choose one of the following options (different options might make more/less sense for different sports)

(a). Summarise different __team__ statistics, either numerically or graphically. Perhaps make some graphs showing different statistics through time. 

(b). Summarise different __individual__ statistics, either numerically or graphically.

(c). Ask and answer any other questions that make sense for the particular sport that you are looking at!

__Note__: A few sports (men's and women's golf, for example), give results in PDF format. PDF format is generally a horrible way to record and share data, as it's very difficult to read in to almost any program. Therefore, avoid sports with PDF results for the purposes of this exercise.

## Exercise Solutions {#solutions-8}

### Reprexes and `tibble` S

1. \* Suppose that you can't figure out how to create a semester variable and a year variable from `Term` in `evals_prof_S21.csv`. (You want to split the `Term` variable into two variables: `Semester` with levels `F` and `S` and `Year` with levels `19`, `20`, and `21`).


```r
library(tidyverse)
evals_df <- read_csv("data/evals_prof_S21.csv")
head(evals_df)
#> # A tibble: 6 x 10
#>   Term  Course Question               `Agree strongly` Agree
#>   <chr> <chr>  <chr>                             <dbl> <dbl>
#> 1 F19   113-02 1. Course has been a …                9     9
#> 2 F19   113-02 2. Effectively Organi…               12     8
#> 3 F19   113-02 3. Environment Conduc…               11     8
#> 4 F19   113-02 5a. Fair Assessment o…                5    13
#> 5 F19   113-02 5b. Timely Assessment…                8    12
#> 6 F19   113-02 5c. Constructive Asse…                5     8
#> # … with 5 more variables: Agree Somewhat <dbl>,
#> #   Neutral <dbl>, Disagree Somewhat <dbl>, Disagree <dbl>,
#> #   Disagree Strongly <dbl>
```

Put together a reprex using `tibble()` that someone would be able to run to help you figure out your question.


```r
library(tidyverse)
df <- tibble(Term = c("F19", "S20"), x = c(1, 2))
## Hello! I need help creating a variable that has F/S and 
## a separate year variable that has 19 and 20 from the data set above.
## Thanks!
```

2. \* You should actually be able to answer your own question using a function that we learned a couple of weeks ago. Do so, creating a `Semester` and `Year` variable.


```r
new_df <- df %>% separate(Term, sep = 1, into = c("Semester", "Year"))
```

### `readr` S

1. \* The `birthdays.txt` file has information on the birthdays of various animals on my Animal Crossing island. There are also columns for the Animal's Name, Animal Type, and how long the animal has lived on the island (in weeks). Click on the file to open it to look at the format of the data.

Start with the following code chunk and use the options of `read_delim()` to read in the data (`?read_delim`). The `delim` argument that's already provided specifies that the delimiter (separator) that you'll use is a `-`, as opposed to, for example, a `,` in a .csv file. Arguments that you may to change include 

* `skip`
* `col_names`
* `na`
* `trim_ws`
* `col_types`


```r
library(tidyverse)
df <- read_delim("data/birthdays.txt", delim = " - ")
head(df)
```


```r
read_delim("data/birthdays.txt", delim = "-", skip = 4,
  col_names = c("Birthday", "Name",
    "Animal", "Island"),
  trim_ws = TRUE,
  col_types = list(
    col_character(), col_character(), col_character(), col_number()
  ), na = c("N/A", "?"))
```

2. \* Another common format for data to be stored in is an Excel file. Often, it's easiest just to save the Excel file as a .csv file and read it in using `read_csv()`. But, sometimes this route can be difficult (for example, if your Excel file has thousands of sheets). To read in directly from Excel, you'll need to install the `readxl` with `install.packages("readxl")`. Once installed, load the package with `library(readxl)`, and read in the first sheet `evals_prof.xlsx` data set, the data set used for Project 2, with the `read_excel()` function.


```r
## install.packages("readxl")
library(readxl)
read_excel("data/evals_prof.xlsx")
```

3. \* Now, read in the second sheet, using the help file for `?read_excel` to change one of the arguments.


```r
read_excel("data/evals_prof.xlsx", sheet = 2)
```

### `rvest` and Data Scraping S

2. \* SLU keeps track of diversity of faculty through time and makes this data public on the following website: <a href="https://www.stlawu.edu/ir/diversity/faculty" target="_blank">https://www.stlawu.edu/ir/diversity/faculty</a>. Use `rvest` to scrape the data tables into `R`.


```r
url <- "https://www.stlawu.edu/ir/diversity/faculty"
h <- read_html(url)
tab <- h %>% html_nodes("table")
obj <- tab[[1]] %>% html_table(fill = TRUE)
obj
```

### JSON with `jsonlite` S

1. \* Read in the `pokedex.json` file, a data set that has information on the 151 original Pokemon. Then, use the `flatten()` function from `purrr` to flatten the list.


```r
library(jsonlite)
pokedex <- fromJSON("data/pokedex.json")
df <- purrr::flatten(pokedex)
```

2. \* Use `as_tibble()` to convert your flattened list to a `tibble`.


```r
pokemon_df <- as_tibble(df)
```

3. \* Use `parse_number()` with `mutate()` to tidy two of the variables in the data set.


```r
pokemon_df <- pokemon_df %>% mutate(height = parse_number(height),
                                    weight = parse_number(weight))
```

4. \* Look at the `type` variable. What looks odd about it? What happens when you try to use it, either in a plot, or using a `dplyr` function?


```r
## it's a variable of lists....this is happening because some 
## pokemon have more than one type.

## most ggplot() and dplyr() functions won't work, or
## won't work as you'd expect
```

You can `unnest()` the `Type` variable with the `unnest()` function from `tidyr`. We didn't discuss this function but feel free to read about it with `?unnest`


```r
pokemon_unnest <- unnest(pokemon_df, cols = c(type))
```

### Chapter Exercises S {#chapexercise-8-S}



## Non-Exercise `R` Code {#rcode-8}


```r
## Hello! How do I get rid of the units from the values in
## my variable `x`? Thanks!
library(tidyverse)
test_df <- read_csv("data/parsedf.csv")
head(test_df)
## Hello! How do I get rid of the units from the values in
## my variable `xvar`? Thanks!
library(tidyverse)
test_df2 <- tibble(xvar = c("20,000 dollars", "40 dollars"),
                   yvar = c(1, 2))
test_df2
library(tidyverse)
cars_df <- read_csv("data/mtcarsex.csv")
head(cars_df)
cars_df <- read_csv("data/mtcarsex.csv", skip = 2)
## first two lines will be skipped
head(cars_df)
cars_df <- read_csv("data/mtcarsex.csv", na = c(NA, "-999"), skip = 2)
head(cars_df)
cars_df <- read_csv("data/mtcarsex.csv", na = c(NA, "-999"), skip = 2,
  col_types = cols(
  mpg = col_double(),
  cyl = col_factor(),
  disp = col_double(),
  hp = col_double(),
  drat = col_double(),
  wt = col_double(),
  qsec = col_double(),
  vs = col_factor(),
  am = col_double(),
  gear = col_double(),
  carb = col_double()
))
cars_df <- read_csv("data/mtcarsex.csv", na = c(NA, "-999"), skip = 2,
  col_types = cols(
  mpg = col_double(),
  cyl = col_factor(),
  disp = col_double(),
  hp = col_double(),
  drat = col_double(),
  wt = col_double(),
  qsec = col_double(),
  vs = col_factor(),
  am = col_double(),
  gear = col_double(),
  carb = col_double()
)) %>%
  slice(-(1:2))
head(cars_df)
oscars_df <- read_tsv("data/oscars.tsv")
head(oscars_df)
test_df <- read_csv("data/parsedf.csv")
head(test_df)
test_df %>% mutate(x2 = parse_number(x))
library(tidyverse)
library(rvest)

## provide the URL and name it something (in this case, url).
url <- "https://en.wikipedia.org/wiki/Gun_violence_in_the_United_States_by_state"

## convert the html code into something R can read
h <- read_html(url)

## grabs the tables
tab <- h %>% html_nodes("table")
test1 <- tab[[1]] %>% html_table()
test2 <- tab[[2]] %>% html_table()
test3 <- tab[[3]] %>% html_table()

head(test1)
head(test2)
head(test3)
url <- "https://saintsathletics.com/sports/baseball/stats/2021"
h <- read_html(url)
tab <- h %>% html_nodes("table")
tab
obj <- tab[[1]] %>% html_table(fill = TRUE)
head(obj)
tail(obj)
obj2 <- tab[[2]] %>% html_table(fill = TRUE)
head(obj2)
tail(obj2)
## install.packages("jsonlite")
library(jsonlite)
cr_cards <- fromJSON("data/clash_royale_card_info.json")
library(tidyverse)
cr_cards_flat <- cr_cards[["cards"]]
cr_cards_df <- as_tibble(cr_cards_flat)
head(cr_cards_df)
cr_cards_flat2 <- purrr::flatten(cr_cards)
cr_cards_df2 <- as_tibble(cr_cards_flat2)
head(cr_cards_df2)
acedata <- fromJSON("data/ace.json")
aceflat <- purrr::flatten(acedata)
head(aceflat)
```

