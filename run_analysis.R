setwd("/Volumes/Mango/workspace/Data_Science/data-cleaning/week_4/course_pjt")

## This code was written by SeHun Shin.

# load a library to handle data easily.
library(dplyr)

## Steps
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## STEP 0. load the data and prepare to clean it

# setting directory for reading datas
dataDir <- "./data"

# read each data
# read activity label
activity <- read.table(paste(dataDir,"/activity_labels.txt", sep=""),
                       colClasses = c("numeric", "character"))
# read feature label
feat <- read.table(paste(dataDir,"/features.txt", sep=""),
                   colClasses = c("numeric", "character")) # set column class for merge with other data.

# read train observation(id) and train dataset
trainIds <- read.table(paste(dataDir,"/train/subject_train.txt", sep=""), colClasses = c("factor"))
trainSet <- read.table(paste(dataDir,"/train/X_train.txt", sep=""))
# read label for train dataset
trainLabel <- read.table(paste(dataDir,"/train/y_train.txt", sep=""))

# read test observation(id) and test dataset
testIds <- read.table(paste(dataDir,"/test/subject_test.txt", sep=""), colClasses = c("factor"))
testSet <- read.table(paste(dataDir,"/test/X_test.txt", sep=""))
# read label for test dataset
testLabel <- read.table(paste(dataDir,"/test/y_test.txt", sep=""))

# set column name of dataset
column.names <- c("IDs", "Activity", feat[,2])



## STEP 1. Merges the training and the test sets to create one data set.

# bind each data (IDs : observation identifier, Label: activity type of record, trainSet/testSet:measurement data)
trainSet <- cbind("IDs" = trainIds, trainLabel, trainSet)
testSet  <- cbind("IDs" = testIds,  testLabel,  testSet)

# merge train dataset and test dataset
data.1.merged <- rbind(trainSet, testSet)


## STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# make regular expression pattern to pick column named like 'mean' or 'std'(standard deviation)
pattern <- "IDs|mean|std|Activity"
# pick column from merged dataset
data.2.filtered <- data.1.merged[,grep(pattern, column.names)]
column.names2 <- column.names[grep(pattern, column.names)]

## STEP 3. Uses descriptive activity names to name the activities in the data set

# function for getting activity name of filtered data's each row
getActivityName <- function(i) {
    activity[data.2.filtered[i, grep("Activity", column.names2)],2] 
}

# function that makes a vector contains activity names(factor type)
makeActivityList <- function() {
  activityNm <- character(length(data.2.filtered[,1]))
  for(i in 1:length(data.2.filtered[,1])) {
    activityNm[i] <- getActivityName(i)
  }
  as.factor(activityNm)
}
data.3.named <- data.2.filtered
data.3.named[, grep("Activity", column.names2)] <- makeActivityList()



## STEP 4. Appropriately labels the data set with descriptive variable names.
# rename columns of data
data.4.rename <- data.3.named
colnames(data.4.rename) <- column.names2

## STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# make a second data(tidy data)

data.5.tidy <- data.4.rename %>% group_by(IDs, Activity) %>% summarize_each(funs(mean))
data.5.tidy

### Finished. write a file to upload
write.table(data.5.tidy, file = "./result/tidyData.txt", row.name=FALSE)
