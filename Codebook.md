# Codebook
Output.txt contains summarized set of sensor data collected from waist mounted smartphone (Samsung Galaxy S II). 
This data was collected for 30 participates for 6 different activites

## Structure
Output.txt contains 180 observations of 88 variables. It essentially contains the mean of all metrics grouped by subject and activity combination.

## Metrics
* This data includes two types of sensor data; accelerometer and gyroscope
* Each sensor records observations at 50 Hz hence there are time based variables
* Fast Fourier Transformation was applied to a few variables, hence there are frequency based variables
* Only mean and std type of metrics were extracted for the analysis

## List of Activites
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
