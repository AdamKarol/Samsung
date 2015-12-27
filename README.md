# Samsung project
The file run_analysis.R contains the script to run in R.
The script creates new data set from data on analysis of Human Activity Recognition Using Smartphones.
The data set includes means per person and activity of every variable that was a mean or standard deviation of those measurments.

Please set the working directory to the folder where you have unzipped folder "UCI HAR Dataset".

Script does the following:

1.Merges the training and the test sets to create one data set. Files from Inertial Signals are not included (I think they are not needed).

2.Extracts only the measurements on the mean and standard deviation for each measurement (if in the name of the variable there is "mean" or "std" then the variable is left).

3.Uses descriptive activity names to name the activities in the data set - merge operation.

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
