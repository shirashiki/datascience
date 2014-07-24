## CodeBook: Course Project tidy summary file

### What the file contains
The file contains the summary, mean value of the original variables related to
mean or standard deviation. The summary is aggregated and sortedby activity and 
subject.

### Variables

**What was changed in variable names**

The variable names where based on the ones in the raw files. The following 
changes were applied in order to make the variable name more legible:

- Removed the first letter "t" in each variable
- Replaced mean() by _Mean.
- Replaced std() by _StDeviation, which represents standard deviation.
- instead of X, Y, Z, added the Axis word to better describe the variable.
- Used underscores to keep the variable legible.


**Variable Names**

Here is a list of the original and the new variable names

Variable Name | Original variable name in raw file
------------- | ----------------------------------
BodyAcc_Mean_AxisX | tBodyAcc-mean()-X
BodyAcc_Mean_AxisY | tBodyAcc-mean()-Y
BodyAcc_Mean_AxisZ | tBodyAcc-mean()-Z
BodyAcc_StDeviation_AxisX | tBodyAcc-std()-X
BodyAcc_StDeviation_AxisY | tBodyAcc-std()-Y
BodyAcc_StDeviation_AxisZ | tBodyAcc-std()-Z
GravityAcc_Mean_AxisX | tGravityAcc-mean()-X
GravityAcc_Mean_AxisY | tGravityAcc-mean()-Y
GravityAcc_Mean_AxisZ | tGravityAcc-mean()-Z
GravityAcc_StDeviation_AxisX | tGravityAcc-std()-X
GravityAcc_StDeviation_AxisY | tGravityAcc-std()-Y
GravityAcc_StDeviation_AxisZ | tGravityAcc-std()-Z
BodyAccJerk_Mean_AxisX | tBodyAccJerk-mean()-X
BodyAccJerk_Mean_AxisY | tBodyAccJerk-mean()-Y
BodyAccJerk_Mean_AxisZ | tBodyAccJerk-mean()-Z
BodyAccJerk_StDeviation_AxisX | tBodyAccJerk-std()-X
BodyAccJerk_StDeviation_AxisY | tBodyAccJerk-std()-Y
BodyAccJerk_StDeviation_AxisZ | tBodyAccJerk-std()-Z
BodyGyro_Mean_AxisX | tBodyGyro-mean()-X
BodyGyro_Mean_AxisY | tBodyGyro-mean()-Y
BodyGyro_Mean_AxisZ | tBodyGyro-mean()-Z
BodyGyro_StDeviation_AxisX | tBodyGyro-std()-X
BodyGyro_StDeviation_AxisY | tBodyGyro-std()-Y
BodyGyro_StDeviation_AxisZ | tBodyGyro-std()-Z
BodyGyroJerk_Mean_AxisX | tBodyGyroJerk-mean()-X
BodyGyroJerk_Mean_AxisY | tBodyGyroJerk-mean()-Y
BodyGyroJerk_Mean_AxisZ | tBodyGyroJerk-mean()-Z
BodyGyroJerk_StDeviation_AxisX | tBodyGyroJerk-std()-X
BodyGyroJerk_StDeviation_AxisY | tBodyGyroJerk-std()-Y
BodyGyroJerk_StDeviation_AxisZ | tBodyGyroJerk-std()-Z
BodyAccMag_Mean | tBodyAccMag-mean()
BodyAccMag_StDeviation | tBodyAccMag-std()
GravityAccMag_Mean | tGravityAccMag-mean()
GravityAccMag_StDeviation | tGravityAccMag-std()
BodyAccJerkMag_Mean | tBodyAccJerkMag-mean()
BodyAccJerkMag_StDeviation | tBodyAccJerkMag-std()
BodyGyroMag_Mean | tBodyGyroMag-mean()
BodyGyroMag_StDeviation | tBodyGyroMag-std()
BodyGyroJerkMag_Mean | tBodyGyroJerkMag-mean()
BodyGyroJerkMag_StDeviation | tBodyGyroJerkMag-std()
BodyAcc_Mean_AxisX | fBodyAcc-mean()-X
BodyAcc_Mean_AxisY | fBodyAcc-mean()-Y
BodyAcc_Mean_AxisZ | fBodyAcc-mean()-Z
BodyAcc_StDeviation_AxisX | fBodyAcc-std()-X
BodyAcc_StDeviation_AxisY | fBodyAcc-std()-Y
BodyAcc_StDeviation_AxisZ | fBodyAcc-std()-Z
BodyAccJerk_Mean_AxisX | fBodyAccJerk-mean()-X
BodyAccJerk_Mean_AxisY | fBodyAccJerk-mean()-Y
BodyAccJerk_Mean_AxisZ | fBodyAccJerk-mean()-Z
BodyAccJerk_StDeviation_AxisX | fBodyAccJerk-std()-X
BodyAccJerk_StDeviation_AxisY | fBodyAccJerk-std()-Y
BodyAccJerk_StDeviation_AxisZ | fBodyAccJerk-std()-Z
BodyGyro_Mean_AxisX | fBodyGyro-mean()-X
BodyGyro_Mean_AxisY | fBodyGyro-mean()-Y
BodyGyro_Mean_AxisZ | fBodyGyro-mean()-Z
BodyGyro_StDeviation_AxisX | fBodyGyro-std()-X
BodyGyro_StDeviation_AxisY | fBodyGyro-std()-Y
BodyGyro_StDeviation_AxisZ | fBodyGyro-std()-Z
BodyAccMag_Mean | fBodyAccMag-mean()
BodyAccMag_StDeviation | fBodyAccMag-std()
BodyBodyAccJerkMag_Mean | fBodyBodyAccJerkMag-mean()
BodyBodyAccJerkMag_StDeviation | fBodyBodyAccJerkMag-std()
BodyBodyGyroMag_Mean | fBodyBodyGyroMag-mean()
BodyBodyGyroMag_StDeviation | fBodyBodyGyroMag-std()
BodyBodyGyroJerkMag_Mean | fBodyBodyGyroJerkMag-mean()
BodyBodyGyroJerkMag_StDeviation | fBodyBodyGyroJerkMag-std()

