==================================================================
Description of datascience_courseproject repository 
https://github.com/mrhelmus/datascience_courseproject
==================================================================
Author: Matt Helmus
www.matthelmus.com
==================================================================

This repository contains code and the data for the Coursera "Getting and Cleaning Data" Course Project https://class.coursera.org/getdata-007 
Files in the repository include:
A: "README.md"
B: "run_analysis.R"
C: "tidy_Samsung_Galaxy_S_wearable.txt"
D: "CodeBook.md"

--

A: In this README
~~ indicates R objects 
"" indicates files
** indicates functions

--

B: The R code contained in "run_analysis.R" does the following:

-1. Reads in data assuming that the zip file found here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
has been extracted and in the working directory is structured in the same way as the extraction file structure with two folders, train and test, containing the train "X_train.txt" and test "X_test.txt" data sets, respectively.

-2. Merges the train and test data sets to create  ~full~,  and adds descriptive variable names from the "features.txt" file contained in the working directory.

-3. Reads in and creates grouping ids for subject and activity type that are then appended to ~full~.  

-4. Extracts only the measurements that are means and stds using *grep* and creates ~full.mean.std~.

-5. Makes descriptive activity names and appends to ~full.mean.std~.

-6. Summarizes ~full.mean.std~ by taking the means of each variable across group ids, subject and activity, to produce ~tidy~.

-7. Writes ~tidy~ to the file "tidy_Samsung_Galaxy_S_wearable.txt"

--

C: "tidy_Samsung_Galaxy_S_wearable.txt" is the summarized by means ~tidy~ data set

--

D: "CodeBook.md" a code book that describes the variables in the ~tidy~ data

--

Notes:
BELOW ARE THE COPIED INSTRUCTIONS FOR THE PROJECT:
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
