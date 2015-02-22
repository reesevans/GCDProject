# Codebook

### Course Project for the Getting and Cleaning Data course

---

## Introduction
 
The purpose of this project was to produce a tidy data set from the Human Activity Smartphone Dataset. This dataset is available from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The distributiion README.txt provides the following description of how the the data are collected:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The provided data sets consist of the following files:


file | description
---|---
README.txt | a file providing an overall description of processing and the data produced activities_lables.txt | contains the text versions of the activities which are encoded as integers in the data set. 
features_info.txt | provides a description of each feature in the 561 element feature vector 
features_txt | a list of the features in the feature vector file. 
activity_labels.txt | a file providing sthe names of the acgivities associated with an integer code 
sub directory: text | a directory containing the test data files 
sub directory: train | a directory containing the training data files  The sub directories **test** and **train** each contain the following files:

:--- | :--- X_test.txt | the feature vectors values in text format
 y_test.txt | aΩfile consisting of the subject iedentifies (integers range 1-30) sub-directory: Inertial Signals | a set of nine files cantaining the raw data from the two sensors, accelerometer and gyroscope in each of the three directions (X,Y,Z) also the totla acceleration in all three directions.  
 
 The data sets for training are similarly named. 
 
 ___
 
 ### Tidying the Data
 
 Our intent was to extract only the means and standared deviation of each measurement.
 According to the data set documentation fity ties a second a measurement is taken from the accelerometer and gyroscope in the three directions, X,Y,Z. The data sampled at the rate of 50HZ and processed over 128 sample windows with a 50% overlap From each window a 561 features are computed, these vectors are included in the X\_test.tst and X\_train.txt files. For the purposes of this project we use only 12 feature vectors, mean and standard deveiation from each sensor in the three diirections. This variables are called:
 
 :-----|:----
 Acc_mean_X | mean of accelerometer reading in X direction.
 Acc_mean_Y | mean of accelerometer reading in Y direction.
 Acc_mean_Z | mean of accelerometer reading in Z direction.
 Acc_std_X  | standard deviation of accelerometer reading in the X direction.
 Acc_std_Y  | standard deviation of accelerometer reading in the Y direction.
 Acc_std_Z  | standard deviation of accelerometer reading in the Z direction.
 Gyro_mean_X | mean of gyrosope reading in X direction.
 Gyro_mean_Y | mean of gyrosope reading in Y direction.
 Gyro_mean_Z | mean of gyrosope reading in Z direction.
 Gyro_std_X | standard deviation of gyrosope reading in X direction.
 Gyro_std_Y | standard deviation of gyrosope reading in Y direction.
 Gyro_std_Z | standard deviation of gyrosope reading in Z direction.
 
 The data are combined using standard basic R manipulation procudures. Teh resulting data frate contains the data from both the training and testing data sets with the variables: subject, activity, and the 12 variable idendtified above. The activity codes are replaced with the corresponding activity labels from the file activity.txt.
 
 The data is tidied by the following process:
 
 1. gathere all the variables except subject and activity into two columns, sensor_stat and Value.
 1. separage the variable sensor_stat into two variables sensor and stat
 1. group by subject, activity, sensor, and statistic.
 1. summarize the data by calculating the grouped mean of Value called mean_value.
 1. rearrange the columns into (subject, activity, sensor, stat, mean_value)
 1. use spread to spread the statistic variable into colmuns of meand of the mean measurements and the mean of the statndard devieation measurements by subject, activity, sensor, and direction.
 
 The resulting data frame has the following variables:
 
 1. subject (integer 1-30
 1. activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIS, SITTING, STANDING, LAYING)
 1. sensor (Acc, Gyro)
 1. direction (X, Y, Z)
 1. mean (of meeans)
 1. std (mean of standard deviations) 
 
 This is a tidy data set:
  * each column is a single variable
  * each row is a single observation
  
### the firet 10 rows of the tidy data set
  
 :---:|:---:|:----:|:---:|---:|---: 
  subject| activity |sensor |direction  |       mean   |     std
       1 |  LAYING  |  Acc   |      X  |0.221598244| -0.9280565
       1 |  LAYING |   Acc |        Y| -0.040513953 |-0.8368274
       1 |  LAYING  |  Acc  |       Z |-0.113203554 |-0.8260614
       1 |  LAYING  | Gyro  |       X |-0.905166796| -0.8232125
       1 |  LAYING  | Gyro   |      Y |-0.939855015 |-0.3722307
       1 |  LAYING |  Gyro   |      Z |-0.877204030 |-0.4911670
       1 | SITTING |   Acc    |     X | 0.261237565 |-0.9772290
       1 | SITTING  | Acc    |     Y| -0.001308288| -0.9226186
       1  | SITTING  |  Acc   |      Z| -0.104544182| -0.9395863
       1  |SITTING |  Gyro   |      X | -0.986834701 | -0.9428547

