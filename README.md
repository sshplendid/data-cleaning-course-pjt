#Getting and Cleaning Data Course Project

##Writer : SeHun Shin

It is 'Getting and Cleaning Data' course project of SeHun Shin.
You can execute a script named 'run_analysis.R' in main directory.
And this script generates txt file named 'tidyData.txt' in 'result' directory.
This is a result file to submit on web page.

##how to run the code
I uploaded my whole work directory.
You can execute a script named *'run_analysis.R'* in main directory.
This script need file structure like repository(include files). Maybe you just download zip file and unzip on *'data directory'*. or you can change a directory name of 'data'. and just reset a variable named `dataDir` to your directory name in the code.
And this script generates txt file named 'tidyData.txt' in 'result' directory.
This is a result file to submit on web page.

##Data Information

you can get information about data set - [click here][url1]
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 


[url1][http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]