## Load and clean raw data, and save as tidy data for further analysis

library(dplyr)
rm(list=ls())

# read raw data (features and labels)
features <- read.table('./data/features.txt',sep=" ")
names(features) <- c('No.', 'featureName')
activitys <- read.table('./data/activity_labels.txt',sep=" ")
names(activitys) <- c('activityLabel', 'activity')

#read raw data (test sets)
TestSet <- read.table('./data/test/x_test.txt')
names(TestSet) <- features$featureName
TestLabels <- read.table('./data/test/y_test.txt')
names(TestLabels) <- 'activityLabel'
subjectTest <- read.table('./data/test/subject_test.txt')
names(subjectTest) <- 'subject'
rawTestSet <- cbind(subjectTest,TestLabels, TestSet)

# read the raw data (training sets)
trainSet <- read.table('./data/train/x_train.txt')
names(trainSet) <- features$featureName
trainLabels <- read.table('./data/train/y_train.txt')
names(trainLabels) <- 'activityLabel'
subjectTrain <- read.table('./data/train/subject_train.txt')
names(subjectTrain) <- 'subject'
rawTrainSet <- cbind(subjectTrain,trainLabels, trainSet)

## Merges the training and the test sets to create one data set
rawData <- rbind(rawTrainSet,rawTestSet)

## Extracts only the measurements on the mean and standard deviation for each measurement
tempData <- rawData[,c('subject','activityLabel',  grep('mean', names(rawData), value = TRUE), grep('std',names(rawData), value = TRUE))]

## Uses descriptive activity names to name the activities in the data set
tempData<-merge(activitys, tempData, by="activityLabel")
tempData<-tempData[-1]

#Appropriately labels the data set with descriptive variable names
colName<-names(tempData)
colName<-as.vector(sapply(colName, function(x) gsub("^t","Time",x)))
colName<-as.vector(sapply(colName, function(x) gsub("^f","Freq",x)))
colName<-as.vector(sapply(colName, function(x) gsub("mean","Mean",x)))
colName<-as.vector(sapply(colName, function(x) gsub("std","Std",x)))
colName<-as.vector(sapply(colName, function(x) gsub("\\()","",x)))
colName<-as.vector(sapply(colName, function(x) gsub("\\-","",x)))
names(tempData)<-colName

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData <- group_by(tempData, activity, subject)
tidyData <- summarise_each(tidyData, funs(mean))

##create a txt file 
write.table(tidyData, file = 'tidyData.txt',row.name=FALSE)