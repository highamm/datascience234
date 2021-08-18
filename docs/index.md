--- 
title: "STAT 234: Data Science"
author: "Matt Higham"
date: "2021-08-18"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
url: https://highamm.github.io/datascience234/
# cover-image: path to the social sharing image like images/cover.jpg
description: "This book contains examples for SLU's Introduction to Data Science course."
biblio-style: apalike
csl: chicago-fullnote-bibliography.csl
---

# Syllabus and Course Information

## General Information

__Instructor Information__

* Professor: Matt Higham
* Office: Bewkes 123
* Email: mhigham@stlawu.edu
* Semester: Fall 2021
* Office Hours: 
    + Tuesday 1:30 - 3:30 
    + Wednesday 2:30 - 3:30
    + Friday 10:00 - 11:00
    + other times by appointment
    + all in-person, unless otherwise requested
<!-- * Zoom Link: <https://stlawu.zoom.us/j/98496966102> -->
* Sections:
    + MW 8:50 - 10:20
    
__Course Materials__

* <a href="https://highamm.github.io/datascience234/" target="_blank">STAT 234 Materials Bundle</a>. This will be our primary source of materials.
* Textbooks (only used as references):
    * Modern Data Science with `R` by Baumer, Kaplan, and Horton, found <a href="https://mdsr-book.github.io/mdsr2e/" target="_blank">here</a> in a free online version.
    * R for Data Science by Grolemund and Wickham, found <a href="https://r4ds.had.co.nz/" target="_blank">here</a> in a free online version.
* Computer with Internet access.
    
***
***

## Course Information

Welcome to STAT 234! The overall purpose of this course is learn the data science skills necessary to complete large-scale data analysis projects. The tool that we will be using to achieve this goal is the statistical software language `R`. We will work with a wide variety of interesting data sets throughout the semester to build our `R` skills. In particular, we will focus on the Data Analysis Life Cycle (Grolemund and Wickham 2020): 

![](other/data-science.png)

We will put more emphasis on the _Import, Tidy, Transform, Visualize, and Communicate_ parts of the cycle, as an introduction to _Modeling_ part is covered in STAT 213.

### Use of `R` and `RStudio`

We will use the statistical software `R` to construct graphs and analyze data. A few notes:

* `R` and `RStudio` are both free to use.
* We will primarily be using the SLU `R Studio` server at first: <a href="rstudio.stlawu.local:8787" target="_blank">rstudio.stlawu.local:8787</a>.
* Additionally, we will be using `RMarkdown` for data analysis reports. 
_Note_: It's always nice to start assignments and projects as early as possible, but this is particularly important to do for assignments and projects involving `R`. It's no fun to try and figure out why code is not working at the last minute. If you start early enough though, you will have plenty of time to seek help and therefore won't waste a lot of time on a coding error.

***
***

## General Course Outcomes

1. _Import_ data of a few different types into `R` for analysis.

2. _Tidy_ data into a form that can be more easily visualized, summarised, and modeled.

3. _Transform_, _Wrangle_, and _Visualize_ variables in a data set to assess patterns in the data.

4. _Communicate_ the results of your analysis to a target audience with a written report, or, possibly an oral presentation.

5. Practice reproducible statistical practices through the use of `R Markdown` for data analysis projects. 

6. Explain why it is ethically important to consider the context that a data set comes in.

7. Develop the necessary skills to be able to ask and answer future data analysis questions on your own, either using `R` or another program, such as Python. 

To paraphrase the _R for Data Science_ textbook, about 80% of the skills necessary to do a complete data analysis project can be learned through coursework in classes like this one. But, 20% of any particular project will involve learning new things that are specific to that project. Achieving Goal # 6 will allow you to learn this extra 20% on your own. 

***
***

## How You Will Be Assessed

The components to your grade are described below:

* Class

Class participation will be assessed three times throughout the semester in a 20 point rubric for a total of 60 points. Additionally, there will be a 10-point "share something interesting you found with the class" assignment on nearly every day of class, where a student will volunteer to....share something interesting that they found with the data set we were working with with the rest of the class. The rubric used will be shared on the first day of class, and more information about the extra 10 points will also be given on the first day of class.

