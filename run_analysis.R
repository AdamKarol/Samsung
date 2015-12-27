#creating data set for analysis of Human Activity Recognition Using Smartphones
setwd("D:/Adam Karolewski/Studia podyplomowe/Coursera/Data Science Specialization/Getting and Cleaning Data/Project")
getwd()

#1 load all data sets
testX<-read.table("UCI HAR Dataset/test/X_test.txt")
testY<-read.table("UCI HAR Dataset/test/y_test.txt")
testsub<-read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE)

trainX<-read.table("UCI HAR Dataset/train/X_train.txt")
trainY<-read.table("UCI HAR Dataset/train/y_train.txt")
trainsub<-read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE)

activity<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

head(trainX)
names(trainX)
head(trainX)

tail(testX)
names(testX)
table(testX$V1)

#binding together    
test<-cbind(testsub,testY,testX)
train<-cbind(trainsub,trainY,trainX)
all<-rbind(test,train)

names(features)
str_names<-c("person","activity",as.character(features$V2))
colnames(all)<-str_names
w<-grep(c("mean|std"), str_names)
w<-c(1,2,w)
all2<-all[,w]

#3 activities names
all2<-merge(all2,activity,by.x=c("activity"),by.y=c("V1"))

#4 activities names
library(dplyr)
all2<-rename(all2, activity_name=V2)
names(all2)

#5
groups<-group_by(all2, person,activity_name)
avgs<-summarize_each(groups,funs(mean))
avgs<-avgs[,-3]
?summarize
warnings()
write.table(avgs, "means.txt",row.name=FALSE)
