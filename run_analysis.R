

runAnalysis <- function() {

	#fetch the data sets we are interested in
	testsubjects	<-	read.table("./data/UCI HAR Dataset/test/subject_test.txt",
								   col.names = "subject.id")
	testtypes		<-	read.table("./data/UCI HAR Dataset/test/Y_test.txt", 
								   col.names = "activity")
	testdata		<-	read.table("./data/UCI HAR Dataset/test/X_test.txt", 
								   colClasses="numeric")
	trainsubjects	<-	read.table("./data/UCI HAR Dataset/train/subject_train.txt",
								   col.names = "subject.id")
	traintypes		<-	read.table("./data/UCI HAR Dataset/train/Y_train.txt", 
								   col.names = "activity")
	traindata		<-	read.table("./data/UCI HAR Dataset/train/X_train.txt", 
								   colClasses="numeric")
	activity.labels	<-	read.table("./data/UCI HAR Dataset/activity_labels.txt", 
								   col.names=c("label.id", "label"))
	var.labels		<-	read.table("./data/UCI HAR Dataset/features.txt")[[2]]

	#names on measurements
	names(testdata) <- var.labels
	names(traindata) <- var.labels

	#create the a version of the test set with subjectid, activity, mean and std.dev
	testtypes$activity <- activity.labels[testtypes$activity, "label"]
	testdataset <- cbind(subject.id = testsubjects$subject.id,
						 testtypes,
						 testdata)
	
	#create the a version of the training set with subjectid, activity, mean and std.dev
	traintypes$activity <- activity.labels[traintypes$activity, "label"]
	traindataset <- cbind(subject.id = trainsubjects$subject.id,
					 traintypes,
					 traindata)

	#merge the two data sets to create the first full data set
	dataset.1 <- rbind(testdataset, traindataset)

	#create specified tables
	dataset.mean.std <- dataset.1[,c(1, 2, grep("(mean|std)\\(\\)", names(dataset.1)))]
	dataset.aggregated <- aggregate(dataset.1[,c(-1,-2)], list(dataset.1$subject.id, dataset.1$activity), mean)

	#create the second data set - same as before but now grouping on activity
	write.table(dataset.mean.std, "./result/mean-and-std-measurements.csv", row.names=F, sep=",")
	write.table(dataset.aggregated, "./result/mean-measurements.csv", row.names=F, sep=",")

}


