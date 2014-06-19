# run_analysis.R
#
# This script will load the data from the
# UCI Human Activity Recognition Using Smartphones Data Set
# and create a "tidy data set" to spec
#
# Source data is found here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# Adjust datadir to point to the appropriate data source directory.

datadir<-"UCI HAR Dataset"

# read in datasets; combine test & train

tmp1 <- read.table(paste(datadir,"train/X_train.txt",sep = "/"))
tmp2 <- read.table(paste(datadir,"test/X_test.txt",sep="/"))
x <- rbind(tmp1, tmp2)

tmp1 <- read.table(paste(datadir,"train/subject_train.txt",sep="/"))
tmp2 <- read.table(paste(datadir,"test/subject_test.txt",sep="/"))
s <- rbind(tmp1, tmp2)

tmp1 <- read.table(paste(datadir,"train/y_train.txt",sep="/"))
tmp2 <- read.table(paste(datadir,"test/y_test.txt",sep="/"))
y <- rbind(tmp1, tmp2)

# read features & labels

features <- read.table(paste(datadir,"features.txt",sep="/"))[,2]
activities <- read.table(paste(datadir,"activity_labels.txt",sep="/"))[,2]

# assign the features to x
headers<-make.names(features,unique=TRUE)  # sanitize header names
names(x)<-headers

# get logical vector for mean or std features
#meanstd_features <- grepl("mean|std", features) this grep includes extra values like 
# fBodyAcc-meanFreq()-x, which we don't want

meanstd_features <- grepl("mean\\(\\)|std\\(\\)", features)



# extract just mean & std deviations
x<-x[,meanstd_features]

# combine into one data frame

merged <- cbind(s, y, x)
names(merged)[1] <- "SubjectID"
names(merged)[2] <- "Activity"

# use the aggregate function!  loops are for sissies.

out <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)

# update the activity names

out$Activity <- factor(out$Activity, labels=activities)

# write to working directory w/ tab delimited output

write.table(out, file="./tidydata.txt", sep="\t", row.names=FALSE)

