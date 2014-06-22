Introduction
=============
This is the Code Book for the finalData tidy data set. It is meant to provide information regarding the original dataset, a brief explanation of why certain variables were chosen, as well as how the rows were derived. Also, I have included additional information about the variables in the data set, which is not contained in finalData.csv. Please note that this code book is in no way perfect, and if you feel as though you can contribute, in anyway, to its progress I encourage you to contact me via email; you will find my email address at the end of the README.md file included in this repository, thank you.



The Original Dataset: UCI HAR Dataset
=============
The tidy dataset was derived from the **Human Activity Recognition Using Smartphones Dataset**, Version 1.0, which can be found via the following link:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The UCI HAR Dataset was created using the embedded accelerometer and gyroscope in the Samsung Galaxy S II. Thirty volunteers, within an age bracket of 19-48 years, were recorded performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing the smartphone on their waist. The raw measurements were in the form of  3-axial linear acceleration and 3-axial angular velocity, both measured at a constant rate of 50Hz;the experiments were also video-recorded, to label the data manually.

According to the  UCI HAR Dataset README.txt:

>>Sensor signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.[...]Features are normalized and bounded within [-1,1]

After obtaining the complete dataset,including calculated values like  the mean and standard deviations of the raw measurements, subjects were randomly partitioned into two groups, where 70% comprised the training data and 30% where put into test data. 

###UCI HAR Dataset License

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.





The Tidy Dataset
=============
 With this data set you will find 3 identifer variables and 86 numerical average variables calculated from numerous observations of a particular subject (1 of 30) performing a particular activity(1 of 6). Therefore, this data set contains 89 variables and 180 rows; **30**(Subjects) **X** **6**(Activities) **=** **180** rows
 
Although the assignment asks for averages of variables involving mean or standard deviation, angle averages and mean frequency averages were includedas well, by virtue of involving mean value; this aspiring data scientist wished to err on the side of caution. Note that any undesired variables can easily be removed via the R programming language's subsetting abilities. For example, if one wishes to remove all values of average angles simply take the following subset: finalData[,1:82].

The naming convention used for the variables, that are not one of the three identifier types, is meant to be explanatory:

* **'Avg_of'** denotes that these values are " averages of" observations from the original data set, with respect to a particular subject performing 1 of 6 different activities

* **'t'** denotes that the original measurement was in the time domain

* **'f'** denotes that the measurement was brought into the frequency domain via a fast fourier transformation (FFT).

* **'Body'** denotes that the original measurement was taken from the body component of the signal.

* **'Gravity'** denotes that the original measurement was taken from the gravity component of the signal

* **'Acc'** corresponds to the acceleration obtained from the accelerometer, in units of meters per second squared.

* **'Gyro'** corresponds to the angular velocity obtained from the gyroscope, in units of radians per second.

* **'Jerk'** corresponds to a calculated value in units of meters per seconds cubed

* **'Mag'** indicates that the original value was a magnituded caluculated using the Euclidean norm; please recall that all original values were normalized and bounded between [-1,1] and that is why you will find negative values for averages involving magnitude.

* **'meanFreq'** mean that the original data was a weighted average of the frequency components to obtain a mean frequency

*  **'angle'** denotes that the original data was an angle between two vectors

*  **'XYZ'** relates to direction being X, Y, or Z

*  **NOTE:** Some variables are still undefined, but included anyway, like variables with 'BodyBody' names, by virtue of involving mean or standard deviation values;it is recommended that you contact the authors of the original data set to find aditional information regarding these: <activityrecognition@smartlab.ws>

A List of Column Names : The Variables
=============
The following is a list of the variables contained in the tidy data set, in the same order in which the columns appear in the data table. The first 3 are identifier variables: Activity_ID, Activity, and Subject. The others are Averages of mean, standard deviation, mean frequency, or angle values.


1. ###Activity_ID 
    A number that corresponds to the activity performed by the subject
    1. - WALKING
    2. - WALKING_UPSTAIRS
    3. - WALKING_DOWNSTAIRS
    4. - SITTING
    5. - STANDING
    6. - LAYING
 

