--- 
title: "STAT 234: Data Science"
author: "Matt Higham"
date: "2021-05-17"
site: bookdown::bookdown_site
output: bookdown::gitbook
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
github-repo: rstudio/bookdown-demo
description: "This book contains all examples for SLU's Introduction to Data Science course."
---

# Syllabus and Course Information

## General Information

__Instructor Information__

* Professor: Matt Higham
* Office: Bewkes 121
* Email: mhigham@stlawu.edu
* Semester: Fall 2020
* Office Hours: 
    + Tuesday 12:00 - 2:00 (in Zoom)
    + Friday 10:50 - 11:50 (in JHS 224 or in Zoom)
    + Friday 1:30 - 2:30 (in JHS 224 or in Zoom)
    + other times by appointment
* Zoom Link: <https://stlawu.zoom.us/j/98496966102>
* Sections:
    + MW 3:20 - 4:50
    
__Course Materials__

* Textbook: R for Data Science by Garrett Grolemund and Hadley Wickham 
    + free online version: [R for Data Science (r4ds)](https://r4ds.had.co.nz/)
    + we will use this only as a reference
* Computer with Internet access
    
***
***

## Course Information

Welcome to STAT 234! The overall purpose of this course is learn the data science skills necessary to complete large-scale data analysis projects. The tool that we will be using to achieve this goal is the statistical software language `R`. We will work with a wide variety of interesting data sets throughout the semester to build our `R` skills. In particular, we will focus on the Data Analysis Life Cycle (Grolemund and Wickham 2020): 

![](other/data-science.png)

We will put more emphasis on the _Import, Tidy, Transform, Visaulize, and Communicate_ parts of the cycle, as much of the _Modeling_ part is covered in STAT 213.

***
***

## General Course Outcomes

1. _Import_ data of a few different types into `R` for analysis.

2. _Tidy_ data into a form that can be more easily visualized, summarised, and modeled.

3. _Transform_ and _Visualize_ variables in a data set to assess patterns in the data.

4. _Communicate_ the results of your analysis to a target audience with a written report, or, possibly an oral presentation.

5. Practice reproducible statistical practices through the use of `R Markdown` for data anlaysis projects. 

6. _Generally_: develop the necessary skills to be able to answer future data analysis questions on your own, either using `R` or another program, such as Python. 

To paraphrase our textbook, about 80% of the skills necessary to do a complete data analysis project can be learned through coursework in classes like this one. But, 20% of any particular project will involve learning new things that are specific to that project. Achieving Goal # 6 will allow you to learn this extra 20% on your own. 

### Use of `R` and `RStudio`

We will use the statistical software `R` to construct graphs and analyze data. A few notes:

* `R` and `RStudio` are both free to use.
* We will primarily be using the SLU `R Studio` server at first: <http://rstudio-u18-01.stlawu.local:8787/> 
* Additionally, we will be using `RMarkdown` for data analysis reports. 
_Note_: It's always nice to start assignments and projects as early as possible, but this is particularly important to do for assignments and projects involving `R`. It's no fun to try and figure out why code is not working at the last minute. If you start early enough though, you will have plenty of time to seek help and therefore won't waste a lot of time on a coding error.

***
***

## How You Will Be Assessed

There are 5 components to your grade, each described below. 

* Tutorials, Exercises, and Classes

There are 14 sets of tutorials, exercises, and class that are graded for completion only. Tutorials are worth 2 points each, exercise sets are worth 4 points each, and each week of class is worth 4 points for a total of 140 points.

__Note__: To get class credit, you can either come to class or zoom in. If you miss class, then you can still get "class" credit by completing the class exercises given within 2 days.

* Quizzes

There will be 10 Quizzes, each worth 20 points for a total of 180 points with one dropped quiz. The purpose of the quizzes are for you to practice what you've learned for the week in a short, concise format. Quizzes, for the most part, will assess basic understanding of the functions that we've used for that particular week.

If you need to miss class on the day of the quiz, a make-up will be given during the first Friday office hours that you are available. The make-up quiz will be oral. 

* Mini Projects

There are 3 mini-projects scattered throughout the semester that are worth 50 points each (~ one every 3 weeks). Each mini-project will have some prescriptive tasks and questions that you will investigate as well as a section where you come up with and subsequently answer your own questions relating to the data set.

In order to get experience with oral presentations of results, each student will give a short oral presentation on __1__ mini-project. Use of `R Markdown` is required for this presentation (as opposed to PowerPoint or Prezi). More details will be given later in the semester.

* Midterm Exams

There will be two midterm exams, each worth 165 points. Exams will have both an in-class and take-home component. The purpose of the in-class portion is to assess "the basics." The purpose of the take-home portion is to assess your ability to put the basics together to form a cohesive data analysis. More information will be given about these later.

* Final Project

There is one final project, worth 200 points. The purpose of the final project is to give you an opportunity to assemble topics throughout the course into one coherent data analysis. More information about the final project will be given later. 

There will be no Final Exam.

### Breakdown

__Note__: Points were updated on November 24 to reflect a 20 points increase in the Final Project points

* 120 points for Tutorials, Exercises, and Class
* 180 points for Quizzes
* 150 points for Mini-Projects + 20 points for Presentation
* 165 points for each of two Midterm Exams
* 200 points for Final Project

Points add up to 1000 so your grade at the end of the semester will be the number of points you've earned across all categories divided by 1000.

* The tutorials should help you complete the exercises sets, which should
    * help you to do well on the quizzes, which should
        * help you complete the mini-projects, which should 
            * help you to do well on the midterm exams.

Then, everything together should help you create an awesome final project!

### Grading Scale

The following is a _rough_ grading scale. I reserve the right to make any changes to the scale if necessary.

| Grade | 4.0 | 3.75 | 3.5 | 3.25 | 3.0 | 2.75 | 2.5 | 2.25 | 2.0 | 1.75 | 1.5 | 1.25 | 1.0 | 0.0 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Points | 950-1000 | 920-949 | 890-919 | 860-889 | 830-859 | 810-829 | 770-809 | 750-769 | 720-749 | 700-719 | 670-699 | 640-669 | 600-639 | 0-599 |

***
***

### Rules for Collaboration

Collaboration with your classmates on handouts, tutorials, and projects is encouraged, but you must follow these guidelines:

* you must state the name(s) of who you collaborated with at the top of each assessment.
* all work must be your own. This means that you should __never__ send someone your code via email or let someone directly type code off of your screen. Instead, you can talk about strategies for solving problems and help or ask someone about a coding error.
* you may use the Internet and StackExchange, but you also should not copy paste code directly from the website, without citing that you did so.
* this isn't a rule, but keep in mind that collaboration is not permitted on quizzes, exams, and very limited collaboration will be permitted on the final project. Therefore, when working with someone, make sure that you are both really learning so that you both can have success on the non-collaborative assessments.

***
***

### Diversity Statement

Diversity encompasses differences in age, colour, ethnicity, national origin, gender, physical or mental ability, religion, socioeconomic background, veteran status, sexual orientation, and marginalized groups. The interaction of different human characteristics brings about a positive learning environment. Diversity is both respected and valued in this classroom.

***
***

### Accessibility Statement

If you have a learning difference/disability or other health impairment and need accommodations please be sure to contact the Student Accessibility Services Office right away so they can help you get the accommodations you require. If you need to use any accommodations in this class, please meet with your instructor early and provide them with your Individualized Educational Accommodation Plan (IEAP) letter so you can have the best possible experience this semester.
 
Although not required, your instructor would like to know of any accommodations that are needed at least 10 days before a quiz or test. Please be proactive and set up an appointment to meet with someone from the Student Accessibility Services Office.
 
__Color-Vision Deficiency:__ If you are Color-Vision Deficient, the Student Accessibility Services office has on loan glasses for students who are color vision deficient.  Please contact the office to make an appointment.
 
For more specific information about setting up an appointment with Student Accessibility Services please see the listed options below:
 
* Telephone: 315.229.5537
* Email: studentaccessibility@stlawu.edu 

For further information about Student Accessibility Services you can check the website at: <https://www.stlawu.edu/student-accessibility-services>
 
***
***

### Academic Dishonesty

Academic dishonesty will not be tolerated. Any specific policies for this course are supplementary to the

Honor Code. According to the St. Lawrence University Academic Honor Policy,

1. It is assumed that all work is done by the student unless the instructor/mentor/employer gives specific permission for collaboration.
2. Cheating on examinations and tests consists of knowingly giving or using or attempting to use unauthorized assistance during examinations or tests.
3. Dishonesty in work outside of examinations and tests consists of handing in or presenting as original work which is not original, where originality is required.

*Claims of ignorance and academic or personal pressure are unacceptable as excuses for academic dishonesty.* Students must learn what constitutes one&#39;s own work and how the work of others must be acknowledged.

For more information, refer to [www.stlawu.edu/acadaffairs/](../../C:%5CUsers%5Ciramler%5CAppData%5CLocal%5CTemp%5Cwww.stlawu.edu%5Cacadaffairs%5Cacademic_honor_policy.pdf)[**academic**](../../C:%5CUsers%5Ciramler%5CAppData%5CLocal%5CTemp%5Cwww.stlawu.edu%5Cacadaffairs%5Cacademic_honor_policy.pdf)[\_](../../C:%5CUsers%5Ciramler%5CAppData%5CLocal%5CTemp%5Cwww.stlawu.edu%5Cacadaffairs%5Cacademic_honor_policy.pdf)[**honor**](../../C:%5CUsers%5Ciramler%5CAppData%5CLocal%5CTemp%5Cwww.stlawu.edu%5Cacadaffairs%5Cacademic_honor_policy.pdf)[\_policy.pdf](../../C:%5CUsers%5Ciramler%5CAppData%5CLocal%5CTemp%5Cwww.stlawu.edu%5Cacadaffairs%5Cacademic_honor_policy.pdf).

To avoid academic dishonesty, it is important that you follow all directions and collaboration rules and ask for clarification if you have any questions about what is acceptable for a particular assignment or exam.  If I suspect academic dishonesty, a score of zero will be given for the entire assignment in which the academic dishonesty occurred **for all individuals involved** and Academic Honor Council will be notified. If a pattern of academic dishonesty is found to have occurred, a grade of 0.0 for the entire course can be given.

It is important to work in a way that maximizes your learning. Be aware that students who rely too much on others for the homework and projects tend to do poorly on the quizzes and exams.

_Please note that in addition the above, any assignments in which your score is reduced due to academic dishonesty will not be dropped according to the quiz policy e.g., if you receive a zero on a quiz because of academic dishonesty, it will not be dropped from your grade. Additionally, academic honesty on the homework will result in a 0 for that week's quiz (since the homework is not worth points on its own)_

***
***

## Tentative Schedule

| Week | Date | Topics |
| ---- | ------ | ---- | --------------------------------------------------- |
| 0 | 8/26  | Introduction to `R`, `R Studio`|
| 1 | 8/31 | Graphics with `ggplot2` |
| 2 | 9/7 | Data Wrangling and Transformation with `dplyr` |
| 3 | 9/14 | Data Tidying with `tidyr` |
| 4 | 9/21 | Communication with `R Markdown` and `ggplot2` |
| 5 | 9/28| Basic Coding in `R`|
| 6 | 10/5 | Catch-up and Midterm 1 |
||||
| 7 | 10/12 | Data Import with `readr` and `jsonlite` and Data Frames with `tibble` |
| 8 | 10/19 | Data Merging with `dplyr` and Databases with SQL|
| 9 | 10/26 | Factors with `forcats` and Data Ethics|
| 10 | 11/2 | Dates and Times with `lubridate` |
| 11 | 11/9 | Strings with `stringr` |
| 12 | 11/16 | Catch-up and Midterm 2|
||||
| 13 | 11/23 | Final Project |
| 14 | 11/30 | Final Project |

* There will be no Final Exam, but keep your schedule open at our Final Exam time in case we decide to use it for something. 
