Introduction
=============
This repository exists to fufill the requirements set by the **Getting and Cleaning Data** Course Project, hosted by JHU, on Coursera, circa summer of 2014. For this project, students are tasked with using  accelerometer and gyroscope data, from the Samsung Galaxy S II smartphone, in the form of several text files, to create a tidy dataset that contains the average values for all mean and standard deviation measurements with respect to each subject performing a specific activity. A full description of the original dataset can be found at:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The original dataset, used for this project, was obtained via coursera,
[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), but should also be avaiable at the above website.

What now follows, in this Readme file, are descriptions of the [run_analysis.R](https://github.com/Austin-Routt/GCD_Course-Project/blob/master/run_analysis.R) script, created by me in order to derive a tidy dataset from the original UCI HAR Dataset,a copy of the script's output, [finalData.csv](https://github.com/Austin-Routt/GCD_Course-Project/blob/master/finalData.csv), and the Code book ,[CodeBook.md](https://github.com/Austin-Routt/GCD_Course-Project/blob/master/CodeBook.md)  , that acts as reference to the tidy dataset. Also, note that I have put this repository under an anti-copyright license and have provided information on what that means. Finally, you can find my contact information at the bottom of this document; please contact me if you have any issues or questions regarding my Course Project submission, thank you.


***
The R script: run_analysis.R
-------------
The purpose of **run_analysis.R** is to provide a function, **run_analysis(input= getwd(), output= getwd())**, which takes as input a parent directory ,containing the **UCI HAR Dataset** folder, and outputs a tidy dataset .csv file to the specified output directory, called **finalData.csv**; as you can tell by the function prototype, the default input and output directory is your working directory. You may notice that the order in which this function derives its tidy dataset does not correspond to the order listed on the Course Project website, however, as you read the description you will see that the order listed on the Course Project site is arbitrary; save for step 5, which can only occur at the end.


Once the fuction is entered, using a valid input and output directory, it reads in all the necessary text files:

* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt



Note that the data must be within the "UCI HAR Dataset" directory of whatever parent directory you specified for input, and the parent directory should **NOT** end with '/'.

It reads in the the above txt files by first putting the file path names into objects, and then using **read.table(path_object,stringsAsFactors=FALSE)** to convert and store the data, contained in the text files, as dataframes. Next, it relabels the columns in the **activity_labels** dataframe as "Activity_ID" and "Activity."

###Extracts only the measurements on the mean and STD

Following the relabel, the function binds the columns of subject_test and y_test, calling the resulting dataframe testTemp. Next, it binds the columns of testTemp with X_test, calling it testData. The columns of testData are then changed; the first two columns are renamed to "Subject" and "Activity_ID",respectively, and the rest are named according to the vector of strings contained in column "V2" of the **features** dataframe. Next, all columns that are not related to Subject number, Activity ID, a mean value, or a standard deviation are removed from testData;this is accomplished via the **grep** function coupled with subsetting, where only columns 1 and 2, as well as any containing the word mean or std, overwrite testData.

###Uses descriptive activity names to name the activities in the data set
After that, an "Activity" column is added to testData by merging **activity_labels**  and **testData** on the basis of their mutual "Activity_ID"column;  note that the order of rows in the resulting data frame will be different, but correct. The function then follows the exact same procedure on the training data. First binding the columns of subject_train and y_train, then the resulting tempTrain with the columns of X_train, renaming the columns appropriately. The unecessary columns are then removed in the exact same fashion as the test data, using grep and subsetting, and **trainData** is merged with **activity_labels** on the basis of their mutual "Activity_ID"column. 

###Merges the training and the test sets to create one data set 

Next, the rows of testData and trainData ,containing descriptive activity names and only measurements that correspond to mean and std values, are combined into one complete data set, using **rbind**; the resulting dataframe is called completeData.


###Appropriately labels the data set with descriptive variable names

The function then creates more descriptive variable (column) names by cleaning and altering the column names in completeData through **gsub()**; it replaces **()** and **-** with **_**, then it removes all occurences of **__** and *_* at the end of a name. Using the **paste()** function, we append the string "Avg_of_" to names, save for the first 3 columns(they are not averages, but identifiers); this is in order to make clear that the elements below are the "Average of" several observations.

###Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A count is then defined, to keep track of the rows during the upcoming "for loops," and a fixed size empty data frame of 89 columns with 180 rows is created, called finalData; this is by virtue of knowing that we have 30 subjects doing 6 different activities, and thus will wind up with 30*6=180 rows. Next, using the new variable names, the function renames the columns to the more descriptive titles specified in colNames. Then two "for loops" are created, one that iterates through the number of Subjects (30) and another, nested within the subject for loop, that iterates over the number of activites (6). Within the activity loop, the count increases by 1, and the subset of Subjects, i, doing activity, j, is put into a temporary matrix, called tempMatrixe. The **apply** function is then used to change the class of all of the columns in the tempMatrix to numeric; note that we suppress the warnings due to the NA coercion of the Activity column. It then uses apply, again, to find the mean of all of the columns of tempMatrix; since the result will yield a matrix of 1 column and 89 rows, it then transposes the tempMatrix, using the **t()** function. Next, the run_analysis  function puts the data into the appropriate subset of the finalData data frame, using finalData[count,], and replaces the NAs in the Activity column with the correct activity associated with the corresponding Activity_ID. Finally, using the write.table() function,it writes the tidy dataset, in the finalData dataframe, to a csv file in the directory specified by the output parameter; it calls this file **finalData.csv**.

***
The Tidy Data: finalData.csv
-------------
As described in the preceding section, finalData.csv is a comma separated values file that contains a derived tidy dataset based on the UCI HAR Dataset when acted on by the run_analysis function. You can easily read and manipulate this file using the R programming language's **read.csv( )** function.

This data is **'tidy'** by virtue of abiding by the following criteria for tidy data:

* Each variable of measurement is in one column

* The average of each activity observation, per subject, is in a different row

* All variables are of the same "kind," being either subject or activity identifiers for the averages of mean or standard deviation values, or the calculated averages themselves; thus only 1 table is used.


Note that finalData.csv contains 180 rows and 89 columns, where rows correspond to the average values found for measurements of mean and standard deviation, with respect to 30 subjects performing 6 different activities; note that 6*30 = 180, 6 activities for every 1 subject. The 89 columns are by virtue of the first 3 being the identifiers for "Activity_ID", "Activity", and "Subject", and the remaining being Average values derived from all columns containing the words "mean" or "std" in the original dataset's feature list. The Activity_ID and Subject columns contain integer values, the Activity column contains factors, unless the  stringsAsFactors=FALSE parameter is used when reading in the file via read.csv(). The rest of the columns, containing the average value for all mean and standard deviation measurements, are numeric.

The logic behind retaining all columns containing the words "mean" or "std" is that, although some may not be necessary, it was best to err on the side of caution and leave nothing, that could potentially be important, out; please note the ambiguity of the instructions given on the course project website:

>>"[Extract] only the measurements on the mean and standard deviation for each measurement." 

Furthermore, it would be very easy to extract desired columns, or rows for that matter, via R's subsetting ability. Thus, this aspiring data scientist feels justified in having 180 rows and 89 columns.

 


***
The Code Book: CodeBook.md
-------------
In Codebook.md you will find:


* Information about the original dataset used to derive the tidy dataset


* Additional Information about the variables in the data set not contained in finalData.csv

* A reiteration of why certain variables where chosen over others, as well as how the rows where derived



***
Licensing:Anti-copyright
-------------

I release the contents of this repository under an [anti-copyright license](http://www.anticopyright.com);unless that conflicts with any license associated with the original data and its derivatives. This essentially boils down to you, whoever you are, having absolute freedom over the contents of this repository to do with as you like.

>>Thoughts are free. They should remain free, and be given freely.

>>And, following the universal law, the more we give the more we shall receive.

>>N.B. This is not a license to rip off. Let integrity prevail, and give credit where credit is due.





![Licensing:Anti-copyright](http://img2.wikia.nocookie.net/__cb20130604211014/justcause/images/f/f2/Anti-copyright.png "Licensing:Anti-copyright") 

***
Contact Info
-------------
I'm just a student, no one important, but I try my best to provide descent stuff. Please, if you have **any** issues regarding **any** of the contents of this repository contact me via the following email addresses:

austin.routt@g.austincc.edu

redmond957@hotmail.com

Thank you for taking the time to readme, take care!