2. ###Activity
 
    A string that describes the activity associated with an Activity_ID

    * WALKING - 1
    * WALKING_UPSTAIRS - 2
    * WALKING_DOWNSTAIRS - 3
    * SITTING - 4
    * STANDING - 5
    * LAYING - 6
 
3. ###Subject

    A number denoting the volunteer involved, i.e. the Subject. This includes numbers 1-30, as there were 30 volunteers in all.
 
4. ###Avg_of_tBodyAcc_mean_X
 The average of the mean of the Body acceleration, in the time domain, in the X direction. Units were taken in standard gravity, g, units (meters per second squared) and then normalized and bounded within [-1,1]
 
 
5. ###Avg_of_tBodyAcc_mean_Y 
 The average of the mean of the Body acceleration, in the time domain, in the Y direction. Units were taken in standard gravity, g, units(meters per second squared) and then normalized and bounded within [-1,1]
 
6. ###Avg_of_tBodyAcc_mean_Z 
 The average of the mean of the Body acceleration, in the time domain, in the Z direction. Units were taken in standard gravity, g, units (meters per second squared)  and then normalized and bounded within [-1,1]
 
7. ###Avg_of_tBodyAcc_std_X  
 The average of the standard deviation of the Body acceleration, in the time domain, in the X direction. Units were taken in standard gravity, g, units (meters per second squared) and then normalized and bounded within [-1,1]
 
 
8. ###Avg_of_tBodyAcc_std_Y
 The average of the standard deviation of the Body acceleration, in the time domain, in the Y direction. Units were taken in standard gravity, g, units(meters per second squared) and then normalized and bounded within [-1,1]
 
9. ###Avg_of_tBodyAcc_std_Z
 The average of the standard deviation of the Body acceleration, in the time domain, in the Z direction. Units were taken in standard gravity, g, units(meters per second squared) and then normalized and bounded within [-1,1]
 
10. ###Avg_of_tGravityAcc_mean_X
 The average of the mean of the gravity acceleration, in the time domain, in the X direction. Units were taken in standard gravity, g, units and then normalized and bounded within [-1,1]
 
 
11. ###Avg_of_tGravityAcc_mean_Y
  The average of the mean of the gravity acceleration, in the time domain, in the Y direction. Units were taken in standard gravity, g, units and then normalized and bounded within [-1,1]

12. ###Avg_of_tGravityAcc_mean_Z 
  The average of the mean of the gravity acceleration, in the time domain, in the Z direction. Units were taken in standard gravity, g, units and then normalized and bounded within [-1,1]
 

13. ###Avg_of_tGravityAcc_std_X
  The average of the standard deviation of the gravity acceleration, in the time domain, in the X direction. Units were taken in standard gravity, g, units and then normalized and bounded within [-1,1]


14. ###Avg_of_tGravityAcc_std_Y
  The average of the standard deviation of the gravity acceleration, in the time domain, in the Y direction. Units were taken in standard gravity, g, units and then normalized and bounded within [-1,1]

15. ###Avg_of_tGravityAcc_std_Z
  The average of the standard deviation of the gravity acceleration, in the time domain, in the Z direction. Units were taken in standard gravity, g, units and then normalized and bounded within [-1,1]

16. ###Avg_of_tBodyAccJerk_mean_X
  The average of the mean of the calculated body jerk, in the time domain, in the X direction. Units should be in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]

17. ###Avg_of_tBodyAccJerk_mean_Y
 The average of the mean of the calculated body jerk, in the time domain, in the Y direction. Units should be in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]


18. ###Avg_of_tBodyAccJerk_mean_Z  
 The average of the mean of the calculated body jerk, in the time domain, in the X direction. Units should be in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]

19. ###Avg_of_tBodyAccJerk_std_X
 The average of the standard deviation of the calculated body jerk, in the time domain, in the X direction. Units should be in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]


20. ###Avg_of_tBodyAccJerk_std_Y
  The average of the standard deviation of the calculated body jerk, in the time domain, in the Y direction. Units should be in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]


