#Code Book

---
##Collection

Raw data is obtained from UCI Machine Learning Repository.And we used the data "Human Activity Recognition Using Smartphones Data Set".It built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

---
##Variables

BodyAcc-XYZ,
GravityAcc-XYZ,
BodyAccJerk-XYZ,
BodyGyro-XYZ,
BodyGyroJerk-XYZ,
BodyAccMag,
GravityAccMag,
BodyAccJerkMag,

There are two kinds of domain for each signal,time and frequency.

---
###The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

---
##Tidy Step
1. Loads all eight data(	x_test,y_test_subject_test,x_train,y_train,_subject_train,feature and activityName)
2. Merges the trainning and the test sets,and rename the column to create one data set.
3. Extracts mean and standard deviation for each measurement.
4. Name activities to decriptive activity names 
5. Make all variables name readable , and get the tidy data.
6. Create another tidy data with the average of each variable for each activity and each subject.
