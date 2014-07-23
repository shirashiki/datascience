## Getting and Cleaning Data July 2014
#  Course Project


testSet<- read.csv(file="./UCI HAR Dataset/test/X_test.txt",
                   header=FALSE, sep="")
# after importing, some cloumns may not come as numeric

