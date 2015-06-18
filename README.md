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

All of the above is explained in greater detail by the code book *CodeBook.md*.

## Run From Command Line

* Clone the Activity_Recognition_Project repo
* Start a fresh session in RStudio
* Run the R script: run_analysis.R
* Find final dataset at project/The_Table_of_Averages.txt
* Read this final dataset with command: < read.table("The_Table_of_Averages.txt", header=T) >
