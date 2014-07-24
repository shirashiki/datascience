## Getting and Cleaning Data July 2014
#  Course Project

## 2, 1, 3, 4 

## Tasks
# 1     Merges the training and the test sets to create one data set.
# 2     Extracts only the measurements on the mean and standard deviation 
#       for each measurement. 
# 3     Uses descriptive activity names to name the activities in the data set
# 4     Appropriately labels the data set with descriptive variable names. 
# 5     Creates a second, independent tidy data set with the average of each 
#       variable for each activity and each subject. 

projectTasks <- function() {
    ## ---------------------------------------------------------------
    ## Preparation steps
    
    # Check if the required files exists
    if (!file.exists("./UCI HAR Dataset/features.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/features.txt not found.")
    }
    
    if (!file.exists("./UCI HAR Dataset/activity_labels.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/activity_labels.txt not found.")
    }
    
    if (!file.exists("./UCI HAR Dataset/test/X_test.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/test/X_test.txt not found.")
    }
    
    if (!file.exists("./UCI HAR Dataset/test/y_test.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/test/y_test.txt not found.")
    }
    
    if (!file.exists("./UCI HAR Dataset/train/X_train.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/train/X_train.txt not found.")
    }
    
    if (!file.exists("./UCI HAR Dataset/train/y_train.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/train/y_train.txt not found.")
    }

    if (!file.exists("./UCI HAR Dataset/test/subject_test.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/test/subject_test not found.")
    }
    
    if (!file.exists("./UCI HAR Dataset/train/subject_train.txt")) {
        stop("Check if the data is in your working directory. 
                File ./UCI HAR Dataset/train/subject_train.txt not found.")
    }
    
    
    ## ---------------------------------------------------------------
    ## Loads training and test sets 
    
    # Loads features
    features <- read.table(file="./UCI HAR Dataset/features.txt",
                         header=FALSE, sep="")

    # puts meaningful column names
    colnames(features)[1] = "FeaturePosition"
    colnames(features)[2] = "FeatureName"
    
    # defines features to keep, matching -mean() and -std()
    # according to instructions in features_info.txt
    keeps <- grep("*-mean\\(|-std\\(*", features[,2])
    
    # Loads activity labels
    activityLabels <- read.table(file="./UCI HAR Dataset/activity_labels.txt",
                           header=FALSE, sep="")
    # puts meaningful column names
    colnames(activityLabels)[1] = "ActivityID"
    colnames(activityLabels)[2] = "ActivityName"
    
    
    ##----- Prepares Training data
    # Loads Training labels
    trainingLabels <- read.table(file="./UCI HAR Dataset/train/y_train.txt",
                           header=FALSE, sep="")
    colnames(trainingLabels)[1] <- "ActivityID"
    
    # Loads Training Set
    trainingSet <- read.table(file="./UCI HAR Dataset/train/X_train.txt",
                          header=FALSE, sep="")
    
    # Renames the columns in the Training set using the labels
    # in the feature.txt file
    colnames(trainingSet) <- features$FeatureName
    
    # Project Tasks:
    # 2 - Extracts only the measurements on the mean and standard deviation 
    #     for each measurement.
    trainingSet <- trainingSet[, keeps] 
    
    # Merges to name each activity in the data set
    trainingSet <- cbind(trainingLabels, trainingSet)
    
    # Loads subjects
    trainingSubjects <- read.table(file="./UCI HAR Dataset/train/subject_train.txt",
                                   header=FALSE, sep="")
    colnames(trainingSubjects)[1] <- "Subject"
    # Merges to add subject information
    trainingSet <- cbind(trainingSubjects, trainingSet)
    
    
    ##----- Prepares Test data
    # Loads Test labels
    testLabels <- read.table(file="./UCI HAR Dataset/test/y_test.txt",
                                 header=FALSE, sep="")
    colnames(testLabels)[1] <- "ActivityID"
    
    # Loads Test Set
    testSet <- read.table(file="./UCI HAR Dataset/test/X_test.txt",
                          header=FALSE, sep="")
    
    # Renames the columns in the Training set using the labels
    # in the feature.txt file
    colnames(testSet) <- features$FeatureName
    
    # Project Tasks:
    # 2 - Extracts only the measurements on the mean and standard deviation 
    #     for each measurement.
    testSet <- testSet[, keeps] 
    
    # Merges to name each activity in the data set
    testSet <- cbind(testLabels, testSet)
    
    # Loads subjects
    testSubjects <- read.table(file="./UCI HAR Dataset/test/subject_test.txt",
                               header=FALSE, sep="")
    colnames(testSubjects)[1] <- "Subject"
    
    # Merges to add subject information
    testSet <- cbind(testSubjects, testSet)
    
    ## ---------------------------------------------------------------
    ## Bind Training and Test Sets, generate files
    ## Also here we put meaningful column names
    
    # Project Tasks:
    # 1 - Merges the training and the test sets to create one data set.
    allData <- rbind(trainingSet, testSet)
    
    # Project Tasks:
    # 3 - Uses descriptive activity names to name the activities in the data set
    # Merge to add Activity Labels
    allData <- merge(activityLabels, allData, 
                                by.x="ActivityID",
                                by.y="ActivityID",
                                sort=FALSE,
                                all=TRUE)
    
    # Project Tasks:
    # 4 - Appropriately labels the data set with descriptive variable names.     

    # Drops remaining unwanted columns
    drops <- c("ActivityID")
    allData <- allData[,!(names(allData) %in% drops)]
    
    # Renames columns setting descriptive names
    names(allData)[names(allData)=="tBodyAcc-mean()-X"] <- "BodyAcc_Mean_AxisX"
    names(allData)[names(allData)=="tBodyAcc-mean()-Y"] <- "BodyAcc_Mean_AxisY"
    names(allData)[names(allData)=="tBodyAcc-mean()-Z"] <- "BodyAcc_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyAcc-std()-X"] <- "BodyAcc_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyAcc-std()-Y"] <- "BodyAcc_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyAcc-std()-Z"] <- "BodyAcc_StDeviation_AxisZ"
    names(allData)[names(allData)=="tGravityAcc-mean()-X"] <- "GravityAcc_Mean_AxisX"
    names(allData)[names(allData)=="tGravityAcc-mean()-Y"] <- "GravityAcc_Mean_AxisY"
    names(allData)[names(allData)=="tGravityAcc-mean()-Z"] <- "GravityAcc_Mean_AxisZ"
    names(allData)[names(allData)=="tGravityAcc-std()-X"] <- "GravityAcc_StDeviation_AxisX"
    names(allData)[names(allData)=="tGravityAcc-std()-Y"] <- "GravityAcc_StDeviation_AxisY"
    names(allData)[names(allData)=="tGravityAcc-std()-Z"] <- "GravityAcc_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyAccJerk-mean()-X"] <- "BodyAccJerk_Mean_AxisX"
    names(allData)[names(allData)=="tBodyAccJerk-mean()-Y"] <- "BodyAccJerk_Mean_AxisY"
    names(allData)[names(allData)=="tBodyAccJerk-mean()-Z"] <- "BodyAccJerk_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyAccJerk-std()-X"] <- "BodyAccJerk_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyAccJerk-std()-Y"] <- "BodyAccJerk_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyAccJerk-std()-Z"] <- "BodyAccJerk_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyGyro-mean()-X"] <- "BodyGyro_Mean_AxisX"
    names(allData)[names(allData)=="tBodyGyro-mean()-Y"] <- "BodyGyro_Mean_AxisY"
    names(allData)[names(allData)=="tBodyGyro-mean()-Z"] <- "BodyGyro_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyGyro-std()-X"] <- "BodyGyro_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyGyro-std()-Y"] <- "BodyGyro_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyGyro-std()-Z"] <- "BodyGyro_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyGyroJerk-mean()-X"] <- "BodyGyroJerk_Mean_AxisX"
    names(allData)[names(allData)=="tBodyGyroJerk-mean()-Y"] <- "BodyGyroJerk_Mean_AxisY"
    names(allData)[names(allData)=="tBodyGyroJerk-mean()-Z"] <- "BodyGyroJerk_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyGyroJerk-std()-X"] <- "BodyGyroJerk_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyGyroJerk-std()-Y"] <- "BodyGyroJerk_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyGyroJerk-std()-Z"] <- "BodyGyroJerk_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyAccMag-mean()"] <- "BodyAccMag_Mean"
    names(allData)[names(allData)=="tBodyAccMag-std()"] <- "BodyAccMag_StDeviation"
    names(allData)[names(allData)=="tGravityAccMag-mean()"] <- "GravityAccMag_Mean"
    names(allData)[names(allData)=="tGravityAccMag-std()"] <- "GravityAccMag_StDeviation"
    names(allData)[names(allData)=="tBodyAccJerkMag-mean()"] <- "BodyAccJerkMag_Mean"
    names(allData)[names(allData)=="tBodyAccJerkMag-std()"] <- "BodyAccJerkMag_StDeviation"
    names(allData)[names(allData)=="tBodyGyroMag-mean()"] <- "BodyGyroMag_Mean"
    names(allData)[names(allData)=="tBodyGyroMag-std()"] <- "BodyGyroMag_StDeviation"
    names(allData)[names(allData)=="tBodyGyroJerkMag-mean()"] <- "BodyGyroJerkMag_Mean"
    names(allData)[names(allData)=="tBodyGyroJerkMag-std()"] <- "BodyGyroJerkMag_StDeviation"
    names(allData)[names(allData)=="fBodyAcc-mean()-X"] <- "BodyAcc_Mean_AxisX"
    names(allData)[names(allData)=="fBodyAcc-mean()-Y"] <- "BodyAcc_Mean_AxisY"
    names(allData)[names(allData)=="fBodyAcc-mean()-Z"] <- "BodyAcc_Mean_AxisZ"
    names(allData)[names(allData)=="fBodyAcc-std()-X"] <- "BodyAcc_StDeviation_AxisX"
    names(allData)[names(allData)=="fBodyAcc-std()-Y"] <- "BodyAcc_StDeviation_AxisY"
    names(allData)[names(allData)=="fBodyAcc-std()-Z"] <- "BodyAcc_StDeviation_AxisZ"
    names(allData)[names(allData)=="fBodyAccJerk-mean()-X"] <- "BodyAccJerk_Mean_AxisX"
    names(allData)[names(allData)=="fBodyAccJerk-mean()-Y"] <- "BodyAccJerk_Mean_AxisY"
    names(allData)[names(allData)=="fBodyAccJerk-mean()-Z"] <- "BodyAccJerk_Mean_AxisZ"
    names(allData)[names(allData)=="fBodyAccJerk-std()-X"] <- "BodyAccJerk_StDeviation_AxisX"
    names(allData)[names(allData)=="fBodyAccJerk-std()-Y"] <- "BodyAccJerk_StDeviation_AxisY"
    names(allData)[names(allData)=="fBodyAccJerk-std()-Z"] <- "BodyAccJerk_StDeviation_AxisZ"
    names(allData)[names(allData)=="fBodyGyro-mean()-X"] <- "BodyGyro_Mean_AxisX"
    names(allData)[names(allData)=="fBodyGyro-mean()-Y"] <- "BodyGyro_Mean_AxisY"
    names(allData)[names(allData)=="fBodyGyro-mean()-Z"] <- "BodyGyro_Mean_AxisZ"
    names(allData)[names(allData)=="fBodyGyro-std()-X"] <- "BodyGyro_StDeviation_AxisX"
    names(allData)[names(allData)=="fBodyGyro-std()-Y"] <- "BodyGyro_StDeviation_AxisY"
    names(allData)[names(allData)=="fBodyGyro-std()-Z"] <- "BodyGyro_StDeviation_AxisZ"
    names(allData)[names(allData)=="fBodyAccMag-mean()"] <- "BodyAccMag_Mean"
    names(allData)[names(allData)=="fBodyAccMag-std()"] <- "BodyAccMag_StDeviation"
    names(allData)[names(allData)=="fBodyBodyAccJerkMag-mean()"] <- "BodyBodyAccJerkMag_Mean"
    names(allData)[names(allData)=="fBodyBodyAccJerkMag-std()"] <- "BodyBodyAccJerkMag_StDeviation"
    names(allData)[names(allData)=="fBodyBodyGyroMag-mean()"] <- "BodyBodyGyroMag_Mean"
    names(allData)[names(allData)=="fBodyBodyGyroMag-std()"] <- "BodyBodyGyroMag_StDeviation"
    names(allData)[names(allData)=="fBodyBodyGyroJerkMag-mean()"] <- "BodyBodyGyroJerkMag_Mean"
    names(allData)[names(allData)=="fBodyBodyGyroJerkMag-std()"] <- "BodyBodyGyroJerkMag_StDeviation"
    
    
    # Writes the tidy dataset
    write.table(allData, file="./FirstTidyData.txt",
                append=FALSE,
                sep="\t",
                row.names=FALSE, 
                col.names=TRUE )
    
    
    # Project Tasks:
    # 5 - Creates a second, independent tidy data set with the average of each 
    #     variable for each activity and each subject.
    
    # Get the average, grouping by Activity and Subject
    summaryData <- aggregate(allData, 
                        by=list(allData$ActivityName, allData$Subject),
                        FUN=mean, 
                        na.rm=TRUE)
    
    # Adjusts column names
    drops <- c("ActivityName", "Subject")
    summaryData <- summaryData[,!(names(summaryData) %in% drops)]
    names(summaryData)[names(summaryData)=="Group.1"] <- "ActivityName"
    names(summaryData)[names(summaryData)=="Group.2"] <- "Subject"
    
    # Sorts by Activity and Subject
    summaryData <- summaryData[with(summaryData, 
                                    order(ActivityName, Subject)), ]
    
    # Writes the Second tidy dataset. This is the one I am submitting
    write.table(summaryData, file="./SubmissionTidyData.txt",
                append=FALSE,
                sep="\t",
                row.names=FALSE, 
                col.names=TRUE )
    
}

# Run the project tasks
projectTasks()
