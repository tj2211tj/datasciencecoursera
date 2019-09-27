Getting and Cleaning Data Week 4 Project

The data were sourced from the Human Activity Recognition Using Smartphones Data Set, from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The full description of the data and how it was collected is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Script: run_analysis.R:

The script performs the following five tasks:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
  each activity and each subject. This data set is then written to file "tidydata.txt".
  
Variables: 
  labelTest, labelTrain, dataTest, dataTrain, subjectTest, subjectTrain, activityLabels, features all contain the data 
  from the downloaded datasets as data frames.
  fullTrain, fullTest, fullData contain the combined training, test and all data respectively with appropriate activity
  labels.
  dataMeanStd contains only the mean and standard deviation data from fullData.
  tidyData contains the mean of each activity for each subject from dataMeanStd.
