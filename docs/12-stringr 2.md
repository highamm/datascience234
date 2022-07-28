# Text Data with `tidytext` and `stringr`

__Goals__:

* use functions in the `stringr` package and in the `tidytext` package to analyze text data.
* introduce some of the issues with manipulating strings that don't pertain to numeric or factor data.
* perform a basic sentiment analysis.

## Text Analysis

Beyonce is a legend. For this example, we will work through a text analysis on lyrics from songs from Beyonce's albums, utilizing functions from both `stringr` to parse strings and `tidytext` to convert text data into a tidy format. To begin, read in a data set of Beyonce's lyrics:


```r
library(tidyverse)
beyonce <- read_csv("data/beyonce_lyrics.csv")
head(beyonce)
```

We will be most focused on the `line` variable, as each value for this variable contains a line from a Beyonce song. There's other variables present as well, such as the `song_name` and the `artist_name` (the data set originally came from a data set with artists other than Beyonce).

You can look at the first 4 values of `line` with


```r
beyonce$line[1:4]
#> [1] "If I ain't got nothing, I got you"                       
#> [2] "If I ain't got something, I don't give a damn"           
#> [3] "'Cause I got it with you"                                
#> [4] "I don't know much about algebra, but I know 1+1 equals 2"
```

Our end goal is to construct a plot that shows the most popular words in Beyonce's albums. This is much more challenging than it sounds because we will have to deal with the nuances of working with text data.

The `tidytext` package makes it a lot easier to work with text data in many regards. Let's use the `unnest_tokens()` functions from `tidytext` to separate the lines into individual words. We'll name this new data set `beyonce_unnest`:


```r
library(tidytext)
beyonce_unnest <- beyonce %>% unnest_tokens(output = "word", input = "line")
beyonce_unnest
#> # A tibble: 164,740 x 6
#>    song_id song_name artist_id artist_name song_line word   
#>      <dbl> <chr>         <dbl> <chr>           <dbl> <chr>  
#>  1   50396 1+1             498 Beyoncé             1 if     
#>  2   50396 1+1             498 Beyoncé             1 i      
#>  3   50396 1+1             498 Beyoncé             1 ain't  
#>  4   50396 1+1             498 Beyoncé             1 got    
#>  5   50396 1+1             498 Beyoncé             1 nothing
#>  6   50396 1+1             498 Beyoncé             1 i      
#>  7   50396 1+1             498 Beyoncé             1 got    
#>  8   50396 1+1             498 Beyoncé             1 you    
#>  9   50396 1+1             498 Beyoncé             2 if     
#> 10   50396 1+1             498 Beyoncé             2 i      
#> # … with 164,730 more rows
```

We'll want to make sure that either all words are capitalized or no words are capitalized, for consistency (remember that `R` is case-sensitive). To that end, we'll modify the `word` variable and use `stringr`'s `str_to_lower()` to change all letters to lower-case:


```r
beyonce_unnest <- beyonce_unnest %>% mutate(word = str_to_lower(word))
```

Let's try counting up Beyonce's most popular words from the data set we just made:


```r
beyonce_unnest %>% group_by(word) %>%
  summarise(n = n()) %>%
  arrange(desc(n))
#> # A tibble: 6,469 x 2
#>    word      n
#>    <chr> <int>
#>  1 you    7693
#>  2 i      6669
#>  3 the    4719
#>  4 me     3774
#>  5 to     3070
#>  6 it     2999
#>  7 a      2798
#>  8 my     2676
#>  9 and    2385
#> 10 on     2344
#> # … with 6,459 more rows
```

What's the issue here?

To remedy this, we can use what are called __stop words__: words that are very common and carry little to no meaningful information. For example _the_, _it_, _are_, etc. are all __stop words__. We need to eliminate these from the data set before we continue on. Luckily, the `tidytext` package also provides a data set of common stop words in a data set named `stop_words`:


```r
head(stop_words)
#> # A tibble: 6 x 2
#>   word      lexicon
#>   <chr>     <chr>  
#> 1 a         SMART  
#> 2 a's       SMART  
#> 3 able      SMART  
#> 4 about     SMART  
#> 5 above     SMART  
#> 6 according SMART
```

Let's join the Beyonce lyrics data set to the stop words data set and elminate any stop words:


```r
beyonce_stop <- anti_join(beyonce_unnest, stop_words, by = c("word" = "word"))
```

Then, we can re-make the table with the stop words removed:


