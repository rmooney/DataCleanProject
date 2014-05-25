DataCleanProject
================

This is to house the Course Project R code for the Data Cleansing course.

## Starting Assumptions
The source files must be unzipped in the working directory.
The original set unpacks to a folder called "UCI HAR Dataset".  The activity files should be in
their respective "test" and "train" subfolders here.

The original data contained:
Six activities
30 subjects

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Program Notes

Pseudo code:

- read in the data
- identify if it's test or train - do we need this value for any reason?
--if so, add it to the data set
- create data frame that will be
Write output data set... CSV?
With descriptive names
