run_analysis <- function() {
    ## You should create one R script called run_analysis.R that does the following. 
    print("Running library(data.table)")
    library(data.table)
    library(dplyr)
    
    ## 1) Merges the training and the test sets to create one data set:
    
    ## read in names of variables in accelerometer and gyroscope data
    ## for some reason, using colClasses = c("NULL", "character") causes malfunction at grep
    print("Reading names of variables for accelerometer and gyroscope data")
    featureNames <- read.table("UCI HAR Dataset/features.txt", colClasses = c("numeric", "character"))[[2]]
    featureNames <- make.names(featureNames, unique = TRUE)
    
    print("Reading and concatenating accelerometer and gyroscope data from both test and training sets. This might take a while.")
    accelMerged <- rbind(read.table("UCI HAR Dataset/test/X_test.txt", col.names = featureNames), read.table("UCI HAR Dataset/train/X_train.txt", col.names = featureNames))
   
    print("Reading and concatenating subject identifier data from both test and training sets")   
    subjMerged <- rbind(read.table("UCI HAR Dataset/test/subject_test.txt"), read.table("UCI HAR Dataset/train/subject_train.txt"))
    
    print("Coercing subject identifier numbers to factors")
    subjMerged$V1 <- as.factor(subjMerged$V1)
    setnames(subjMerged, old = "V1", new = "Subject")
    
    
    ## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
 
    ## Get column indices for measurements on the mean and standard deviation
    
    colsToKeep <- grep("mean|std", featureNames, ignore.case = TRUE)
    
    print("Where featureNames is read in from features.txt, keeping only the variables")
    print("with feature name matched by grep('mean|std\', featureNames, ignore.case = TRUE)")
    accelMerged <- accelMerged[,colsToKeep]
    
    ## 3) Uses descriptive activity names to name the activities in the data set
    
    print("Reading and concatenating activity identifier data from both test and training sets")
    activMerged <- rbind(read.table("UCI HAR Dataset/test/y_test.txt"), read.table("UCI HAR Dataset/train/y_train.txt"))
    
    print("Getting Activity names from activity_labels.txt")
    activNames <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
    
    activMerged$V1 <- as.factor(activMerged$V1)
    
    print("Converting activity identifier numbers in observations to meaningful factor level names")
    setattr(activMerged$V1, "levels", activNames$V2)
    
    setnames(activMerged, old = "V1", new = "Activity")
    
    ## 4) Appropriately labels the data set with descriptive variable names. 
    
    ## Variable naming completed in step 1
    
    print("Combining Subject, Activity, and variables into one data.frame")
    gatheredData <- cbind(subjMerged, activMerged, accelMerged)
    rm(subjMerged, activMerged, featureNames, accelMerged, activNames, colsToKeep)
    
    ## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
    
    
}
