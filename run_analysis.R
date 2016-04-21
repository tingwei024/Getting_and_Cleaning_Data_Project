setwd("c:/users/su/desktop/data")
if(!file.exists("./Project")){dir.create("./Project")}

##download files and unzip

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Project/Data.zip")
un_zip <- unzip("./Project/Data.zip", exdir = "./Project")

##load data

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
feature <- read.table("./Project/UCI HAR Dataset/features.txt")
activityName <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

##Merges the training and the test sets to create one data set.

trainData <- cbind(subject_train, y_train, x_train)
testData <- cbind(subject_test, y_test, x_test)
mergeData <- rbind(testData, trainData)
subnames<-data.frame(1:2,c("subject","activity"))
names(subnames)<-c("V1","V2")
features<-rbind(subnames,feature)
names(mergeData)<-features$V2

##Extracts only the measurements on the mean and standard deviation for each measurement. 

extract<-grep("mean\\(\\)|std\\(\\)",features$V2)
Data<-mergeData[,c(1,2,extract)]

##Uses descriptive activity names to name the activities in the data set

Data$activity <- factor(Data$activity, levels = activityName[,1], labels = activityName[,2])

##Appropriately labels the data set with descriptive variable names

names(Data)<-gsub("\\()","",names(Data))
names(Data)<-gsub("^t","time",names(Data))
names(Data)<-gsub("^f","frequency",names(Data))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalData <- Data %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

write.table(groupData, "./Getting_and_Cleaning_data_Project/MeanData.txt", row.names = FALSE)