#this programm in R is to create a nice tidy data set from the given text files
# reading all the files 


#please provide some appropriate working directory
features     = read.table('./features.txt',header=FALSE); #imports features.txt
activityType = read.table('./activity_labels.txt',header=FALSE); #imports activity_labels.txt
subjectTrain = read.table('./train/subject_train.txt',header=FALSE); #imports subject_train.txt
xTrain       = read.table('./train/x_train.txt',header=FALSE); #imports x_train.txt
yTrain       = read.table('./train/y_train.txt',header=FALSE); #imports y_train.txt

subjectTest = read.table('./test/subject_test.txt',header=FALSE); #imports subject_test.txt
xTest       = read.table('./test/x_test.txt',header=FALSE); #imports x_test.txt
yTest       = read.table('./test/y_test.txt',header=FALSE); #imports y_test.txt




# assign nice column names to the data table read with read.table
colnames(activityType)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";

colnames(subjectTest) = "subjectId";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activityId";

 # merging the three data tables by column to create a single new data table
trainingData = cbind(yTrain,subjectTrain,xTrain);
testData = cbind(yTest,subjectTest,xTest);


# finally combine the two data table created by the row
finalData = rbind(trainingData,testData);

# assign column names to a variable
colNames  = colnames(finalData);

# making a logical vector keeping in mind to subset the data by mean id and sd
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) |
                   grepl("-mean..",colNames) & 
                   !grepl("-meanFreq..",colNames) &
                   !grepl("mean..-",colNames) | 
                   grepl("-std..",colNames) & !grepl("-std()..-",colNames));

#subsetting the data
finalData = finalData[logicalVector==TRUE];

#assigning the activities to the rows according to activity id
finalData = merge(finalData,activityType,by='activityId',all.x=TRUE);
colNames  = colnames(finalData);

#correction of the column names of the final data
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

#assigning the refined names to columns
colnames(finalData) = colNames;

#removing the final two columns
finalDataNoActivityType  = finalData[,names(finalData) != 'activityType'];

#aggregating the final data set
tidyData    = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) !=
                                                  c('activityId','subjectId')],
                        by=list(activityId=finalDataNoActivityType$activityId,
                                subjectId = finalDataNoActivityType$subjectId),mean);
#merging the data by activity id
tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE);

#storing the table 
write.table(tidyData, './tidyData2.txt',row.names=TRUE,sep='\t');

