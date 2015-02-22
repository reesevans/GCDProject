# README

### Purpose of this Project

The purpose of this project is to demonstrate the ability to collect, work with and clean a data set. This requirements of this project are to produce a tidy data set; an R script that produces the data set; a codebook describing the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md; and this README.md file that describes the backgroud on the task and gives all information necessary to run the script.

 ---
 
## Usage

Make certain the script, *run\_analysis.R* and thedirectory "UCI HAR Dataset" is contained in the same working directory. While in R source the file *run\_analysis.R*.The script will produce a text file called HARsummary.txt and will also leave a data frame called tidy_sdf. tidy_sdf is wrapped by tbl_df for convenience. 

The first row of the text file, HARsummary.txt contains collumn headers the remaining lines are data. The data fields are described in the accompanying file codebook.md. 

---

### How run analysis operates.

Run analysis reads the files containing label names for the acctivities. It then reads the training and testing files for subjects, activities and the feature vectors. The resulting data is contianined a test and training data frames for subjects, activities and feature vectors. The training and testing data frames are combined using the rbind function to produce combinded data frames for subject activity and feature vectors. The relevant columns in the feature vector are extracted by subestting. The relevant columns contain the mean and standard deviation of the recorded directions, (X,Y,Z) for each sesnor (accelerometer and gyroscope) This is discussed in more deatail in the codebook.
The subjects, activities and subsetted feature vectors are then combined into a single data frame using cbind. 

As described in the codeboook and in the feature.txt file that comes with the data distribution the feature vectors are calculted from a the raw (50Hz sampled data from the accelerometer and gyroscope in the three spatial directions) over a fixed length (128 samples) moving window with a 50% overlap. Since we are only interested in means and standard deviations and since these values are recorded in the feature vectors, we do not need to process the raw data from the sensor readings.

The data frame is processed using the dplyr and tidyr packages in R. The result is a data frame with the columns (subject, activity, sensor, direction, mean, standard deviation). This data frame is called tidy_sdf and is also saved as HARsummary.txt in the working directory.  

Further details are supplied in codebook.md

---

### References

Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

---
 
Specifically the data set is Version 1.0 of the Human Activity Recognition Using Smartphones Dataset

Data was collected by:

>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The details on how the data were collected and processed can be found in the README.txt included with the data distribution.

---


