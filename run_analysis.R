
## Program : run_analysis.R
## Author : Els Schepers
## Date Creation : 14.02.205

## The script is split up in 5 parts : 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.


## UCI HAR Dataset has been unzipped to location C:\Users\eschep\Coursera R Programming\data
## set working directory to that location
setwd('/Users/eschep/Coursera R Programming/data/UCI HAR Dataset/')

##### 1. Merge the training and test sets to create 1 data set ####

## Read in General Data
activity_labels <- read.table("./activity_labels.txt", header = FALSE)
features <- read.table("./features.txt", header = FALSE)

## Add column labels for General Data
colnames(activity_labels) <- c("ID_Activity","Activity")
colnames(features) <- c("ID_Feature","Feature")

## Read in Training Data
subject_train <- read.table("./train/subject_train.txt", header = FALSE)
x_train <- read.table("./train/X_train.txt", header = FALSE)
y_train <- read.table("./train/y_train.txt", header = FALSE)

## Add column labels for Training Data
colnames(subject_train) <- c("ID_Subject")
colnames(x_train) <- features[,2]
colnames(y_train) <- c("ID_Activity")

## Read in Test Data
subject_test <- read.table("./test/subject_test.txt", header = FALSE)
x_test <- read.table("./test/X_test.txt", header = FALSE)
y_test <- read.table("./test/y_test.txt", header = FALSE)

## Add column labels for Test Data
colnames(subject_test) <- c("ID_Subject")
colnames(x_test) <- features[,2]
colnames(y_test) <- c("ID_Activity")

## Merge Training Data
training_data <- cbind(y_train, subject_train, x_train)

## Merge Test Data
test_data <- cbind(y_test, subject_test, x_test)

## Append Test Data to Training Data
result_data <- rbind(training_data,test_data)

library(dplyr)
tbl_result <- tbl_df(result_data) 

## Clean Memory
rm(result_data)
rm(training_data)
rm(test_data)
rm(x_test)
rm(x_train)
rm(y_test)
rm(y_train)
rm(subject_test)
rm(subject_train)
rm(features)

##### 2. Extract only measurements on mean and standard dev ####

## Create a vector with the columnnames
colnames <- colnames(tbl_result)

## Create a logical vector on the column names that have to be kept
v_colnames <- grepl("ID_Activity",colnames) | 
                 grepl("ID_Subject",colnames) | 
                 grepl("mean\\(\\)",colnames)  |
                 grepl("std\\(\\)",colnames)  

## Select the columns
tbl_subset <- tbl_result[v_colnames==TRUE]

## clean memory
rm(tbl_result)

##### 3. Use descriptive activity names to name the activities in the data set ####

## Add name of activity
tbl_final = merge(activity_labels,tbl_subset,by='ID_Activity',all.x=TRUE)

## Remove ID of activity
tbl_final <- select(tbl_final,-ID_Activity)

##### 4. Appropriately label the data set with descriptive variable names ####

## This step was already performed in step 1

##### 5. Create a tidy data set with the average of each variable for each activity and each subject ####

## Group the data by activity and subject
tbl_final_by <- group_by(tbl_final,Activity, ID_Subject)

## Calculate the mean for each group
tidy_data <-summarise_each(tbl_final_by,funs(mean))

## Create a text file 
write.table(tidy_data,file = "tidy_data.txt", row.name = FALSE) 
