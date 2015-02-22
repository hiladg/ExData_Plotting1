	## first we load the data into R
	## These are the folders' names
	## Please note that the operating system is Windows! (clause 1)
	 wd_train<-"./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals"
	 wd_test<-"./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals"

	##For both X and Y, the Y is the activity, the X is the data itself
	 y_train<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt", header=FALSE)
	 x_train<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", header=FALSE)

	 y_test<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt", header=FALSE)
	x_test<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", header=FALSE)

	## and these are ther list of subjects
	subject_train.filename<-"./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
	subject_test.filename<-"./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"

	subject_data<-read.table(subject_train.filename)
	test_data<-read.table(subject_test.filename)
	
	## We want only those items with "mean()" or "std" in their names
	## I included the meanFrequency that sometimes appear (clause 2), as it is a mean
	 c1<-grep("mean", names[,2])
	 c2<-c(c1,grep("std", names[,2]))



	## and these are only the columns that we want
	x_train.sub<-AllTrain.df[c2]
	x_test.sub<-AllTest.df[c2]

	##This is how we merge the data	
	##simple merge

	## first All the trains, then all the test
	AllTrain.df<-cbind(subject_data, y_train, x_train.sub)
	AllTest.df<-cbind(test_data, y_test, x_test.sub)

	## and then all of them together
	TrainAndTest.df<-rbind(AllTrain.df, AllTest.df)


	## now we subset only what we want
	## We're only looking for the data items that are either mean or std
	## so this is the list of column items with mean, or std, in their name
	fitres <-	"./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt"
	names<-read.table(fitres)
	
	## Uses descriptive activity names to name the activities in the data set
	##WALKING  WALKING_UPSTAIRS  WALKING_DOWNSTAIRS SITTING  STANDING  LAYING
	TrainAndTest.df[,4]=factor(TrainAndTest.df[,4], labels=c("WALKING",  "WALKING_UPSTAIRS",  "WALKING_DOWNSTAIRS", "SITTING",  "STANDING",  "LAYING"))

	## since it is a factor variable, we had to use the factor as below in order to change it
	

	## now we merge them together
	i<-sapply(names, is.factor)
	names[i]<-lapply(names[i], as.character)

 	MyColNames<-c("subject", "activity", names[c2, 2])
 	colnames(TrainAndTest.df)<-MyColNames



	##Now we need to create the new & tidy data set
	## that includes: the average of Each Variable for Each Activity and Each Subject
	## The variable for each activity

	


	## First we split the data by Activity
	splitData<-split(TrainAndTest.df, TrainAndTest.df[,2])
	## and now we create 6 datasets from it, by Subject
	r1<-ddply(splitData$WALKING, "subject", function(x)colMeans(subset(x, select=-activity)))
	r2<-ddply(splitData$WALKING_UPSTAIRS , "subject", function(x)colMeans(subset(x, select=-activity)))
	r3<-ddply(splitData$WALKING_DOWNSTAIRS , "subject", function(x)colMeans(subset(x, select=-activity)))
	r4<-ddply(splitData$SITTING , "subject", function(x)colMeans(subset(x, select=-activity)))
	r5<-ddply(splitData$STANDING , "subject", function(x)colMeans(subset(x, select=-activity)))
	r6<-ddply(splitData$LAYING , "subject", function(x)colMeans(subset(x, select=-activity)))

	##Let's return the activity column
	 r1$Activity = "WALKING"
	 r2$Activity = "WALKING_UPSTAIRS"
	 r3$Ac	tivity = "WALKING_DOWNSTAIRS"
	 r4$Ac	tivity = "SITTING"
	 r5$Activity = "STANDING"
	r6$Activity = "LAYING"

	##and now for submission
	 write.table(rbind(r1, r2, r3, r4, r5, r6), row.name=FALSE, file="project3.txt")




