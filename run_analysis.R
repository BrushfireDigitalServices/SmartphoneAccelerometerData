run_analysis <- function() {
    ## You should create one R script called run_analysis.R that does the following. 
    
    
    ## 1) Merges the training and the test sets to create one data set:
    ## Read in the subject data from test set, put in $Subject variable
    ## from "test/subject_test.txt"
    
    subjTest <- read.table("../UCI HAR Dataset/test/subject_test.txt")
    ## Read in the subject data from training set
    ## from "train/subject_train.txt"
    subjTrain <- read.table("../UCI HAR Dataset/train/subject_train.txt")
    ## append to $Subject and convert to factor
    subjMerged <- rbind(subjTest, subjTrain)
    subjMerged$V1 <- as.factor(subjMerged$V1)
    ## Rename V1 to Subject
    setnames(subjMerged, old = "V1", new = "Subject")
    ## Remove subjTest and subjTrain from namespace
    rm(subjTest, subjTrain)
    

    ## Read in the activity data from test set, put in $Activity variable
    ## Read in the activity data from training set, append to $Activity
    
    ## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
    
    ## Read from x_test to get accelerometer data, put in appropriate variables
    testAccel <- read.table("../UCI HAR Dataset/test/X_test.txt")
    ## Read from x_train to get accelerometer data, put in appropriate variables
    trainAccel <- read.table("../UCI HAR Dataset/train/X_train.txt")
    accelMerged <- rbind(testAccel, trainAccel)
    ## read in names of variables
    featureNames <- read.table("../UCI HAR Dataset/features.txt", colClasses = c("numeric", "character"))[[2]]
    featureNames <- make.names(featureNames, unique = T)
    ## Get column indices for measurements on the mean and standard deviation
    colsToKeep <- c(grep("mean", featureNames, ignore.case = TRUE), grep("std", featureNames, ignore.case = TRUE))
    
    accelMerged[,colsToKeep]
    ## 3) Uses descriptive activity names to name the activities in the data set
    ## 4) Appropriately labels the data set with descriptive variable names. 
    ## Create labels vector from features.txt
    
    ## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
}
