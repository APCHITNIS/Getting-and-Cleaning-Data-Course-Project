# Getting-and-Cleaning-Data-Course-Project

Download run_analysis.R file and run in your working directory. 
<li> This file creates a folder "dataset" in your working directory. 
<li> Downloads the orginal data from the location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
<li> Unzips the file in your working directory. 
<li> Unzipped files will be under the folder "UCI HAR Dataset"
<li> As requested this script then performs the following operations
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names.
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
<li> tidy.csv will be created in your working directory.

Dependency
================
You will need install the package "reshape2" if it is not already loaded in your environment

Please leave a message if you face any difficulty in running the file.

Thanks,
Amit Chitnis
(apchitnis@gmail.com)
