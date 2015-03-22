# SmartphoneAccelerometerData
This repository contains:
* this readme text in "README.md"
* an R script called "run_analysis.R" which contains the function run_analysis()
* code book for reading into R 

These files are designed to work with/on the human activity recognition smartphone accelerometer data obtained from the UCI Machine Learning Repository, combining the subject identifiers, activity identifiers, and "relevant" data into a "tidy" data.frame and returning it.

For more information on how these steps are performed and the definition of "relevant" data, see CodeBook.md.

### run_analysis() expects the following directory structure:

getwd()  
  |----Script  
  |    |----run_analysis.R  
  |    |----README.md  
  |    |----CodeBook.md  
  |----UCI HAR Dataset  
       |----(files and subfolders of input dataset)  

### The original data, in the form of a directory structure within a .zip file, can be obtained at:
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

Note that the terms of use for the original data set explicitly **prohibit** commercial use.

### A decription of the Human Activity Recognition experiment, license, and data collection methods can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

More details are available from the file "README.txt" within the "UCI HAR Dataset" folder.

Users are expected to extract the dataset archive to the top level of their R working directory before running run_analysis.R. 

### As specified the source of the dataset, the proper citation for using the dataset this repo is designed to operate on is as follows:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