21. ###Avg_of_tBodyAccJerk_std_Z 
 The average of the standard deviation of the calculated body jerk, in the time domain, in the Z direction. Units should be in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]

22. ###Avg_of_tBodyGyro_mean_X  
 The average of the mean of the body angular velocity, measured by the gyroscope, in the time domain, in the X direction. Units were taken in radians per second and then normalized and bounded within [-1,1]


23. ###Avg_of_tBodyGyro_mean_Y 
    The average of the mean of the body angular velocity, measured by the gyroscope, in the time domain, in the Y direction. Units were taken in radians per second and then normalized and bounded within [-1,1]
 
24. ###Avg_of_tBodyGyro_mean_Z
   The average of the mean of the body angular velocity, measured by the gyroscope, in the time domain, in the Z direction. Units were taken in radians per second and then normalized and bounded within [-1,1]
 
 
25. ###Avg_of_tBodyGyro_std_X  
 The average of the standard deviation of the body angular velocity, measured by the gyroscope, in the time domain, in the X direction. Units were taken in radians per second and then normalized and bounded within [-1,1]
 
26. ###Avg_of_tBodyGyro_std_Y 
 The average of the standard deviation of the body angular velocity, measured by the gyroscope, in the time domain, in the Y direction. Units were taken in radians per second and then normalized and bounded within [-1,1]
 
27. ###Avg_of_tBodyGyro_std_Z 
 The average of the standard deviation of the body angular velocity, measured by the gyroscope, in the time domain, in the Z direction. Units were taken in radians per second and then normalized and bounded within [-1,1]
 
28. ###Avg_of_tBodyGyroJerk_mean_X
 The average of the mean of the calculated body angular jerk, measured by the gyroscope, in the time domain, in the X direction. The measurements were taken in radians per second, thus the calculated units must be in radians per second cubed. The final values were normalized and bounded within [-1,1]
 
 
29. ###Avg_of_tBodyGyroJerk_mean_Y 
  The average of the mean of the calculated body angular jerk, measured by the gyroscope, in the time domain, in the Y direction. The measurements were taken in radians per second, thus the calculated units must be in radians per second cubed. The final values were normalized and bounded within [-1,1]

30. ###Avg_of_tBodyGyroJerk_mean_Z 
  The average of the mean of the calculated body angular jerk, measured by the gyroscope, in the time domain, in the Z direction. The measurements were taken in radians per second, thus the calculated units must be in radians per second cubed. The final values were normalized and bounded within [-1,1]


31. ###Avg_of_tBodyGyroJerk_std_X   
   The average of the standard deviation of the calculated body angular jerk, measured by the gyroscope, in the time domain, in the X direction. The measurements were taken in radians per second, thus the calculated units must be in radians per second cubed. The final values were normalized and bounded within [-1,1]


32. ###Avg_of_tBodyGyroJerk_std_Y   
   The average of the standard deviation of the calculated body angular jerk, measured by the gyroscope, in the time domain, in the Y direction. The measurements were taken in radians per second, thus the calculated units must be in radians per second cubed. The final values were normalized and bounded within [-1,1]


33. ###Avg_of_tBodyGyroJerk_std_Z
   The average of the standard deviation of the calculated body angular jerk, measured by the gyroscope, in the time domain, in the Z direction. The measurements were taken in radians per second, thus the calculated units must be in radians per second cubed. The final values were normalized and bounded within [-1,1]


34. ###Avg_of_tBodyAccMag_mean 
 The average of the mean of the body acceleration's magnitude in the time domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]


35. ###Avg_of_tBodyAccMag_std 
 The average of the standard deviation of the body acceleration's magnitude in the time domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]

36. ###Avg_of_tGravityAccMag_mean  
 The average of the mean of the gravity acceleration's magnitude in the time domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]

37. ###Avg_of_tGravityAccMag_std 
  The average of the mean of the gravity acceleration's magnitude in the time domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]


38. ###Avg_of_tBodyAccJerkMag_mean 
  The average of the mean of the calculated body jerk magnitude, in the time domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]


