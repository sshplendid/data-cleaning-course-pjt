#Getting and Cleaning Data Course Project

##Writer : SeHun Shin

It is 'Getting and Cleaning Data' course project of SeHun Shin.
You can execute a script named 'run_analysis.R' in main directory.
And this script generates txt file named 'tidyData.txt' in 'result' directory.
This is a result file to submit on web page.

This script consists of 6 parts.

0. load the data and prepare to clean it
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I wrote detail comments on the script. And you can chase each step started with '##'


## Description of variable and function
1. activity : table contains activity names. it helps a user to name the activities in the dataset.
2. data.1.merged : 1st data set merged two data set.
3. data.2.filtered : 2nd data set filtered only measurement about mean and standard deviation.
4. data.3.named : 3rd data set to change values of  activitie column to descriptive activity name.
5. data.4.rename : 4th data set to rename columns' title from meaningless column name like 'V1', 'V2'.
6. data.5.tidy : 5th data set for independent tidy data set.
7. feat : Feature name
8. testIds : Identifier of test dataset
9. testLabel : activity code of test data set. It can be interpreted by 'activity' dataset
10. testSet : test data set
11. trainIds : Identifier of train  dataset
12. trainLabel : activity code of train data set. It can be interpreted by 'activity' dataset
13. trainSet : train data set
15. column.names : a vector of whole column name set.
16. column.names2 : a vector of extracted column name set.
17. dataDir : a directory include data files.
18. pattern : a regular expression pattern for extract the measurement on the mean and standard deviation.
19. getActivityName : a function that returns activity name. A parameter is activity code of record.
20. makeActivityList : returns a column that consist of activity name.