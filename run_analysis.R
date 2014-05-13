library("reshape2")

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

	#create the a version of the test set with subjectid, activity, mean and std.dev
	testtypes$activity <- activity.labels[testtypes$activity, "label"]
	testdataset <- cbind(subject.id = testsubjects$subject.id,
					 testtypes,
					 mean = apply(testdata, 1, mean),
					 st.dev = apply(testdata, 1, sd))
	
	#create the a version of the training set with subjectid, activity, mean and std.dev
	traintypes$activity <- activity.labels[traintypes$activity, "label"]
	traindataset <- cbind(subject.id = trainsubjects$subject.id,
					 traintypes,
					 mean = apply(traindata, 1, mean),
					 st.dev = apply(traindata, 1, sd))

	#merge the two data sets to create the first full data set
	dataset.1 <- rbind(testdataset, traindataset)

	#create the second data set - same as before but now grouping on activity
	#recast weird measurements
	#melt on apropriate aggfuns
	testdataset.2 <- cbind(testsubjects, testtypes, testdata)
	traindataset.2 <- cbind(trainsubjects, traintypes, traindata)
	dataset.2 <- rbind(testdataset.2, traindataset.2)
	measure.vars <- names(dataset.2[,c(-1,-2)])
	meltset <- melt(dataset.2, id = c("subject.id", "activity"), measure.vars=measure.vars)
	ddply(meltset, .(subject.id, activity), summarize, mean = mean(value))
	

}


