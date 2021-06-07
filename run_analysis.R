
library(dplyr)
## Reading Test files ### 
## Step 1. Reading the Subject file for Test 
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

dim(subject_test)
#2947    1

## Step 2. Reading the Observation file for Test
df_tst_x <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

dim(df_tst_x)
#2947  561
head(df_tst_x, n=1)

## Step 3. Reading the Activities file for Test
df_tst_y <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)

dim(df_tst_y)
head(df_tst_y)
#2947    1

## Step 4. Merging the Test file for Subject , Activities and Observation

test_data_set <- cbind(subject_test,df_tst_y,df_tst_x)
dim(test_data_set)
# 2947  563
## Reading Train files ### 
## Step 5. Reading the Subject file for Test 
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

dim(subject_train)
#7352    1
## Step 6. Reading the Observation file for Test
df_trn_x <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)

dim(df_trn_x)
#7352  561
head(df_trn_x, n=1)

## Step 7. Reading the Activities file for Test
df_trn_y <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
dim(df_trn_x)
#7352  561

## Step 8. Merging the Train file for Subject , Activities and Observation

train_data_set <- cbind(subject_train,df_trn_y,df_trn_x)

dim(train_data_set)
# 7352  563

#Step 9. Now that we have a data Set of Test and Train we have been asked to 
# Combine both these sets. Hence I will be using rbind to combine the test and Train
# which is 2947 +7352 = 10299 rows with 563 columns

combined_set <- rbind(test_data_set,train_data_set)
dim(combined_set)
# 10299   563 - performing dim helps us to understand if the dataset is combined correctly.
## This step concludes the #1 Objective: Merges the training and the test sets to create one data set.

# Step 10. Updating the variables or Features using the feature 
feature_names <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

dim(feature_names)
# 561   2 - check to see that the dimensions are correct
# Next is to get the names updated to the features, 
#but remember our first two columns are subject and activities hence we have to name these first
names(combined_set) <- c("personid","activity",feature_names[,2]) 

# validated the columns are updated
head (combined_set,n=1)
# Variable names looks good but 


#Step 11 to address the #2 objective:Extracts only the measurements on the mean and standard deviation for each measurement. 

combined_set1 <- combined_set [grepl("personid|activity|std|mean",names(combined_set))]
# now to update the Activities so that we can update the IDs of activities
#Also note I have made a different version for combined set to back up the original set in case of issues

#Step 12 updating the activities 
activities_names <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
names(activities_names) <- c("id","activity_label") 
# Trying to add descriptive label for next step merging

combined_set1 <- merge(combined_set1,activities_names, by.x="activity",by.y="id")
## This step concludes the #3 Objective: Uses descriptive activity names to name the activities in the data set
##head(combined_set1, n=1)
##dim(combined_set1)
## 10299    82

#Step 13 Now that we have a tidy data we need to write the data to a file to upload in Github
write.csv(combined_set1,"Tidy_set1.csv" )

#Step 14 Getting second data set that achieves final 
##Objective#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## in this step grouping the set by Person ID and lable and then 
#calculating Mean for variables subsetting the collumns using 4:80 using across for mean
combined_set2 <-group_by(combined_set1,personid,activity_label) %>%
  summarise(across(4:80,mean)) %>%
  print

dim(combined_set2)
## 180  79
write.csv(combined_set2,"Tidy_set2.csv" )