39. ###Avg_of_tBodyAccJerkMag_std
   The average of the standard deviation of the calculated body jerk magnitude, in the time domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]

40. ###Avg_of_tBodyGyroMag_mean
   The average of the mean of the magnitude of the body's angular acceleration, measured by the gyroscope, in the time domain,and calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]


41. ###Avg_of_tBodyGyroMag_std
   The average of the standard deviation of the magnitude of the body's angular velocity, measured by the gyroscope, in the time domain,and calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]

42. Avg_of_tBodyGyroJerkMag_mean 
  The average of the mean of the magnitude of the body's angular jerk, calculated using measurements from the gyroscope, in the time domain. Magnitude was found using the Euclidean norm, and the final values were normalized and bounded within [-1,1]


43. ###Avg_of_tBodyGyroJerkMag_std
   The average of the standard deviation of the magnitude of the body's angular jerk, calculated using measurements from the gyroscope, in the time domain. Magnitude was found using the Euclidean norm, and the final values were normalized and bounded within [-1,1]

44. ###Avg_of_fBodyAcc_mean_X
  The average of the mean of the Body acceleration, in the frequency domain, in the X direction.  Units were taken in standard gravity, g, units and then the values were normalized and bounded within [-1,1];  A FFT was applied to transform the signals into the frequency domain.


45. ###Avg_of_fBodyAcc_mean_Y 
 The average of the mean of the Body acceleration, in the frequency domain, in the Y direction.  Units were taken in standard gravity, g, units and then the values were normalized and bounded within [-1,1];  A FFT was applied to transform the signals into the frequency domain.


46. ###Avg_of_fBodyAcc_mean_Z   
 The average of the mean of the Body acceleration, in the frequency domain, in the Z direction.  Units were taken in standard gravity, g, units and then the values were normalized and bounded within [-1,1];  A FFT was applied to transform the signals into the frequency domain

47. ###Avg_of_fBodyAcc_std_X 
 The average of the standard deviation of the Body acceleration, in the frequency domain, in the X direction.  Units were taken in standard gravity, g, units and then the values were normalized and bounded within [-1,1];  A FFT was applied to transform the signals into the frequency domain

48. ###Avg_of_fBodyAcc_std_Y 
  The average of the standard deviation of the Body acceleration, in the frequency domain, in the Y direction.  Units were taken in standard gravity, g, units and then the values were normalized and bounded within [-1,1];  A FFT was applied to transform the signals into the frequency domain.

49. ###Avg_of_fBodyAcc_std_Z 
   The average of the standard deviation of the Body acceleration, in the frequency domain, in the Z direction.  Units were taken in standard gravity, g, units and then the values were normalized and bounded within [-1,1];  A FFT was applied to transform the signals into the frequency domain.

50. ###Avg_of_fBodyAcc_meanFreq_X
 The average of a weighted average of the frequency components to obtain a mean frequency, in the X direction; this involves values of the body's acceleration, which were measured in meters per seconds squared and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.

51. ###Avg_of_fBodyAcc_meanFreq_Y
 The average of a weighted average of the frequency components to obtain a mean frequency, in the Y direction; this involves values of the body's acceleration, which were measured in meters per seconds squared and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.


52. ###Avg_of_fBodyAcc_meanFreq_Z 
 The average of a weighted average of the frequency components to obtain a mean frequency, in the Z direction; this involves values of the body's acceleration, which were measured in meters per seconds squared and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.



53. ###Avg_of_fBodyAccJerk_mean_X     
 The average of the mean of the calculated body jerk, in the frequency domain, in the X direction. Units were in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.



54. ###Avg_of_fBodyAccJerk_mean_Y  
  The average of the mean of the calculated body jerk, in the frequency domain, in the Y direction. Units were in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.

55. ###Avg_of_fBodyAccJerk_mean_Z
  The average of the mean of the calculated body jerk, in the frequency domain, in the Z direction. Units were in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.

56. ###Avg_of_fBodyAccJerk_std_X  
 The average of the standard deviation of the calculated body jerk, in the frequency domain, in the X direction. Units were in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.

