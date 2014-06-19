# Getting and Cleaning Data Peer Assessment Codebook

## Source Data

The features selected for this dataset come from the movements of subjects measured by smartphone accelerometer and gyroscope 3-axial raw signals.  The raw data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The output of this cleaning script contains fields defined in the dataset found here in the file features_info.txt.  This is included in the raw dataset.


## Codebook

SubjectID:  A unique identifier for the subjects of the experiments.

Activity:  One of six activities that measurements for the subject were taken:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

The remaining 66 columns are the average values of measurements taken from
observations in the dataset.  See the file "features_info.txt" in the source data
for more information.  Please note that these column names were sanitized with
the R function "make.names" with unique=TRUE to make further analysis and 
manipulation easier.  This data are the averaged observations for each subject and activity combination from the original data set.