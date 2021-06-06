
library(dplyr)
## Reading Test files ### 
## Step 1. Reading the Subject file for Test 
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

dim(subject_test)
#2947    1

## Step 2. Reading the Observation file for Test
df_tst_x1 <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

dim(df_tst_x1)
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

# Step 10. Updating the variables or Features using the feature 
feature_names <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

dim(feature_names)
# 561   2 - check to see that the dimensions are correct
# Next is to get the names of the combined set updated to the features, 
#but remember our first two columns are subject and activities hence we have to name these first
names(combined_set) <- c("personid","activity",feature_names[,2]) 

# validated the columns are updated
head (combined_set,n=1)
# Variable names looks good but did not add that validation as it will be huge.
# now to update the 

