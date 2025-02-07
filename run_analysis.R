# Load necessary libraries
library(dplyr)

# Download and unzip dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "dataset.zip", method = "curl")
unzip("dataset.zip")

# Read in data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load train and test datasets
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

# Merge train and test sets
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
merged_data <- rbind(train, test)

# Extract only mean and standard deviation columns
selected_columns <- grep("-(mean|std)\\(\\)", features$feature)
tidy_data <- merged_data[, c(1, 2, selected_columns + 2)]

# Use descriptive activity names
tidy_data$activity <- factor(tidy_data$activity, levels = activities$code, labels = activities$activity)

# Rename variables with descriptive names
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))

# Create second tidy dataset with averages
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write to a text file
write.table(final_data, "tidy_data.txt", row.name = FALSE)

