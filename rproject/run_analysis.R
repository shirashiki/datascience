## Getting and Cleaning Data July 2014
#  Course Project

# Loads feature names
featureNames <- read.table(file="./UCI HAR Dataset/features.txt",
                     header=FALSE, sep="")
# renames the features
colnames(featureNames)[1] = "FeaturePosition"
colnames(featureNames)[2] = "FeatureName"

# Load Test Set
testSet <- read.table(file="./UCI HAR Dataset/test/X_test.txt",
                   header=FALSE, sep="")

# renames the columns in set
colnames(testSet) <- featureNames$FeatureName
