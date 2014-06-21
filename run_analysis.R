
run_analysis <- function(input= getwd(), output= getwd()){
    
    ## First, we read in all the necessary files from the directory specified by the input parameter.
    ## Note that the data must be within the "/UCI HAR Dataset" directory of whatever parent directory
    ## you specify. By default, input is set to the working directory.
    
    
    ## a) Put path names into objects
    
    activity_labels_txt <- paste(input,"/UCI HAR Dataset/activity_labels.txt",sep = '',  collapse="")
    features_txt <- paste(input,"/UCI HAR Dataset/features.txt", sep = '', collapse="")
    
    subject_test_txt <- paste(input,"/UCI HAR Dataset/test/subject_test.txt",sep = '', collapse="") 
    X_test_txt <- paste(input,"/UCI HAR Dataset/test/X_test.txt",sep = '',  collapse="")
    y_test_txt <- paste(input,"/UCI HAR Dataset/test/y_test.txt", sep = '',  collapse="")
    
    subject_train_txt <- paste(input,"/UCI HAR Dataset/train/subject_train.txt", sep = '',  collapse="") 
    X_train_txt <- paste(input,"/UCI HAR Dataset/train/X_train.txt",sep = '',  collapse="")
    y_train_txt <- paste(input,"/UCI HAR Dataset/train/y_train.txt", sep = '',  collapse="")
    
    
    
    ## b) Read txt files in using read.table(path_object), store dataframes in unique objects 
    
    activity_labels <- read.table(activity_labels_txt, stringsAsFactors=FALSE)
    features <- read.table(features_txt, stringsAsFactors=FALSE)
    
    subject_test <- read.table(subject_test_txt, stringsAsFactors=FALSE)
    X_test <- read.table(X_test_txt, stringsAsFactors=FALSE)
    y_test <- read.table(y_test_txt, stringsAsFactors=FALSE )
    
    subject_train <- read.table(subject_train_txt, stringsAsFactors=FALSE)
    X_train <- read.table(X_train_txt, stringsAsFactors=FALSE)
    y_train <- read.table(y_train_txt, stringsAsFactors=FALSE)
    
    ## c) Re-label the columns in the activity_labels dataframe as "Activity_ID" and "Activity."
    
    colnames(activity_labels) <- c("Activity_ID", "Activity")
    
    
    
    
    ## Second, make the complete data set for the test data, call it testData
    
    ## a) Bind the columns of the columns of subject_test and y_test, calling it testTemp. 
    ##    Next, bind the columns of testTemp with X_test, calling it testData.
    ##    Re-label the columns as "Subject", "Activity_ID", and the rest as the list of feature strings 
    ##    contained in "V2" of the features dataframe
    
    testTemp <- cbind(subject_test, y_test)
    testData <- cbind(testTemp, X_test)
    
    colnames(testData) <- c("Subject", "Activity_ID", features$V2)
    
    ## b) Remove all feature columns that are not related to a mean value or a standard deviation value.
    ##    Do that using subsetting and grep.
    
    testData <- testData[, c(1,2,grep("std*|mean*", colnames(testData),ignore.case=TRUE))]
    
    ## c) Add an "Activity" column to testData by merging activity_labels  and testData by "Activity_ID"
    ##    Note that the order of rows in the resulting data frame will be different, but correct.
    
    testData <- merge(activity_labels,testData, by.x="Activity_ID", by.y="Activity_ID")
    
    
    
    ## Third, make the complete data set for the training data, call it trainData
    
    ## a) Bind the columns of the columns of subject_train and y_train, calling it trainTemp. 
    ##    Next, bind the columns of trainTemp with X_train, calling it trainData.
    ##    Re-label the columns as "Subject", "Activity_ID", and the rest as the list of feature strings 
    ##    contained in "V2" of the features dataframe
    
    trainTemp <- cbind(subject_train, y_train)
    trainData <- cbind(trainTemp, X_train)
    
    colnames(trainData) <- c("Subject", "Activity_ID", features$V2)
    
    ## b) Remove all feature columns that are not related to a mean value or a standard deviation value.
    ##    Do that using subsetting and grep.
    
    trainData <- trainData[, c(1,2,grep("std*|mean*", colnames(trainData),ignore.case=TRUE))]
    
    ## c) Add an "Activity" column to trainData by merging activity_labels  and trainData by "Activity_ID"
    ##    Note that the order of rows in the resulting data frame will be different, but correct.
    
    trainData <- merge(activity_labels,trainData, by.x="Activity_ID", by.y="Activity_ID")
    
    ## Fourth, combine the rows of the testData and trainData into one complete data set, using rbind.
    ## Call the resulting dataframe completeData.
    
    completeData <- rbind(testData,trainData)
    
    ## Fifth, create descriptive variable names and find the mean of each variable for each subject doing each activity;
    ## since we have 30 subjects doing 6 different activities we will wind up with 30*6=180 rows. We put the resulting
    ## data frame in an object called finalData, and we output this, to the directory specified in the output parameter, as
    ##"finalData.csv"
    
    ## a) Create the more descriptive variable (column) names by cleaning and alterning the column names in completeData.
    ##    Using gsub(), we will replace () and - with _, then remove all __ and _ at the end of a name. Finally, using
    ##    the paste() function we append the string "Avg_of_" in order to make clear that the following elements are 
    ##    the "Average of" several observations; call this list of new variable names colNames.
    ##    Note that the first 3 columns cannot be altered in this way, as they are not averages, but identifiers.
    
    colNames <- gsub("\\(|\\)|-", "_", colnames(completeData))
    colNames[4:89] <- gsub("__*", "_", colNames[4:89])
    colNames[4:89] <- gsub("_$", "", colNames[4:89])
    colNames[4:89] <- paste("Avg_of_", colNames[4:89], sep="", collapase = "")
    
    ## b) Define a count = 0, to keep track of the rows during the loop, and a fixed size empty data frame of 89
    ##    columns with 180 rows, call it finalData. Next, using the new descriptive variable names, rename the columns
    ##    to the more descriptive titles specified therein. 
    
    count <- 0
    finalData <- as.data.frame(matrix(0, ncol = 89, nrow = 180))
    colnames(finalData) <- colNames
    
    ## c) Create a for loop that iterates through the number of Subjects (30) and creates a for loop that iterates
    ##    over the number of activites (6). Within the activity loop, increase the count by 1, and put the subset
    ##    of Subjects, i, doing activity, j, in a temporary matrix, tempMatrix. Next, use apply to change the 
    ##    class of all of the columns in the tempMatrix to numeric, suppress the warnings due to the NA coercion 
    ##    of the Activity column. Using apply, find the mean of all of the columns of tempMatrix; since the
    ##    result will yield the 1 column and 89 rows, transpose the tempMatrix. Finally, put the data into the
    ##    appropriate subset of finalData,using [count,], and replace the NA in the Activity column with the
    ##    correct activity associated with the Activity_ID.
    
    for(i in 1:30){
        for(j in 1:6){
            count <- count + 1
            tempMatrix <- as.matrix(completeData[completeData$Subject == i & completeData$Activity_ID == j,])
            tempMatrix <- suppressWarnings(apply(tempMatrix, 2, as.numeric))
            tempMatrix <- apply(tempMatrix, 2, mean)
            tempMatrix <- t(tempMatrix)		
            finalData[count,] <- as.data.frame(tempMatrix) 
            finalData[count, 2] <- activity_labels[j, 2] 	
        }
        
    }
    
    ## d) Using the write.table() function, write the finalData data frame to a csv file in the directory specified by
    ##    the output parameter, call it finalData.csv.
    
    
    write.table(finalData, file = paste(output,"/finalData.csv", sep = '',  collapse =""), sep = ",", col.names = TRUE)
}
