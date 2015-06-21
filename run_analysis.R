## install and load packages:
install.packages('plyr')
install.packages('xlsx')
library(plyr)
library(xlsx)

## make/select target folder :
if(!file.exists('./project')) {dir.create('./project')}

## download data
fileURL<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileURL, destfile='./project/UCI_HAR_dataset.zip',method='curl')
unzip('./project/UCI_HAR_dataset.zip', exdir='./project/unzipped')

## read data:
X_test<-read.table('./project/unzipped/UCI HAR Dataset/test/X_test.txt')
y_test<-read.table('./project/unzipped/UCI HAR Dataset/test/y_test.txt')
subject_test<- read.table('./project/unzipped/UCI HAR Dataset/test/subject_test.txt')
X_train<-read.table('./project/unzipped/UCI HAR Dataset/train/X_train.txt')
y_train<-read.table('./project/unzipped/UCI HAR Dataset/train/y_train.txt')
subject_train<-read.table('./project/unzipped/UCI HAR Dataset/train/subject_train.txt')
features<-read.table('./project/unzipped/UCI HAR Dataset/features.txt')

## make tables w/ features plus subjects plus activities:
table_test<-cbind(X_test,subject_test,y_test)
table_train<-cbind(X_train,subject_train,y_train)

## name columns for subject and activity:
colnames(table_test)[562]<-'subject'
colnames(table_test)[563]<-'activity'
colnames(table_train)[562]<-'subject'
colnames(table_train)[563]<-'activity'

## unify two tables into one:
merged<-merge(table_test,table_train,all=T)

## make a vector of features' names
stringa<-features[,2]

## identify the features that measure means and standard deviations:
grab_mean<-grepl('mean()',stringa,fixed=T)
grab_std<-grepl('std()',stringa,fixed=T)

## identify the indexes of the above features:
columnsForMean<-features[grab_mean,1]
columnsForStd<-features[grab_std,1]

## join the two above vectors:
indexes<-append(columnsForMean,columnsForStd)

## create a table inclusive only of the variables (i.e, the features) that measure,respectively, 
## means and standard deviations, plus the variables that identify the subject and the activity :
tableOfMeasurements<-merged[,c(indexes, 562,563)]

## rename columns in TableOfMeasurements:
columnNames<-stringa[indexes]
colnames(tableOfMeasurements)[1:66]<-as.character(columnNames)

## turn the numbers that identify the activities into the  names of the those activities: 
tableOfMeasurements[which(tableOfMeasurements$activity==1) ,'activity']<-'Walking'
tableOfMeasurements[which(tableOfMeasurements$activity==2) ,'activity']<-'Walking Upstairs'
tableOfMeasurements[which(tableOfMeasurements$activity==3) ,'activity']<-'Walking Downstairs'
tableOfMeasurements[which(tableOfMeasurements$activity==4) ,'activity']<-'Sitting'
tableOfMeasurements[which(tableOfMeasurements$activity==5) ,'activity']<-'Standing'
tableOfMeasurements[which(tableOfMeasurements$activity==6) ,'activity']<-'Laying'

## create the required table of averages:
Table_of_Averages<-ddply(tableOfMeasurements, .(activity, subject), numcolwise(mean))

## write required table to folder in working space and call it The_Table_of_Averages.txt:
write.table(Table_of_Averages,'./project/The_Table_of_Averages.txt', row.names=F)
