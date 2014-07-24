## Getting and Cleaning Data July 2014 Course Project

### Preparation

You need to download and unzip the raw files in your working directory. Get the
files at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**After unzipping, your working directory needs to have a directory called 
"UCI HAR Dataset".**



### How the script works

**Project tasks required**

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

**How the script works**
(in parethesis see relation to project tasks)

- Checks if the required raw files are in the correct place. If not, the script 
stops. You need to have a directory called "UCI HAR Dataset" in your workspace.
- Prepares Training Set (task 2)
    + Loads the Training Set, keeping only columns related to mean and standard deviation
    + Adds the Activity Names and Subject to Training Set
- Prepates Test Set (task 2)
    + Loads the Test Set, keeping only columns related to mean and standard deviation
    + Adds the Activity Names and Subject to Test Set
- Merges Test and Training Sets (task 1)
- Add the Activity labels to merged data frame (task 3)
- Renames columns with meaningful names (task 4)
- Saves the tidy dataset with all data to FirstTidyData.txt, in working directory
- Saves the submission summary data set as SubmissionTidyData.txt in 
working directory (Task 5)

Notes:

- The submission tidy dataset is aggregated and ordered by Activity and Subject, 
in this order.
- For task 2 (Extracts only the measurements on the mean and standard deviation 
for each measurement), I kept only variables related to mean() and std(), as
described in features_info.txt.
- In the script source, check comments to see when project tasks were performed.

**Running the script**

- Copy the script run_analysis to your working directory, and run it using the
source() command. Example:
```{r, eval=FALSE}
source("run_analysis.R")
```


###Script Results
The script will generate 2 files. The file to be submitted will have the name 
SubmissionTidyData.txt.

The file contains 180 rows, related to 6 activities X 30 subjects. See the 
Codebook for file details.