* Exercises

There are about 14 sets of weekly exercises that often require you to read some of the sections in the <a href="https://highamm.github.io/datascience234/" target="_blank">STAT 234 Materials Bundle</a> first. These are worth either 10 or 5 points, depending on the length of the exercises, for a total of 100 points. Most weeks toward the beginning of the semester will be 10 point weeks because we won't have any projects to work on. Exercises are graded __for completion only__: for many exercises, the solutions are provided in our course materials. 

* Quizzes

There will be 10 Quizzes, each worth 20 points for a total of 180 points with one dropped quiz. The purpose of the quizzes are for you to practice what you've learned for the week in a short, concise format. Quizzes will consist of two parts: (1) a take-home component and (2) an in-class component. The take-home component should take about 15 minutes. You are allowed use any course materials and you are allowed to work with other students in this course, as long as you list the names of those students at the top of your quiz. The in-class component will be 5 minutes. You will be asked to do a simple task with pen and paper, without using any course notes or materials. 

<!-- If you need to miss class on the day of the quiz, a make-up will be given during the first Friday office hours that you are available. The make-up quiz will be oral.  -->

* Mini Projects

There are 3 mini-projects scattered throughout the semester that are worth 60 points each. Each mini-project will have some prescriptive tasks and questions that you will investigate as well as a section where you come up with and subsequently answer your own questions relating to the data set.

In order to get experience with oral presentations of results, each student will give a short oral presentation on __1__ mini-project. Use of `R Markdown` is required for this presentation (as opposed to PowerPoint or Prezi). More details will be given later in the semester.

* Midterm Exams

There will be two midterm exams, each worth 150 points. More information will be given about these later.

* Final Project

There is one final project, worth 150 points. The primary purpose of the final project is to give you an opportunity to assemble topics throughout the course into one coherent data analysis. More information about the final project will be given later. 

There will be no Final Exam for this course.

### Breakdown

* 70 points for Class
* 100 points for Exercises
* 180 points for Quizzes
* 180 points for Mini-Projects + 20 points for Presentation
* 150 points for Midterm 1
* 150 points for Midterm 2
* 150 points for Final Project

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

## Collaboration, Diversity, Accessibility, and Academic Integrity

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

If you have a specific learning profile, medical and or mental health condition and need accommodations, please be sure to contact the Student Accessibility Services Office right away so they can help you get the accommodations you require. If you need to use any accommodations in this class, please meet with your instructor early and provide them with your Individualized Educational Accommodation Plan (IEAP) letter so you can have the best possible experience this semester.
 
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

_Please note that in addition the above, any assignments in which your score is reduced due to academic dishonesty will not be dropped according to the quiz policy e.g., if you receive a zero on a quiz because of academic dishonesty, it will not be dropped from your grade._

***
***

## Tentative Schedule

| Week | Date | Topics |
| ---- | ------ | ---- | --------------------------------------------------- |
| 0 | 8/25  | Introduction to `R`, `R Studio`|
| 1 | 8/30 | Graphics with `ggplot2` |
| 2 | 9/6 | Data Wrangling and Transformation with `dplyr` |
| 3 | 9/13 | Data Tidying with `tidyr` |
| 4 | 9/20 | Communication with `R Markdown` and `ggplot2` |
| 5 | 9/27| Basic Coding in `R`|
| 6 | 10/4 | Catch-up and Midterm 1 |
||||
| 7 | 10/11 | Factors with `forcats` and Data Ethics  |
| 8 | 10/18 | Data Import with `readr`, `jsonlite`, `rvest`, and `tibble`|
| 9 | 10/25 | Data Merging with `dplyr` |
| 10 | 11/1 | Dates and Times with `lubridate` |
| 11 | 11/8 | Strings with `stringr` |
| 12 | 11/15 | Catch-up and Midterm 2|
||||
| 13 | 11/22 | Thanksgiving Break |
| 14 | 11/29 | Predictive Modeling Final Project |
| 14 | 12/6 | Final Project |

* The three mini-projects are tentatively scheduled to be due on September 27, October 25, and November 8, though these are subject to change.
* There will be no Final Exam, but keep your schedule open at our Final Exam time in case we decide to use it for something. 
