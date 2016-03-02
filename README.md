# Getting and Cleaning Data Course Project

The goal of this project is to prepare tidy data that can be used for later analysis. 

## Files and connection 
1) ReadMe.md: explains how the scripts work and connected.

2) CodeBook.md: describes the variables, the data, and any transformations or work to clean up the data.

3) run_analysis.R: read raw data and clean to get tidy data.

4) tidyData.txt: the output data file which contains tidy data.

## Work steps
1) Download the raw data zip file from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2) Unzip the file to working directory

3) Run the script run_analysis.R and it can

* Merges the training and the test sets to create one data set.
* Extracts the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Labels the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

4) After run the script, a tidy data file (tidyData.txt) will be generated. 
