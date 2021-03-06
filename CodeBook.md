# Getting and Cleaning Data Project

## Experiment information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Dataset information

* features.txt: List of all features
* activity_labels.txt: Links the class labels with their activity name. 
* X_train.txt': Training set.
* train/y_train.txt': Training labels.
* test/X_test.txt': Test set.
* test/y_test.txt': Test labels.
* subject_train.txt': Subject identification from 1 to 30

## Information on tables created by run_analysis.R

* train: all data on train experiments. First column contains the subject Id. Second column contains the activity Id. Other columns contains the featured experiment values
* test: all data on test experiments. First column contains the subject Id. Second column contains the activity Id. Other columns contains the featured experiment values
* alldata: rbind table from train and test table
* finaldata: last column contains the descriptive activity. Coluns names are more descriptives
* tidydata:  contains the average of each variable for each activity and each subject

## Activity Labels

* WALKING (value 1): subject was walking during the test
* WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
* WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
* SITTING (value 4): subject was sitting during the test
* STANDING (value 5): subject was standing during the test
* LAYING (value 6): subject was laying down during the test

