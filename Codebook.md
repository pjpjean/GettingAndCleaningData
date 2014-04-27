# Getting and Cleaning Data Project #
A clean and tidy subset of the Human Activity Recognition Using Smartphones dataset.

## Codebook ##
### Introduction ###
This dataset contains averages of some of the variables included in the Human Activity Recognition (HAR) Using Smartphones dataset originally available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The version analized here were downloaded from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), provided in Coursera's Getting and Cleaning Data Peer Assessment instructions page.

According to the original README.txt file, the UCI's HAR dataset is about a series of measurements taken "with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.". Each person (subject) and each activity were given an id, 1-30 and 1-6, respectively.

### Analisys ###
In this cleaning and data analisys, we read 8 files in the original dataset:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/suject_train.txt': Each row identifies the subject who performed the activity.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/suject_test.txt': Each row identifies the subject who performed the activity.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

From 'features.txt', we get the names of our output variables. From 'activity_labels.txt' we get the names of activities, to appropriately label the data set with descriptive activity names. From the other files, originally split in train and test sets, we get the observed measurements.

After reading the 8 files, we merge the training and the test sets to create one data set, extract only the measurements on the mean and standard deviation for each measurement, replace activity id with activity names and create a tidy data set with the average of each variable for each activity and each subject. 

At the end, we output a file named 'har_tidy.txt' in working directory.

### Variables ###
[01] **subject**  - Id of the subject who performed the activity. Integer. (1-30)

[02] **activity** - Name of the performed activity. Character. (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

66 variables with the average of the mean and standard deviation original measurements, one for each combination of subject and activity.

[03] **tBodyAcc.mean.X**

[04] **tBodyAcc.mean.Y**

[05] **tBodyAcc.mean.Z**

[06] **tBodyAcc.std.X**

[07] **tBodyAcc.std.Y**

[08] **tBodyAcc.std.Z**

[09] **tGravityAcc.mean.X**

[10] **tGravityAcc.mean.Y**

[11] **tGravityAcc.mean.Z**

[12] **tGravityAcc.std.X**

[13] **tGravityAcc.std.Y**

[14] **tGravityAcc.std.Z**

[15] **tBodyAccJerk.mean.X**

[16] **tBodyAccJerk.mean.Y**

[17] **tBodyAccJerk.mean.Z**

[18] **tBodyAccJerk.std.X**

[19] **tBodyAccJerk.std.Y**

[20] **tBodyAccJerk.std.Z**

[21] **tBodyGyro.mean.X**

[22] **tBodyGyro.mean.Y**

[23] **tBodyGyro.mean.Z**

[24] **tBodyGyro.std.X**

[25] **tBodyGyro.std.Y**

[26] **tBodyGyro.std.Z**

[27] **tBodyGyroJerk.mean.X**

[28] **tBodyGyroJerk.mean.Y**

[29] **tBodyGyroJerk.mean.Z**

[30] **tBodyGyroJerk.std.X**

[31] **tBodyGyroJerk.std.Y**

[32] **tBodyGyroJerk.std.Z**

[33] **tBodyAccMag.mean**

[34] **tBodyAccMag.std**

[35] **tGravityAccMag.mean**

[36] **tGravityAccMag.std**

[37] **tBodyAccJerkMag.mean**

[38] **tBodyAccJerkMag.std**

[39] **tBodyGyroMag.mean**

[40] **tBodyGyroMag.std**

[41] **tBodyGyroJerkMag.mean**

[42] **tBodyGyroJerkMag.std**

[43] **fBodyAcc.mean.X**

[44] **fBodyAcc.mean.Y**

[45] **fBodyAcc.mean.Z**

[46] **fBodyAcc.std.X**

[47] **fBodyAcc.std.Y**

[48] **fBodyAcc.std.Z**

[49] **fBodyAccJerk.mean.X**

[50] **fBodyAccJerk.mean.Y**

[51] **fBodyAccJerk.mean.Z**

[52] **fBodyAccJerk.std.X**

[53] **fBodyAccJerk.std.Y**

[54] **fBodyAccJerk.std.Z**

[55] **fBodyGyro.mean.X**

[56] **fBodyGyro.mean.Y**

[57] **fBodyGyro.mean.Z**

[58] **fBodyGyro.std.X**

[59] **fBodyGyro.std.Y**

[60] **fBodyGyro.std.Z**

[61] **fBodyAccMag.mean**

[62] **fBodyAccMag.std**

[63] **fBodyBodyAccJerkMag.mean**

[64] **fBodyBodyAccJerkMag.std**

[65] **fBodyBodyGyroMag.mean**

[66] **fBodyBodyGyroMag.std**

[67] **fBodyBodyGyroJerkMag.mean**

[68] **fBodyBodyGyroJerkMag.std**