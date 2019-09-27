library(data.table)
library(dplyr)

#Set your working directory
setwd("D:/Google Drive/Data Science/Cleaning/")
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

destFile <- "HAR Data.zip"
if (!file.exists(destFile)){
  download.file(URL, destfile = destFile, mode='wb')
}
if (!file.exists("./UCI_HAR_Dataset")){
  unzip(destFile)
}

#Read label data for test and training
labelTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = F)
labelTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = F)

#Read test and training datasets
dataTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = F)
dataTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = F)

#Read subject identification datasets
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = F)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = F)

#Read class label and feature names datasets 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = F)
features <- read.table("./UCI HAR Dataset/features.txt", header = F)

#Extract variable names from features data and apply to test and training datasets
names(dataTest) <- features[,2]
names(dataTrain) <- features[,2]

#Append appropriate variable name to test and training label data
names(labelTest) <- "activityId"
names(labelTrain) <- "activityId"

#Append appropriate variable name to test and training subject data
names(subjectTest) <- "subjectId"
names(subjectTrain) <- "subjectId"

#Append appropriate variable name to activity data
names(activityLabels) <- c("activityId","activity")

#Create full labelled datasets for training and test
fullTrain<-cbind(labelTrain, subjectTrain, dataTrain)
fullTest<-cbind(labelTest, subjectTest, dataTest)

#Combine test and training in to a single labelled dataset
fullData<- rbind(fullTrain,fullTest)

#Use grepl to find relevant variable positions for mean and std
varNames<-names(fullData)
selectorMeanStd <- (grepl("activityId", varNames) | grepl("subjectId", varNames) | grepl("mean..", varNames) | 
                      grepl("std...", varNames))

#Select only mean and std data
dataMeanStd <- fullData[ , selectorMeanStd]
dataMeanStd <- merge(dataMeanStd, activityLabels, by = "activityId", all.x = TRUE)

#Create second tidy data set. Use aggregate to apply the mean to subsets split
#by subjectId and activityId, and then order.
tidyData <- aggregate(. ~subjectId + activityId, dataMeanStd, mean)
tidyData <- tidyData[order(tidyData$subjectId, tidyData$activityId), ]

#Save tidied data to new file, "tidydata.txt".
write.table(tidyData, file = "tidydata.txt",row.names=FALSE)
