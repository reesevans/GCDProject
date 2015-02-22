# README

### Purpose of this Project

The purpose of this project is to demonstrate the ability to collect, work with and clean a data set. The requirements of this project are to produce:

1. A tidy data set
2. An R script that produces the data set 
3. A codebook describing the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md
4. This README.md file  describing the backgroud on the task and gives all information necessary to run the script.

 ---
 
## Usage

Make certain the script, **run\_analysis.R** and thedirectory **UCI HAR Dataset** are contained in the same working directory. While in R, source the file **run\_analysis.R**. The script will produce a text file called **HARsummary.txt** in the working directory and will also leave a data frame called tidy_sdf in the R workspace. tidy_sdf is wrapped by tbl_df for convenience. 

The first line of the text file, **HARsummary.txt** contains collumn headers the remaining lines are data. The data fields are described in the accompanying file **CodeBook.md**. 

---

### How run analysis operates.

Run analysis reads the files containing label names for the acctivities. It then reads the training and testing files for subjects, activities and the feature vectors. The resulting data are contained in test and training data frames for subjects, activities and feature vectors respectively. The training and testing data frames are combined using the rbind function to produce  data frames for subject, activity and feature vectors.  The relevant columns containing the mean and standard deviation of the recorded directions, (X,Y,Z) for each sensor (accelerometer and gyroscope) are obtained by subsetting the feature data frame. The selection of these columns is discussed in the **CodeBook.md**.
The subjects, activities and subsetted feature vectors are then combined into a single data frame using cbind. 

As described in the **CodeBook.md** and in the feature.txt file, that comes with the data distribution, the feature vectors are calculated from raw data (50Hz sampled data from the accelerometer and gyroscope in the three spatial directions) over a fixed length (128 samples) moving window with a 50% overlap). Since we are only interested in means and standard deviations and since these values are recorded in the feature vectors, we do not process the raw data from the sensor readings.

The data frame is processed using the dplyr and tidyr packages in R. The result is a data frame with the columns (subject, activity, sensor, direction, mean, standard deviation). This data frame is called **tidy_sdf** and is also saved as **HARsummary.txt** in the working directory.  

Further details are supplied in **CodeBook.md**.

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


