library(data.table)
library(reshape2)
library(dplyr)

#DATA READ #########################################################
#test<-fread("./test/X_test.txt")    # Not positioned correctly after testing format of header row# Error due to spaces in first column
test<-read.table("./test/X_test.txt")           #Test data
test<-data.table(test)

train<-read.table("./train/X_train.txt")        #Train data
train<-data.table(train)

nams<-read.table("features.txt",as.is=TRUE)                #Column Variable Names

full.act<-rbind(read.table("./train/y_train.txt",as.is=TRUE),read.table("./test/y_test.txt",as.is=TRUE))                     #Activites  train above test
full.subject<-rbind(read.table("./train/subject_train.txt",as.is=TRUE),read.table("./test/subject_test.txt",as.is=TRUE))     #Subjects  train above test
####################################################################
#TASKS

#1. Merges the training and the test sets to create one data set.
full<-rbind(train,test)        #train above test
setnames(full,nams[,2])

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean.inx<-grep("mean",nams[,2])
std.inx<-grep("std",nams[,2])
inx<-c(mean.inx,std.inx)
full.mean.std<-full[,inx,with=FALSE] #New data set with only the means and stds

#3. Uses descriptive activity names to name the activities in the data set
full.act[full.act==1]<-"WALKING"
full.act[full.act==2]<-"WALKING_UPSTAIRS"
full.act[full.act==3]<-"WALKING_DOWNSTAIRS"
full.act[full.act==4]<-"SITTING"
full.act[full.act==5]<-"STANDING"
full.act[full.act==6]<-"LAYING"

full.mean.std[,activity:=full.act]         #add activity names as a column

#4. Appropriately labels the data set with descriptive variable names.
# Performed in 1. see setnames(full,nams[,2])

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
full.mean.std[,subject:=full.subject] #add subject id

full.mean.std<-group_by(full.mean.std,activity,subject)       #indicate the grouping variables of activity and subject
tidy<-summarise_each(full.mean.std,funs(mean))                #produce tidy data set with means for each level of activity and subject

#write data set to disk
write.table(tidy,"tidy_Samsung_Galaxy_S_wearable.txt",row.names=FALSE)



