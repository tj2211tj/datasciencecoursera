Codebook.md describes the associated variable names, the data itself, and the procedures that were 
followed to generate the resulting data.

run.analysis.R consists of code to perform the following 5 tasks:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average
  of each variable for each activity and each subject.This data set is then written to file "tidydata.txt".
  
To run the code, ensure you are in the correct working directory you wish, then download "run_analysis.R" and source 
the script. Any necessary data files, if not already present, will be automatically downloaded to the current working directory. 
The output will be written to the working directory in file "tidydata.txt".
