# Getting and Cleaning Data Assignment
This repo contains submission for the Week-4 Peer Reviewd Assignment for the course "Getting and Cleaning Data" offered by John Hopkins University on Coursera.

## Contents
### 1. Codebook.md
This file contains information about the data used for the analysis.

### 2. run_analysis.R
Contains the R code that manipulates the dataset. Following operations are performed on the dataset
1. Importing test and train data
2. Merging test and train dataset 
3. Assigning column names to the dataset
4. Creating a final merge data that contains dependent and independent variable
5. Selecting measurements with mean and std only
6. Substituting activity id with descriptive names
7. Change column names to be more readable
8. Generating a summary of mean of all variables by subject and activity
9. Writing the final data to Output.txt

### 3. Output.txt
Contains final output of run_analysis.R
