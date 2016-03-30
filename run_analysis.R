library(dplyr)

# Create directory Wearable Computing and set working directory
# Dowload the dataset and extract files

if (!file.exists("WearableComputing")){
        dir.create("./WearableComputing")
        setwd("./WearableComputing")
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, destfile="dataset.zip")
        unzip("dataset.zip")
} else {
        setwd("./WearableComputing")
        }

# Read informations on activities and measured features
activities <- tbl_df(read.table("./UCI HAR Dataset/activity_labels.txt"))
features <- tbl_df(read.table("./UCI HAR Dataset/features.txt"))

# Read the train data
trsubject <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt"))
tractivity <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt"))
trdata <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt"))

# Assign column names to data
names(activities) <- c("activityId", "activity")
names(features) <- c("featureId", "feature")
names(trsubject) <- "subjectId"
names(tractivity) <- "activityId"
names(trdata) <- features$feature

# Create train dataset containing identification of subect, activity 
#and measures
train <- cbind(trsubject, tractivity, trdata)

# Read the test data
tesubject <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt"))
teactivity <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt"))
tedata <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt"))

# Assign column names to data
names(tesubject) <- "subjectId"
names(teactivity) <- "activityId"
names(tedata) <- features$feature

# Create test dataset containing identification of subect, activity 
#and measures
test <- cbind(tesubject, teactivity, tedata)

# 1. Merge training and test data to create one dataset

alldata <- rbind(train, test)

# 2. Extract only the measurements on the mean and standard deviation 

#for each measurement.
#Create a logical vector to select the firts two columns (subjetcId and
#activityId) and columns containing measurements of mean and standard deviation
selection <- grepl("subjectId|activityId|mean|std", names(alldata))
alldata <- alldata[,selection] #subsetting

#3. Using descriptive activity names to name the activities in the data set

#merging alldata and activities by "activityId", keeping all rows from alldata
#dataset
finaldata = merge(alldata, activities, by="activityId", all.x=TRUE)
#descriptive activity names in last column of finaldata. 
finaldata$activity <- as.character(finaldata$activity)

#4. Appropriately labels the data set with descriptive variable names.

#explicit time and frequency
#eliminate () and -
names(finaldata)<- gsub("^t", "time", names(finaldata))
names(finaldata)<- gsub("^f", "frequency", names(finaldata))
names(finaldata)<- gsub("\\()","", names(finaldata))

#5. Create a second, independent tidy data set with the average of each 
#variable for each activity and each subject.

tidydata = finaldata %>% group_by(activityId, activity, subjectId) %>% 
        summarize_each(funs(mean))
#write to text file to disk
write.table(tidydata, "Tidydata.txt", row.name=FALSE)