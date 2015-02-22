# This script requires that the data be contained in a directory named "UCI HAR Dataset"
# The relevant labes are contained in the files:
# "UCI HAR Dataset/activity)labels.txt" and "UCI HAR Dataset/features.txt".
# The test and training data are contined in the sub-directories:
# "UCI HAR Dataset/test" and "UCI HAR Dataset/train" respectively.
# The script must be run in a directory containing  "UCI HAR Dataset/"
# According to the explanation in the file "features_info.txt" there are 
# 6 measurements taken at the rate of 50Hz, X,Y,Z coordinates of linear
# accelleration from the accelerometer and X,Y,Z coodinates from the gyroscope.
# All other values in the feature vector are calculated from these 6
# values. 

# make sure the appropriate packages are loaded

library(dplyr)
library(tidyr)

# Load Data
activities<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")
feature_vectors_test<-read.table("UCI HAR Dataset/test/X_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
activity_test<-read.table("UCI HAR Dataset/test/y_test.txt")
feature_vectors_train<-read.table("UCI HAR Dataset/train/X_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
activity_train<-read.table("UCI HAR Dataset/train/y_train.txt")

# combine test and training data

subject<-rbind(subject_test,subject_train)
activity<-rbind(activity_test,activity_train)
feature_vectors<-rbind(feature_vectors_test,feature_vectors_train)

# extract feature_vector columns for means and standard deviations

ndx<-c(1:6,19:24) # indices of the mean and standard deviation values for
                  # accelerometer and gyroscope
feature_vectors<-feature_vectors[,ndx]

# rename the columns

names(subject)<-"subject"
names(activity)<-"activity"
labs<-c("Acc_mean.X",  "Acc_mean.Y",  "Acc_mean.Z",  
        "Acc_std.X", "Acc_std.Y", "Acc_std.Z",   
        "Gyro_mean.X", "Gyro_mean.Y", "Gyro_mean.Z", 
        "Gyro_std.X",  "Gyro_std.Y",  "Gyro_std.Z" )
names(feature_vectors)<-labs

# assign descriptive activity names
activity<-transform(activity,activity=activities[activity,2])
# combine into one data frame

smartphone_accDF<-cbind(subject,activity,feature_vectors)
sdf<-tbl_df(smartphone_accDF)
# produce tidy data set
# gather the six data columns into a new temporary column called acc_dir

sdf %>% 
      gather(sensor_stat,Values,-subject,-activity) %>%
      separate(sensor_stat,c("sensor","statistic","direction")) %>%
      group_by(subject,activity,sensor,direction,statistic) %>%
      summarize(mean_value=mean(Values)) %>%
      select(subject,activity,sensor,direction,statistic,mean_value)%>%
      spread(statistic,mean_value)->tidy_sdf

# Write tidy data to a text file

write.table(tidy_sdf,"HARsummary.txt",row.names=FALSE)
      