```r
beyonce_sum <- beyonce_stop %>% group_by(word) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  print(n = 25)
#> # A tibble: 5,937 x 2
#>    word        n
#>    <chr>   <int>
#>  1 love     1362
#>  2 baby     1024
#>  3 girl      592
#>  4 wanna     564
#>  5 hey       499
#>  6 boy       494
#>  7 yeah      491
#>  8 feel      488
#>  9 time      452
#> 10 uh        408
#> 11 halo      383
#> 12 check     366
#> 13 tonight   342
#> 14 girls     341
#> 15 ya        327
#> 16 run       325
#> 17 crazy     308
#> 18 world     301
#> 19 body      287
#> 20 ooh       281
#> 21 ladies    269
#> 22 top       241
#> 23 gotta     240
#> 24 beyoncé   238
#> 25 night     213
#> # … with 5,912 more rows
beyonce_sum
#> # A tibble: 5,937 x 2
#>    word      n
#>    <chr> <int>
#>  1 love   1362
#>  2 baby   1024
#>  3 girl    592
#>  4 wanna   564
#>  5 hey     499
#>  6 boy     494
#>  7 yeah    491
#>  8 feel    488
#>  9 time    452
#> 10 uh      408
#> # … with 5,927 more rows
```

Looking through the list, there are __still__ some stop words in there that were not picked up on in the `stop_words` data set. We will address these, as well as make a plot, in the exercises.

### Exercises {#exercise-12-1}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-12).

1. Look at the remaining words. Do any of them look like stop words that were missed with the stop words from the `tidytext` package? Create a tibble with a few of the remaining stop words (like `ooh`, `gotta`, `ya`, `uh`, and `yeah`) not picked up by the `tidytext` package, and use a join function to drop these words from the data set.

2. With the new data set, construct a point plot or a bar plot that shows the 20 most common words Beyonce uses, as well as the number of times each word is used.

3. Use the `wordcloud()` function in the `wordcloud` library and the code below to make a wordcloud of Beyonce's words.


```r
## install.packages("wordcloud")
library(wordcloud)
#> Loading required package: RColorBrewer
beyonce_small <- beyonce_sum %>% filter(n > 50)
wordcloud(beyonce_small$word, beyonce_small$n, 
          colors = brewer.pal(8, "Dark2"), scale = c(5, .2),
          random.order = FALSE, random.color = FALSE)
```

Then, use `?wordcloud` to read about what the various arguments like `random.order`, `scale`, and `random.color` do.

If you want to delve into text data more, you'll need to learn about _regular expressions_ , or _regexes_. If interested, you can read more in the <a href="https://r4ds.had.co.nz/strings.html#matching-patterns-with-regular-expressions" target="_blank">R4DS textbook</a>. Starting out is not too bad, but learning about escaping special characters in `R` can be much more challenging!

We analyzed a short text data set, but, you can imagine extending this type of analysis to things like:

* song lyrics, if you have the lyrics to all of the songs from an artist <https://rpubs.com/RosieB/taylorswiftlyricanalysis>
* book analysis, if you have the text of an entire book or series of books
* tv analysis, if you have the scripts to all episodes of a tv show

If you were doing one of these analyses, there are lots of cool functions in `tidytext` to help you out! We will do one more example, this time looking at Donald Trump's twitter account in 2016.

## Basic Sentiment Analysis

We will use a provided .Rmd file to replicate a sentiment analysis on Trump's twitter account from 2016. This analysis was used in conjunction with a major news story that hypothesized that Trump himself wrote tweets from an Android device while his campaign staff wrote tweets for him from an iPhone device. We will investigate what properties of his tweets led the author to believe this.

The .Rmd file used for this is posted on Sakai. We will see more uses of `stringr` for this particular analysis. For this entire section, you should be able to follow along and understand what each line of code is doing. However, unlike all previous sections, you will not be expected to do a sentiment analysis on your own.

<!-- see below: sentiment analysis for the friends package -->

<!-- https://amirdjv.netlify.app/post/rating-and-sentiment-analysis-for-friends/ -->

<!-- additional resource: https://www.tidytextmining.com/tidytext.html -->

## Chapter Exercises {#chapexercise-12}

Exercises marked with an \* indicate that the exercise has a solution at the end of the chapter at \@ref(solutions-12).

There are no Chapter Exercises.

## Exercise Solutions {#solutions-12}

### Text Analysis S

There are no solutions.

### Second Example S

There are no solutions.

### Chapter Exercises S {#chapexercise-12-S}

There are no solutions. 

## Non-Exercise `R` Code {#rcode-12}


```r
library(tidyverse)
beyonce <- read_csv("data/beyonce_lyrics.csv")
head(beyonce)
beyonce$line[1:4]
library(tidytext)
beyonce_unnest <- beyonce %>% unnest_tokens(output = "word", input = "line")
beyonce_unnest
beyonce_unnest <- beyonce_unnest %>% mutate(word = str_to_lower(word))
beyonce_unnest %>% group_by(word) %>%
  summarise(n = n()) %>%
  arrange(desc(n))
head(stop_words)
beyonce_stop <- anti_join(beyonce_unnest, stop_words, by = c("word" = "word"))
beyonce_sum <- beyonce_stop %>% group_by(word) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  print(n = 25)
beyonce_sum
## install.packages("wordcloud")
library(wordcloud)
beyonce_small <- beyonce_sum %>% filter(n > 50)
wordcloud(beyonce_small$word, beyonce_small$n, 
          colors = brewer.pal(8, "Dark2"), scale = c(5, .2),
          random.order = FALSE, random.color = FALSE)
```
