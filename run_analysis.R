library(dplyr)

#load features and activity data
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

#load train_data
x_train <- read.table("train/X_Train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#load test_data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#combine test and train
X <- rbind(x_train,x_test)
Y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)

#Naming Columns
colnames(features) <- c("index","metric")
colnames(activity) <- c("activity_id","activity")
colnames(X) <- features$metric
colnames(Y) <- "activity_id"
colnames(subject) <- "subject"

#Step1: Final Merged Data
data <- cbind(subject, X, Y)

#Selecting metrics with mean and std
metrics <- features[grep("[Mm]ean|[Ss]td",features$metric),2]

# Step2: measurements with mean and std only
modified_data <- data[,c("subject","activity_id",metrics)]

# Step3: Use descriptive activity names
modified_data <- merge(modified_data,activity, by="activity_id", all.x = TRUE)

#Step 4: Appropriate labels to dataset
colnames(modified_data) <- gsub("^t","time",colnames(modified_data))
colnames(modified_data) <- gsub("Acc","Accelerometer",colnames(modified_data))
colnames(modified_data) <- gsub("Gyro","Gyroscope",colnames(modified_data))
colnames(modified_data) <- gsub("Mag","Magnitude",colnames(modified_data))
colnames(modified_data) <- gsub("^f","frequency",colnames(modified_data))
colnames(modified_data) <- gsub("tBody","timeBody",colnames(modified_data))
colnames(modified_data) <- gsub("BodyBody","Body",colnames(modified_data))
colnames(modified_data) <- gsub("-","_",colnames(modified_data))
colnames(modified_data) <- gsub("\\(\\)","",colnames(modified_data))
colnames(modified_data) <- gsub("mean","Mean",colnames(modified_data))
colnames(modified_data) <- gsub("std","Std",colnames(modified_data))

#dropping activity id
modified_data <- modified_data %>% select(-activity_id)  

# Step5 : Summarizing mean of all variables by subject and activity
final_data <- modified_data %>% group_by(subject,activity) %>% 
  summarise_all(mean)

#Output Data
write.table(final_data,"Output.txt",row.names = FALSE)
