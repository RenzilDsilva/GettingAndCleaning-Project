# GettingAndCleaning-Project
Coursera Project 

> Author Renzil Dsilva


* Created Date 06 June 2021

***

_Reference:_

Thanks to this great article I was able to understand how to approach this assignment project. I got this link in one of our discussion forums https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/ 
Also this reference cheat sheet for dplyr was really useful https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf

As per the article the intertial Signal folder was not really use hence the analysis focused on getting the Training and Test data set merged hence it was performed in 14 steps


* Step 1. Reading the Subject file for Test 
* Step 2. Reading the Observation file for Test
* Step 3. Reading the Activities file for Test
* Step 4. Merging the Test file for Subject , Activities and Observation
* Step 5. Reading the Subject file for Test 
* Step 6. Reading the Observation file for Test
* Step 7. Reading the Activities file for Test
* Step 8. Merging the Train file for Subject , Activities and Observation
* Step 9. Now that we have a data Set of Test and Train we have been asked to Combine both these sets. Hence I will be using rbind to combine the test and Train which is 2947 +7352 = 10299 rows with 563 columns
* Step 10. Updating the variables or Features using the feature 
* Step 11 to address the #2 objective:Extracts only the measurements on the mean and standard deviation for each measurement. 
* Step 12 updating the activities. This step concludes the #3 Objective: Uses descriptive activity names to name the activities in the data set
* Step 13 Now that we have a tidy data we need to write the data to a file to upload in Github. In this step I created Tidy_set1.txt of all observation as a CSV file. I have uploaded this file for reference here https://github.com/RenzilDsilva/GettingAndCleaning-Project/blob/main/Tidy_set1.csv
* Step 14 Getting second data set that achieves final Objective#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.in this step grouping the set by Person ID and lable and then calculating Mean for variables subsetting the collumns using 4:80 using across for mean. In step I created Tidy_set2.txt file and have uploaded as a CSV file and uploaded here https://github.com/RenzilDsilva/GettingAndCleaning-Project/blob/main/Tidy_set2.csv

----
* Codebook creation was done based on the these two tidy data sets using dataMaid package. 
Refer Codebook.r. Pre-requsite is to have a installed dataMaid package. 
* More information on dataMaid package can be found here - https://cran.r-project.org/web/packages/dataMaid/dataMaid.pdf




