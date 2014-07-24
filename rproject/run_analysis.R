## Getting and Cleaning Data July 2014
#  Course Project

## 2, 1, 3 

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
    
    # defines features to keep
    keeps <- grep("*-mean|-std*", features[,2])
    
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
    trainingSet <- trainingSet[,keeps]
    
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
    testSet <- testSet[,keeps]
    
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
    
    
    

    summaryData <- aggregate(allData, 
                        by=list(allData$ActivityName, allData$Subject),
                        FUN=mean, 
                        na.rm=TRUE)
    
    write.table(summaryData, file="./cleanData.txt",
                append=FALSE,
                sep="\t",
                row.names=FALSE, 
                col.names=TRUE )
    
    #PENDING:
    # We have 30 subjects in total, so no need to use SetName. Use only
    # subject to aggregate
    #- The final File has another format (see project desc item 5)

}

# Run the project tasks
projectTasks()
