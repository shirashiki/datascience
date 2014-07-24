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
    names(allData)[names(allData)=="tBodyAcc-mean()-X"] <- "Time_BodyAcc_Mean_AxisX"
    names(allData)[names(allData)=="tBodyAcc-mean()-Y"] <- "Time_BodyAcc_Mean_AxisY"
    names(allData)[names(allData)=="tBodyAcc-mean()-Z"] <- "Time_BodyAcc_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyAcc-std()-X"] <- "Time_BodyAcc_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyAcc-std()-Y"] <- "Time_BodyAcc_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyAcc-std()-Z"] <- "Time_BodyAcc_StDeviation_AxisZ"
    names(allData)[names(allData)=="tGravityAcc-mean()-X"] <- "Time_GravityAcc_Mean_AxisX"
    names(allData)[names(allData)=="tGravityAcc-mean()-Y"] <- "Time_GravityAcc_Mean_AxisY"
    names(allData)[names(allData)=="tGravityAcc-mean()-Z"] <- "Time_GravityAcc_Mean_AxisZ"
    names(allData)[names(allData)=="tGravityAcc-std()-X"] <- "Time_GravityAcc_StDeviation_AxisX"
    names(allData)[names(allData)=="tGravityAcc-std()-Y"] <- "Time_GravityAcc_StDeviation_AxisY"
    names(allData)[names(allData)=="tGravityAcc-std()-Z"] <- "Time_GravityAcc_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyAccJerk-mean()-X"] <- "Time_BodyAccJerk_Mean_AxisX"
    names(allData)[names(allData)=="tBodyAccJerk-mean()-Y"] <- "Time_BodyAccJerk_Mean_AxisY"
    names(allData)[names(allData)=="tBodyAccJerk-mean()-Z"] <- "Time_BodyAccJerk_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyAccJerk-std()-X"] <- "Time_BodyAccJerk_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyAccJerk-std()-Y"] <- "Time_BodyAccJerk_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyAccJerk-std()-Z"] <- "Time_BodyAccJerk_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyGyro-mean()-X"] <- "Time_BodyGyro_Mean_AxisX"
    names(allData)[names(allData)=="tBodyGyro-mean()-Y"] <- "Time_BodyGyro_Mean_AxisY"
    names(allData)[names(allData)=="tBodyGyro-mean()-Z"] <- "Time_BodyGyro_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyGyro-std()-X"] <- "Time_BodyGyro_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyGyro-std()-Y"] <- "Time_BodyGyro_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyGyro-std()-Z"] <- "Time_BodyGyro_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyGyroJerk-mean()-X"] <- "Time_BodyGyroJerk_Mean_AxisX"
    names(allData)[names(allData)=="tBodyGyroJerk-mean()-Y"] <- "Time_BodyGyroJerk_Mean_AxisY"
    names(allData)[names(allData)=="tBodyGyroJerk-mean()-Z"] <- "Time_BodyGyroJerk_Mean_AxisZ"
    names(allData)[names(allData)=="tBodyGyroJerk-std()-X"] <- "Time_BodyGyroJerk_StDeviation_AxisX"
    names(allData)[names(allData)=="tBodyGyroJerk-std()-Y"] <- "Time_BodyGyroJerk_StDeviation_AxisY"
    names(allData)[names(allData)=="tBodyGyroJerk-std()-Z"] <- "Time_BodyGyroJerk_StDeviation_AxisZ"
    names(allData)[names(allData)=="tBodyAccMag-mean()"] <- "Time_BodyAccMag_Mean"
    names(allData)[names(allData)=="tBodyAccMag-std()"] <- "Time_BodyAccMag_StDeviation"
    names(allData)[names(allData)=="tGravityAccMag-mean()"] <- "Time_GravityAccMag_Mean"
    names(allData)[names(allData)=="tGravityAccMag-std()"] <- "Time_GravityAccMag_StDeviation"
    names(allData)[names(allData)=="tBodyAccJerkMag-mean()"] <- "Time_BodyAccJerkMag_Mean"
    names(allData)[names(allData)=="tBodyAccJerkMag-std()"] <- "Time_BodyAccJerkMag_StDeviation"
    names(allData)[names(allData)=="tBodyGyroMag-mean()"] <- "Time_BodyGyroMag_Mean"
    names(allData)[names(allData)=="tBodyGyroMag-std()"] <- "Time_BodyGyroMag_StDeviation"
    names(allData)[names(allData)=="tBodyGyroJerkMag-mean()"] <- "Time_BodyGyroJerkMag_Mean"
    names(allData)[names(allData)=="tBodyGyroJerkMag-std()"] <- "Time_BodyGyroJerkMag_StDeviation"
    names(allData)[names(allData)=="fBodyAcc-mean()-X"] <- "FastFourierTransf_BodyAcc_Mean_AxisX"
    names(allData)[names(allData)=="fBodyAcc-mean()-Y"] <- "FastFourierTransf_BodyAcc_Mean_AxisY"
    names(allData)[names(allData)=="fBodyAcc-mean()-Z"] <- "FastFourierTransf_BodyAcc_Mean_AxisZ"
    names(allData)[names(allData)=="fBodyAcc-std()-X"] <- "FastFourierTransf_BodyAcc_StDeviation_AxisX"
    names(allData)[names(allData)=="fBodyAcc-std()-Y"] <- "FastFourierTransf_BodyAcc_StDeviation_AxisY"
    names(allData)[names(allData)=="fBodyAcc-std()-Z"] <- "FastFourierTransf_BodyAcc_StDeviation_AxisZ"
    names(allData)[names(allData)=="fBodyAccJerk-mean()-X"] <- "FastFourierTransf_BodyAccJerk_Mean_AxisX"
    names(allData)[names(allData)=="fBodyAccJerk-mean()-Y"] <- "FastFourierTransf_BodyAccJerk_Mean_AxisY"
    names(allData)[names(allData)=="fBodyAccJerk-mean()-Z"] <- "FastFourierTransf_BodyAccJerk_Mean_AxisZ"
    names(allData)[names(allData)=="fBodyAccJerk-std()-X"] <- "FastFourierTransf_BodyAccJerk_StDeviation_AxisX"
    names(allData)[names(allData)=="fBodyAccJerk-std()-Y"] <- "FastFourierTransf_BodyAccJerk_StDeviation_AxisY"
    names(allData)[names(allData)=="fBodyAccJerk-std()-Z"] <- "FastFourierTransf_BodyAccJerk_StDeviation_AxisZ"
    names(allData)[names(allData)=="fBodyGyro-mean()-X"] <- "FastFourierTransf_BodyGyro_Mean_AxisX"
    names(allData)[names(allData)=="fBodyGyro-mean()-Y"] <- "FastFourierTransf_BodyGyro_Mean_AxisY"
    names(allData)[names(allData)=="fBodyGyro-mean()-Z"] <- "FastFourierTransf_BodyGyro_Mean_AxisZ"
    names(allData)[names(allData)=="fBodyGyro-std()-X"] <- "FastFourierTransf_BodyGyro_StDeviation_AxisX"
    names(allData)[names(allData)=="fBodyGyro-std()-Y"] <- "FastFourierTransf_BodyGyro_StDeviation_AxisY"
    names(allData)[names(allData)=="fBodyGyro-std()-Z"] <- "FastFourierTransf_BodyGyro_StDeviation_AxisZ"
    names(allData)[names(allData)=="fBodyAccMag-mean()"] <- "FastFourierTransf_BodyAccMag_Mean"
    names(allData)[names(allData)=="fBodyAccMag-std()"] <- "FastFourierTransf_BodyAccMag_StDeviation"
    names(allData)[names(allData)=="fBodyBodyAccJerkMag-mean()"] <- "FastFourierTransf_BodyBodyAccJerkMag_Mean"
    names(allData)[names(allData)=="fBodyBodyAccJerkMag-std()"] <- "FastFourierTransf_BodyBodyAccJerkMag_StDeviation"
    names(allData)[names(allData)=="fBodyBodyGyroMag-mean()"] <- "FastFourierTransf_BodyBodyGyroMag_Mean"
    names(allData)[names(allData)=="fBodyBodyGyroMag-std()"] <- "FastFourierTransf_BodyBodyGyroMag_StDeviation"
    names(allData)[names(allData)=="fBodyBodyGyroJerkMag-mean()"] <- "FastFourierTransf_BodyBodyGyroJerkMag_Mean"
    names(allData)[names(allData)=="fBodyBodyGyroJerkMag-std()"] <- "FastFourierTransf_BodyBodyGyroJerkMag_StDeviation"
    
    
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
