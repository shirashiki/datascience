## CodeBook: Course Project tidy summary file

### What the file contains
The file contains the summary, mean value of the original variables related to
mean or standard deviation. The summary is aggregated and sorted by activity and 
subject.

Each row contains one observation, so the number of rows in file is 
equal to (number of activities) X (number of subjects).


Other details:

- Header: the file contains a header in the first line of the file, so you can
identify each variable.
- Column separator: the columns are separated by tab (\t).


### Variables

**What was changed in variable names**

The variable names where based on the ones in the raw files. The following 
changes were applied in order to make the variable name more legible:

- Replaced the first letter from "t" to Time_ or from "f" to FastFourierTransf_
- Replaced mean() by _Mean.
- Replaced std() by _StDeviation, which represents standard deviation.
- instead of X, Y, Z, added the Axis word to better describe the variable.
- Used underscores to keep the variable legible.


**Variable Names**

Here is a list of the original and the new variable names

Variable Name | Original variable name in raw file
------------- | ----------------------------------
Time_BodyAcc_Mean_AxisX | tBodyAcc-mean()-X
Time_BodyAcc_Mean_AxisY | tBodyAcc-mean()-Y
Time_BodyAcc_Mean_AxisZ | tBodyAcc-mean()-Z
Time_BodyAcc_StDeviation_AxisX | tBodyAcc-std()-X
Time_BodyAcc_StDeviation_AxisY | tBodyAcc-std()-Y
Time_BodyAcc_StDeviation_AxisZ | tBodyAcc-std()-Z
Time_GravityAcc_Mean_AxisX | tGravityAcc-mean()-X
Time_GravityAcc_Mean_AxisY | tGravityAcc-mean()-Y
Time_GravityAcc_Mean_AxisZ | tGravityAcc-mean()-Z
Time_GravityAcc_StDeviation_AxisX | tGravityAcc-std()-X
Time_GravityAcc_StDeviation_AxisY | tGravityAcc-std()-Y
Time_GravityAcc_StDeviation_AxisZ | tGravityAcc-std()-Z
Time_BodyAccJerk_Mean_AxisX | tBodyAccJerk-mean()-X
Time_BodyAccJerk_Mean_AxisY | tBodyAccJerk-mean()-Y
Time_BodyAccJerk_Mean_AxisZ | tBodyAccJerk-mean()-Z
Time_BodyAccJerk_StDeviation_AxisX | tBodyAccJerk-std()-X
Time_BodyAccJerk_StDeviation_AxisY | tBodyAccJerk-std()-Y
Time_BodyAccJerk_StDeviation_AxisZ | tBodyAccJerk-std()-Z
Time_BodyGyro_Mean_AxisX | tBodyGyro-mean()-X
Time_BodyGyro_Mean_AxisY | tBodyGyro-mean()-Y
Time_BodyGyro_Mean_AxisZ | tBodyGyro-mean()-Z
Time_BodyGyro_StDeviation_AxisX | tBodyGyro-std()-X
Time_BodyGyro_StDeviation_AxisY | tBodyGyro-std()-Y
Time_BodyGyro_StDeviation_AxisZ | tBodyGyro-std()-Z
Time_BodyGyroJerk_Mean_AxisX | tBodyGyroJerk-mean()-X
Time_BodyGyroJerk_Mean_AxisY | tBodyGyroJerk-mean()-Y
Time_BodyGyroJerk_Mean_AxisZ | tBodyGyroJerk-mean()-Z
Time_BodyGyroJerk_StDeviation_AxisX | tBodyGyroJerk-std()-X
Time_BodyGyroJerk_StDeviation_AxisY | tBodyGyroJerk-std()-Y
Time_BodyGyroJerk_StDeviation_AxisZ | tBodyGyroJerk-std()-Z
Time_BodyAccMag_Mean | tBodyAccMag-mean()
Time_BodyAccMag_StDeviation | tBodyAccMag-std()
Time_GravityAccMag_Mean | tGravityAccMag-mean()
Time_GravityAccMag_StDeviation | tGravityAccMag-std()
Time_BodyAccJerkMag_Mean | tBodyAccJerkMag-mean()
Time_BodyAccJerkMag_StDeviation | tBodyAccJerkMag-std()
Time_BodyGyroMag_Mean | tBodyGyroMag-mean()
Time_BodyGyroMag_StDeviation | tBodyGyroMag-std()
Time_BodyGyroJerkMag_Mean | tBodyGyroJerkMag-mean()
Time_BodyGyroJerkMag_StDeviation | tBodyGyroJerkMag-std()
FastFourierTransf_BodyAcc_Mean_AxisX | fBodyAcc-mean()-X
FastFourierTransf_BodyAcc_Mean_AxisY | fBodyAcc-mean()-Y
FastFourierTransf_BodyAcc_Mean_AxisZ | fBodyAcc-mean()-Z
FastFourierTransf_BodyAcc_StDeviation_AxisX | fBodyAcc-std()-X
FastFourierTransf_BodyAcc_StDeviation_AxisY | fBodyAcc-std()-Y
FastFourierTransf_BodyAcc_StDeviation_AxisZ | fBodyAcc-std()-Z
FastFourierTransf_BodyAccJerk_Mean_AxisX | fBodyAccJerk-mean()-X
FastFourierTransf_BodyAccJerk_Mean_AxisY | fBodyAccJerk-mean()-Y
FastFourierTransf_BodyAccJerk_Mean_AxisZ | fBodyAccJerk-mean()-Z
FastFourierTransf_BodyAccJerk_StDeviation_AxisX | fBodyAccJerk-std()-X
FastFourierTransf_BodyAccJerk_StDeviation_AxisY | fBodyAccJerk-std()-Y
FastFourierTransf_BodyAccJerk_StDeviation_AxisZ | fBodyAccJerk-std()-Z
FastFourierTransf_BodyGyro_Mean_AxisX | fBodyGyro-mean()-X
FastFourierTransf_BodyGyro_Mean_AxisY | fBodyGyro-mean()-Y
FastFourierTransf_BodyGyro_Mean_AxisZ | fBodyGyro-mean()-Z
FastFourierTransf_BodyGyro_StDeviation_AxisX | fBodyGyro-std()-X
FastFourierTransf_BodyGyro_StDeviation_AxisY | fBodyGyro-std()-Y
FastFourierTransf_BodyGyro_StDeviation_AxisZ | fBodyGyro-std()-Z
FastFourierTransf_BodyAccMag_Mean | fBodyAccMag-mean()
FastFourierTransf_BodyAccMag_StDeviation | fBodyAccMag-std()
FastFourierTransf_BodyBodyAccJerkMag_Mean | fBodyBodyAccJerkMag-mean()
FastFourierTransf_BodyBodyAccJerkMag_StDeviation | fBodyBodyAccJerkMag-std()
FastFourierTransf_BodyBodyGyroMag_Mean | fBodyBodyGyroMag-mean()
FastFourierTransf_BodyBodyGyroMag_StDeviation | fBodyBodyGyroMag-std()
FastFourierTransf_BodyBodyGyroJerkMag_Mean | fBodyBodyGyroJerkMag-mean()
FastFourierTransf_BodyBodyGyroJerkMag_StDeviation | fBodyBodyGyroJerkMag-std()

