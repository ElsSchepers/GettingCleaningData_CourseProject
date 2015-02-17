# Getting and Cleaning Data – Course Project
 

* Author : Els Schepers
* Date : 17.02.2015


## Introduction

The purpose of this course project  for the course “Getting and Cleaning Data” (Johns Hopkins – Data Science track) is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data used for the course project represents data collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description of the data used in this project can be found at : 
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


The complete source data for this project can be found at : 
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Reuse Script

The script run_analysis.R can be reused in order to process the data. You have to replace the working directory on line 27 by your own working directory.


### Content of the script 

The R-program run_analysis.R is made up of 5 parts : 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Create data set with the average of each variable for each activity and each subject.
