# Getting and Cleaning Data – Course Project
 

* Author : Els Schepers
* Date : 17.02.2015


## Introduction

The purpose of this course project  for the course “Getting and Cleaning Data” (Johns Hopkins – Data Science track)  is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
This document describes the variables, the data and any transformations that were performed to get a tidy data set out of the source data.  The program created to do this is called run_analysis.R.


## Source Data

The data used for the course project represents data collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description of the data used in this project can be found at : 
A [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


The complete source data for this project can be found at : 
A [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Set Information

Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

## Program Set-up

The R-program run_analysis.R is made up of 5 parts : 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Each step is explained in full details here after.


### Part 1. Merge the training and the test sets to create one data set.

The following files are read from the source directory : 
*	features.txt
*	activity_labels.txt
*	subject_train.txt
*	x_train.txt
*	y_train.txt
*	subject_test.txt
*	x_test.txt
*	y_test.txt

Column names are added to the following  datasets.
*	Activity_labels : column names "ID_Activity","Activity"
*	Features : column names "ID_Feature","Feature"
*	Subject_train : “ID_Subject
*	X_train : gets the column labels from the Features dataset
*	Y_training : “ID_Activity”
*	Subject_test : “ID_Subject
*	X_test : gets the column labels from the Features dataset
*	Y_test : “ID_Activity”

The training datasets (y_train, subject_train, x_train) are merged.
The test datasets (y_test, subject_test, x_test) are merged.
The resulting training dataset and test dataset are appended to each other which results in a new dataset result_data.
The data is loaded into a data frame table tbl_result.
The datasets that aren’t used further are cleared from the memory : result_data, training_data, test_data, x_test, x_train, y_test, y_train, subject_test, subject_train, features.

### Part 2. Extract only the measurements on the mean and standard deviation for each measurement.

A vector “colnames” of the columnnames is created from tbl_result.
A logical vector “v_colnames “ on the column names that have to be kept is created.
The logical vector “v_colnames” is used to select the columns from tbl_result. The resulting dataset is called tbl_subset.
Tbl_result is cleared from the memory.


### Part 3. Use descriptive activity names to name the activities in the data set

Tbl_result is merged with activity_labels in order to include the name of the activity.  The resulting dataset is called tbl_final. The column ID_Activity is removed 

### Part 4. Appropriately label the data set with descriptive activity names.

See Part 1

### Part 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

The data is grouped by Activity and Subject.
The means for each combination of activity and subject is calculated.
The resulting data set is called tidy_data.
A text file tidy_data.txt is created from tidy_data.