57. ###Avg_of_fBodyAccJerk_std_Y 
 The average of the standard deviation of the calculated body jerk, in the frequency domain, in the Y direction. Units were in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.



58. ###Avg_of_fBodyAccJerk_std_Z
 The average of the standard deviation of the calculated body jerk, in the frequency domain, in the Z direction. Units were in metres per second cubed, as the jerk was calculated from values in standard gravity units, and then normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.


59. ###Avg_of_fBodyAccJerk_meanFreq_X
 The average of a weighted average of the frequency components to obtain a mean frequency, in the X direction; this involves values of  the calculated body jerk, which should been calculated in meters per seconds cubed and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain

60. ###Avg_of_fBodyAccJerk_meanFreq_Y    
  The average of a weighted average of the frequency components to obtain a mean frequency, in the Y direction; this involves values of  the calculated body jerk, which should been calculated in meters per seconds cubed and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain

61. ###Avg_of_fBodyAccJerk_meanFreq_Z 
   The average of a weighted average of the frequency components to obtain a mean frequency, in the Z direction; this involves values of  the calculated body jerk, which should been calculated in meters per seconds cubed and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain

62. ###Avg_of_fBodyGyro_mean_X     
  The average of the mean of the body's angular velocity, measured by the gyroscope, in the frequency domain, in the X direction. Units were taken in radians per second and then normalized and bounded within [-1,1]]; note that a FFT was used to transform the values from the time domain into the frequency domain

63. ###Avg_of_fBodyGyro_mean_Y 
  The average of the mean of the body's angular velocity, measured by the gyroscope, in the frequency domain, in the Y direction. Units were taken in radians per second and then normalized and bounded within [-1,1]]; note that a FFT was used to transform the values from the time domain into the frequency domain

64. ###Avg_of_fBodyGyro_mean_Z 
  The average of the mean of the body's angular velocity, measured by the gyroscope, in the frequency domain, in the Z direction. Units were taken in radians per second and then normalized and bounded within [-1,1]]; note that a FFT was used to transform the values from the time domain into the frequency domain.

65. ###Avg_of_fBodyGyro_std_X   
   The average of the standard deviation of the body's angular velocity, measured by the gyroscope, in the frequency domain, in the X direction. Units were taken in radians per second and then normalized and bounded within [-1,1]]; note that a FFT was used to transform the values from the time domain into the frequency domain.

66. ###Avg_of_fBodyGyro_std_Y          
  The average of the standard deviation of the body's angular velocity, measured by the gyroscope, in the frequency domain, in the Y direction. Units were taken in radians per second and then normalized and bounded within [-1,1]]; note that a FFT was used to transform the values from the time domain into the frequency domain.



67. ###Avg_of_fBodyGyro_std_Z         
   The average of the standard deviation of the body's angular velocity, measured by the gyroscope, in the frequency domain, in the Z direction. Units were taken in radians per second and then normalized and bounded within [-1,1]]; note that a FFT was used to transform the values from the time domain into the frequency domain.

68. ###Avg_of_fBodyGyro_meanFreq_X
 The average of a weighted average of the frequency components to obtain a mean frequency, in the X direction; this involves values of  the  body's angular velocity, measured by the gyroscope, which should been measured in radians per second and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain


69. ###Avg_of_fBodyGyro_meanFreq_Y   
 The average of a weighted average of the frequency components to obtain a mean frequency, in the Y direction; this involves values of  the  body's angular velocity, measured by the gyroscope, which should been measured in radians per second and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain

70. ###Avg_of_fBodyGyro_meanFreq_Z 
 The average of a weighted average of the frequency components to obtain a mean frequency, in the Z,                                                                                     direction; this involves values of  the  body's angular velocity, measured by the gyroscope, which should been measured in radians per second and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain

71. ###Avg_of_fBodyAccMag_mean
 The average of the mean of the body acceleration's magnitude in the frequency domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain


72. ###Avg_of_fBodyAccMag_std   
 The average of the standard deviation of the body acceleration's magnitude in the frequency domain, calculated using the Euclidean norm. The final values were normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.


