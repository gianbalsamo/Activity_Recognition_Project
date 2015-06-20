# Code Book

I have based my project of the UCI HAR dataset, which contains the results of a Human
Activity Recognition Study made Using Smartphones Datasets and using 30 volunteers. This study was executed by
scientists affiliated with the Non Linear Complex Systems Laboratory of the University of 
Genova. Italy. The URL of the UCI HAR dataset is found at: <https://d396qusza40orc.cloudfront.net
/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. A full description of the study may be 
found at: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+
Using+Smartphones>.

## Description
 
The UCI HAR dataset contains 4 files and two folders, named, respectively, *test* and
*train*. *ReadMe* files explains that *the experiments have been carried out with 
a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.* The study captures 
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
In the dataset, the 3 axes are identified by the letters X, Y, and Z. The dataset is 
partitioned into two sets, 70% of the volunteers generating the training data and 
30% generating the test data. This explains why there are 2 folders, *train* and 
*test*, within the UCI HAR dataset.  

For each observation the study captures the triaxial acceleration and the estimated 
body acceleration, the triaxial angular velocity, a 561-feature vector with time and 
frequency domain variables, the pertinent activity, and a number in the range 1:30 
identifying the subject who carried out the experiment.
The labels identifying the 561 features and linking them to the rest of the dataset
are provided by the file *features.txt*. The labels identifying the 6 activities and
linking them to the rest of the dataset are provided by the files *y_test.txt* and
*y_train.txt*. The labels identifying the 30 subjects  and linking them to the rest of 
the dataset are provided by the files *subject_test.txt* and *subject_train.txt*.

What follows is a concise description of my R script's manipulation of all of these 
data. The structure of the code is described in the ReadMe document. My script:

1. Merges the training and the test data, together with the pertinent feature, subject,
and activity labels. The result is a 10299 x 563 data frame.
2. It extracts from this data frame the variables (i.e, the features) that measure,
respectively, the means and standard deviations, labeled of course by subject and 
activity. The resulting *tableOfMeasurements* is a 10299 x 68 data frame.
3. In an attempt to reach greater clarity, it renames all the variables in this data 
frame, with the exception of the 2 variables designating subject and activity, and it 
turns the 1:6 numbers that identify the activities into the  names of those very 
activities.
4. It computes the average of all variables, column-wise, and by activity and subject,
obtaining thereby the 180 x 68 data frame *Table_of_Averages*. (I have not renamed the 
variables.) This is what the first row and first four columns of *Table_of_Averages* 
look like.
```
> Table_of_Averages[1, 1:4]
  activity subject TimeBodyAccelerationMean-X TimeBodyAccelerationMean-Y
1   Laying       1                  0.2215982                -0.04051395
```
5. Finally, my script writes this table as a txt file onto the folder *project* in the 
project directory, and calls it *The_Table_of_Averages.txt*.

End of code book.

