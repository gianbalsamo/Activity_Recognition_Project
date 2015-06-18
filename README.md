# Activity_Recognition_Project
This repo fulfills a requirement of the Get and Clean Data Course taught by the Johns Hopkins University. The R script of this repo manipulates data from a Human Activity Recognition Study.
This repo consists of an R script named *run_analysis.R* and a code book named 
*CodeBook.md*.

The R script *run_analysis.R* executes the following operations:

* Downloads a zip file containing data and info on an Human Activity Recognition Study, 
* unzips this file, 
* reads the data from a few selected files from the folders contained in the unzipped
file, 
* reshapes and transforms these data, 
* collects the resulting data onto a data frame, 
* writes this data frame onto a designated directory as a txt file.

All of the above is explained in greater detail in the section of this document titled *R Script Description*. 
For a detailed description of the original data set, the variables considered in my program, and their specific manners of manipulation, see code book titled *CodeBook.md*.

## Run From Command Line

* Clone the Activity_Recognition_Project repo
* Start a fresh session in RStudio
* Run the R script: run_analysis.R
* Find final dataset at project/The_Table_of_Averages.txt
* Read this final dataset with command: < read.table("The_Table_of_Averages.txt", header=T) >

## R SCRIPT DESCRIPTION

ThE R script *run_analysis.R* manipulates data from a Human Activity Recognition Study.
In this program, individual lines or sets of lines of code are preceded by comments 
that describe what they do. In the following 16 paragraphs, I refer to those comments 
as *sections*, and explain what the pertinent code does a bit more explicitely than 
I do in the body of the R script.

1. The **install and load packages section** installs the needed packages and loads them to 
the library.

2. The **make/select target folder section** verifies the existence of the directory 
"project". If it turns out that this directory does not exists, it creates it.
 
3. The **download data section** downloads and unzips the data set. The resulting file
is stored in the newly created folder *unzipped*.
 
4. The **read data section** upload 7 data frames from the unzipped data file and 
assigns names to them. As the data frames' new (and old) names indicate, six of these
data frames can be linked to one another, three by three, by row. The columns of the 
*X_test* and *X_train* data frames correspond to the 561 entries of column n.2 in 
the data frame named *features*.

5. The **make tables w/ features plus subjects plus activities section** creates two 
new tables, *table_test* and *table_train*, each binding one of the two groups of 
three data frames which can be linked by row, as mentioned above. The resulting 
*table_test* and *table_train* include 561 features with their corresponding subjects 
and activities.

6. The **name columns for subject and activity section** renames the two pertinent 
columns in each of these new tables.

7. The **unify two tables into one section** merges these two tables into a 
10299 x 563 table, called *merged*.

8. The **make a vector of features' names section** makes a 561-element vector of 
the features' names from the data set.

9. The **identify the features that measure means and standard deviations section** 
creates two logical vectors that identify the features from the original data set 
(and from *merged* as well) that measure either means or standard deviations.

10. The **identify the indexes of the above features section** creates two integer 
vectors that contain  the indexes of the above selected features from the table 
*merged*.

11. The **join the two above vectors** section joins the two above integer vectors 
of indexes.

12. The **create a table inclusive only of the variables (i.e, the features) that 
measure, respectively, means and standard deviations, plus the variables that identify the 
subject and the activity section** creates a new 180 x 68 table, named 
*TableOfMeasurements*. This table contains the variables (i.e, the features) that 
measure,respectively, means and standard deviations, as well as the two elements that 
identify,respectively, the subject and the activity pertinent to such variables.

13. The **rename columns in TableOfMeasurements section** renames the first 66 
columns of *TableOfMeasurements*. I did this renaming in order to satisfy one of the 
project's assigned tasks, although I think that these variables' original names were 
pretty good and clear as they were.

14. The **turn the numbers that identify the activities into the  names of those 
activities** section turns the numbers, ranging from 1 to 6, that identify the various 
activities in column n. 68 of *TableOfMeasurements* into the 6 names of those same 
activities, namely,*Walking*,*Walking Upstairs*,*Walking Downstairs*,*Sitting*,
*Standing*, and *Laying*.

15. The **create the required table of averages section** creates the table 
*Table_of_Averages* by calculating, column-wise, the first 66 variables' means.

16. The **write therequired table to folder in working space and call it 
'The_Table_of_Averages.txt' section** writes the *Table_of_Averages* as a 
txt file onto the directory *project* and calls it: *The_Table_of_Averages.txt*.

End of Code Book.