73. ###Avg_of_fBodyAccMag_meanFreq  
    The average of a weighted average of the magnitude frequency components to obtain a mean magnitude of frequency; this involves values of the body's acceleration, which were measured in meters per seconds squared and then normalized to [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.

74. ###Avg_of_fBodyBodyAccJerkMag_mean  
 The average of the mean of the calculated body jerk magnitude, in the frequency domain. Magnitude was calculated using the Euclidean norm, and the final values were normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.



75. ###Avg_of_fBodyBodyAccJerkMag_std    
 The average of the standard deviation associated with the calculated body jerk magnitude, in the frequency domain. Magnitude was calculated using the Euclidean norm, and the final values were normalized and bounded within [-1,1]; note that a FFT was used to transform the values from the time domain into the frequency domain.


76. ###Avg_of_fBodyBodyAccJerkMag_meanFre
 Please contact the authors of the original data set, as no information was provided concerning titles with the term 'BodyBody' included:
<activityrecognition@smartlab.ws>


77. ### Avg_of_fBodyBodyGyroMag_mean   
  Please contact the authors of the original data set, as no information was provided concerning titles with the term 'BodyBody' included:
<activityrecognition@smartlab.ws>


78. ###Avg_of_fBodyBodyGyroMag_std  
  Please contact the authors of the original data set, as no information was provided concerning titles with the term 'BodyBody' included:
<activityrecognition@smartlab.ws>


79. ###Avg_of_fBodyBodyGyroMag_meanFreq 
  Please contact the authors of the original data set, as no information was provided concerning titles with the term 'BodyBody' included:
<activityrecognition@smartlab.ws>

80. ### Avg_of_fBodyBodyGyroJerkMag_mean
  Please contact the authors of the original data set, as no information was provided concerning titles with the term 'BodyBody' included:
<activityrecognition@smartlab.ws>


81. ###Avg_of_fBodyBodyGyroJerkMag_std
  Please contact the authors of the original data set, as no information was provided concerning titles with the term 'BodyBody' included:
<activityrecognition@smartlab.ws>

82. ###Avg_of_fBodyBodyGyroJerkMag_meanFreq
  Please contact the authors of the original data set, as no information was provided concerning titles with the term 'BodyBody' included:
<activityrecognition@smartlab.ws>


83. ###Avg_of_angle_tBodyAccMean.gravity  
 The average of the angle between two vectors; the vectors involved are the mean body acceleration, in the time domain, and graviy.

84. ###Avg_of_angle_tBodyAccJerkMean_.gravityMean
 The average of the angle between two vectors; the vectors involved are the mean body jerk, in the time domain, and mean gravity.


85. ###Avg_of_angle_tBodyGyroMean.gravityMean
  The average of the angle between two vectors; the vectors involved are the mean angular velocity, in the time domain, and mean gravity.


86. ###Avg_of_angle_tBodyGyroJerkMean.gravityMean
  The average of the angle between two vectors; the vectors involved are the mean angular jerk, in the time domain, and mean gravity.

87. ###Avg_of_angle_X.gravityMean 
  The average of the angle between two vectors; the vectors involved are the "X direction vector" and the mean gravity vectory. Please contact the authors of the original data set, for further detail. I am not sure what X vector is involved, the X from the accelerometer or the gyroscope:
<activityrecognition@smartlab.ws>

88. ###Avg_of_angle_Y.gravityMean
  The average of the angle between two vectors; the vectors involved are the "Y direction vector" and the mean gravity vectory. Please contact the authors of the original data set, for further detail. I am not sure what Y vector is involved, the Y from the accelerometer or the gyroscope:
<activityrecognition@smartlab.ws>

89. ###Avg_of_angle_Z.gravityMean 
  The average of the angle between two vectors; the vectors involved are the "Z direction vector" and the mean gravity vectory. Please contact the authors of the original data set, for further detail. I am not sure what Z vector is involved, the Z from the accelerometer or the gyroscope:
<activityrecognition@smartlab.ws>
