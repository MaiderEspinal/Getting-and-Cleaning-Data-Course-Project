# Getting-and-Cleaning-Data-Course-Project
### **README.md**
```md
# Getting and Cleaning Data - Course Project  

## **Project Overview**  
This project processes data collected from the accelerometers of the Samsung Galaxy S smartphone. The goal is to clean and organize the data into a **tidy dataset** that can be used for further analysis.

The **raw data** comes from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

---

## **Repository Contents**  
This repository contains the following files:  

- `run_analysis.R` → R script to process and clean the dataset  
- `tidy_data.txt` → Final cleaned dataset  
- `CodeBook.md` → Describes variables, transformations, and methodology  
- `README.md` → Instructions on how to run the script  

---

## **How to Run the Script**  
### **1. Download and Extract the Data**  
1. Download the dataset from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  
2. Unzip the file into your working directory.  

### **2. Run `run_analysis.R`**  
To generate `tidy_data.txt`, execute the script in R:

```r
source("run_analysis.R")
