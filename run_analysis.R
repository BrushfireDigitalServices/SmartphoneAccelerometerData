run_analysis <- function() {
    ## You should create one R script called run_analysis.R that does the following. 
    print("Running library(data.table)")
    library(data.table)
    
    ## 1) Merges the training and the test sets to create one data set:
    
    ## read in names of variables in accelerometer and gyroscope data
    ## for some reason, using colClasses = NULL, character causes malfunction at grep
    print("Reading names of variables for accelerometer and gyroscope data")
    featureNames <- read.table("../UCI HAR Dataset/features.txt", colClasses = c("numeric", "character"))[[2]]
    featureNames <- make.names(featureNames, unique = TRUE)
    
    print("Reading and concatenating accelerometer and gyroscope data from both test and training sets. This might take a while.")
    accelMerged <- rbind(read.table("../UCI HAR Dataset/test/X_test.txt", col.names = featureNames), read.table("../UCI HAR Dataset/train/X_train.txt", col.names = featureNames))
    print(head(str(accelMerged)))
    print("Reading and concatenating subject identifier data from both test and training sets")   
    subjMerged <- rbind(read.table("../UCI HAR Dataset/test/subject_test.txt"), read.table("../UCI HAR Dataset/train/subject_train.txt"))
    
    print("Coercing subject identifier numbers to factors")
    subjMerged$V1 <- as.factor(subjMerged$V1)
    setnames(subjMerged, old = "V1", new = "Subject")
    
    print("Reading and concatenating activity identifier data from both test and training sets")
    activMerged <- rbind(read.table("../UCI HAR Dataset/test/y_test.txt"), read.table("../UCI HAR Dataset/train/y_train.txt"))
    
    print("Coercing activity identifier numbers to factors")
    activMerged$V1 <- as.factor(activMerged$V1)
    setnames(activMerged, old = "V1", new = "Activity")
    
    ## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
 
    ## Get column indices for measurements on the mean and standard deviation
    colsToKeep <- c(grep("mean", featureNames, ignore.case = TRUE), grep("std", featureNames, ignore.case = TRUE))
    
    accelMerged <- accelMerged[,colsToKeep]
    head(str(accelMerged))
    
    ## 3) Uses descriptive activity names to name the activities in the data set
    ## 4) Appropriately labels the data set with descriptive variable names. 
    ## Create labels vector from features.txt
    
    ## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
}
