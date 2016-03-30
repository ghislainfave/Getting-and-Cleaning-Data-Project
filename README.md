# Getting and Cleaning Data Project

This respository holds the R script and documentation for the Getting and Cleaning Data Coursera course project.

## Objective

This project serves to demonstrate the collection and cleaning of a raw data set before analysis. The dataset being used contains measures from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Files

The R script, run_analysis.R, does the following:

1. Download the dataset;
2. Load the activity, feature info and training datasets;
3. Rename columns and create the train dataset;
3. Load the test datasets, rename columns and create the test dataset;
4. Merge the train and test datasets;
5. Extracts only the measurements on the mean and standard deviation for each measurement;
6. Uses descriptive activity names to name the activities in the data set by merging the dataset with the activity dataset;
7. Relabel the data set with more descriptive variable names;
8. Create a second, independent tidy data set with the average of each variable for each activity and each subject;
9. Write the tidy table Tidydata.txt.

The CodeBook.md file contains informations the variables and data.

