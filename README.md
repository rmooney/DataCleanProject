# Data Cleaning Project

This script cleans activity data provided here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This script reads x, y, and subject data files in both train and test directories, extracts the mean and standard deviation variables and combines them to a single dataframe.

The datadir variable points to the directory containing the data and can be tuned to other directories as needed.  Initially, datadir points to the "UCI HAR Dataset" directory, which is the default when the data is unzipped.

The features list was extracted from features.txt.  Because we are only interested in the observations directly from the signals, only fields that explicitly are called mean() and std() were used.  This omitted other means (such as gravityMean) that were extrapolated from the observations.  Please see the features_info.txt file in the data set for further clarification.

The features list was also sanitized using the R function make.names() in order to ensure column names could be usable by R without issue.

Activity_labels.txt was used to label the activities descriptively in the second column.

The final merged dataframe that is created contains SubjectID, Activity, and the averages for all extracted observations by subject and activity combination.

This dataframe is written to "tidydata.txt" in the working directory.