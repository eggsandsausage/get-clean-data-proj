###Study design
The production of the result files from the raw data is present in its entirety in the run_analysis.R script. The main points of this procedure:
1. Subject id and measurement data is read from the test and training datasets.
2. Data is read from the files containing descriptive labels for the activities and the measurements.
3. Subject data, measurement data and labeling is merged for the separate sets (train and test)
4. The two sets are merged
5. A subset is created by extracting measurements which description ends with "mean()" or "std()". This data will be written to "./result/mean-and-std-measurements.csv"
6. A subset is created (from the dataset in step 4) by grouping subjects and activities and taking the mean across all accelerometer measurements. This data will be written to "./result/mean-measurements.csv"
7. Data is written to file 

###Code book
Two files produced:
* ./result/mean-and-std-measurements.csv - contains means and standard deviations for a number of accelerometer measurements. 
* ./result/mean-measurements.csv - contains the average accelerometer measurements grouped by subject and activity type.

Both files contains a subject.id and the activity variables. "subject.id" is the subject identifier and the activity variable is a descriptive label of the activity. Furthermore, the accelerometer measurements (the bulk of the variables, eg "tBodyAcc-energy()-Z") and how they were calculated are explained in more detail in the raw data files "features_info.txt" and "README.txt". These files have been included in the "./ref" directory for reference.

