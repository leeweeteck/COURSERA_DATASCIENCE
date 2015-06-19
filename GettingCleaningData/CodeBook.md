## CodeBook.md

### Variables  

__1. \<name\>.path__  
file paths that point to the respective data files

__2. activity.label__  
`activityCode`: class labels for the activities, where,  

* 1: walking
* 2: walking_upstairs
* 3: walking_downstairs
* 4: sitting
* 5: standing
* 6: laying  

`activity` : name of the activity  

__3. features__  
`featureNum`: serial number of the features  
`feature`: name of the feature; __*'-XYZ'*__ is used to denote 3-axial signals in the X, Y and Z directions, __*'std'*__ is used to denote the standard deviation of the measurement, and __*'mean'*__ is used to denote the mean of the measurement; values are normalized and bounded within [-1,1]

* `tBodyAcc-XYZ`: time-domain signals; body linear acceleration
* `tGravityAcc-XYZ`: time-domain signals; gravity acceleration
* `tBodyAccJerk-XYZ`: time-domain signals; body linear acceleration jerk
* `tBodyGyro-XYZ`: time-domain signals; body angular velocity 
* `tBodyGyroJerk-XYZ`: time-domain signals; body angular velocity jerk
* `tBodyAccMag`: time-domain signals; body linear acceleration magnitude
* `tGravityAccMag`: time-domain signals; gravity acceleration magnitude
* `tBodyAccJerkMag`: time-domain signals; body linear acceleration jerk magnitude
* `tBodyGyroMag`: time-domain signals; body angular velocity magnitude
* `tBodyGyroJerkMag`: time-domain signals; body angular velocity jerk magnitude
* `fBodyAcc-XYZ`: frequency-domain signals; body linear acceleration
* `fBodyAccJerk-XYZ`: frequency-domain signals; body linear acceleration jerk
* `fBodyGyro-XYZ`: frequency-domain signals; body angular velocity
* `fBodyAccMag`: frequency-domain signals; body linear acceleration magnitude
* `fBodyAccJerkMag`: frequency-domain signals; body linear acceleration jerk magnitude
* `fBodyGyroMag`: frequency-domain signals; body angular velocity magnitude
* `fBodyGyroJerkMag`: frequency-domain signals; body angular velocity jerk magnitude  

__4. train, test__  
original training and test sets  

__5. train.label, test.label__  
original training and test labels, labels range from 1 to 6 and correspond to the `activityCode` column in __activity.label__    

__6. train.subj, test.subj__  
original training and test subject data; subjects range from 1 to 30  

__7. data__  
combined training and test sets  

__8. labels__  
combined training and test labels  

__9. subjects__  
combined training and test subject data  

__10. full.data__  
data that combined (7), (8) and (9), and with only features that contained the 'std' and 'mean' values of each measurement  

__11. tidy.data__  
tidy data set, containing the average of each variable in (10) for each activity and each subject