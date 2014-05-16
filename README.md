Getting and Cleaning data Course project 
===================

###What this is
This repo contains a script for an assignemnt in the Coursera "Getting and Cleaning Data" course. It takes raw data, and transforms it (see codebook for details). Results are stored in two separate files.


###Raw data used
Accelerometer data from smartphone.
Information about the data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Download source (downloaded 2014-05-13 for this assignment):
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###What it does
The main functionality of this script is extracting, transforming and merging the data from the separate files. 

Put the data in the ./data folder. Running the runAnalysis function from run_analysis.R will result in two files being created in ./result:
./result/mean-and-std-measurements.csv - contains means and standard deviations for a number of accelerometer measurements.
./result/mean-measurements.csv - contains the average accelerometer measurements grouped by subject and activity type.

You can find more details about these files in Codebook.md

###How to use it
1. Download the raw data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip data and put it in the ./data folder
3. Source run_analysis.R, run the function runAnalysis(). The resulting files will be created in the ./result folder.






