## README.md

This folder contains the project files and sub-folders for the Coursera module on "Getting & Cleaning Data", a course offered by the Johns Hopkins University.


The objective of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data set that can be used for subsequent analysis. 


The following steps were carried out in this project and were accomplished through an R script named, `run_analysis.R`.  

__1.__ The training and the test sets were merged to create one data set. The data contained in the following files (i.e. `subject_train.txt`, `X_train.txt`, `y_train.txt`, `subject_test.txt`, `X_test.txt`, `y_test.txt`) were combined.

__2.__ The variables in the data set were named using the descriptive variable names found in the `features.txt` file.

__3.__ From the 561 features, only those that contained the mean and standard deviation of each measurement (i.e. 66 features) were extracted. 

__4.__ The activities in the data set were named using the descriptive activity names found in the ```activity_labels.txt``` file.

__5.__ Finally, a second, independent tidy data set was created that consisted of the average of each variable for each activity and each subject.  

To reproduce the analysis, download all the files and sub-folders in this repository as per the current directory structure, and run the `run_analysis.R` script.  

## List of files and sub-folders in this repository  

### Current Folder

__1. README.md__  
This is what you are reading right now.

__2. CodeBook.md__  
A document that describes the variables, data and transformations performed to convert the raw data in the training and test sets to the tidy data set in "tidyData.txt".

__3. run_analysis.R__  
The R script used to convert the training and test data sets into the tidy data set in "tidyData.txt".

__4. tidyData.txt__  
The output from the R script, "run_analysis.R".


### ./UCI HAR Dataset/  
__4. features.txt__  
A document containing the list of all features.  

__5. activity_labels.txt__  
A document that links the class labels with their activity names.  

### ./UCI HAR Dataset/train/  

__6. subject_train.txt__  
Data where each row identifies the subject who performed the activity for each window sample in the training data set. Its range is from 1 to 30.   

__7. X_train.txt__  
Training data set, comprising 561 features and 7,352 measurements/rows.  

__8. y_train.txt__  
Activity labels for the training data set, comprising 1 variable and 7,352 rows.  


### ./UCI HAR Dataset/test/  

__9. subject_test.txt__  
Data where each row identifies the subject who performed the activity for each window sample in the test data set. Its range is from 1 to 30. 

__10. X_test.txt__  
Test data set, comprising 561 features and 2,947 measurements/rows.

__11. y_test.txt__  
Activity labels for the test data set, comprising 1 variable and 2,947 rows.  
