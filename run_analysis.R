#Create directory dataset to store the dataset
if(!file.exists("./dataset")){
        dir.create("./dataset");
}

# download the dataset zip file
zipfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
download.file(zipfile,destfile = "./dataset/dataset.zip", mode="wb");

#Unzip the file
unzip(zipfile = "./dataset/dataset.zip", files = NULL, list=FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE);

#Load common items such as activity lables and Features
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

# Load Test datasets
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE);
names(X_test)<- features$V2;
Y_test <- read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE);
names(Y_test) <- c("Acitivity_ID");
subject_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE);
names(subject_test) <- c("Subject_ID");

# Load Train datasets
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE);
names(X_train)<- features$V2;
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE);
names(Y_train) <- c("Acitivity_ID");
subject_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE);
names(subject_train) <- c("Subject_ID");



# STEP 1 - Merges the training and the test sets to create one data set.
test_data <- cbind(subject_test, Y_test, X_test);
#names(test_data);
train_data <- cbind(subject_train, Y_train, X_train);
#names(train_data);
test_train_data <- rbind(train_data, test_data);


# STEP 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
extract_columns <- c("Subject_ID", "Acitivity_ID");
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", features[,2], value = TRUE);
extract_columns<- append(x = extract_columns, values = mean_std_columns,after = length(extract_columns) );
#names(test_train_data)
test_train_data = test_train_data[, extract_columns];

# STEP 3 - Uses descriptive activity names to name the activities in the data set
test_train_data$Acitivity_ID <- factor(test_train_data$Acitivity_ID, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# STEP 4 Appropriately labels the data set with descriptive variable names
# Already Done

# STEP 5
# create the tidy data set
library(reshape2)
melted <- melt(test_train_data, id=c("Subject_ID","Acitivity_ID"))
tidy <- dcast(melted, Subject_ID+Acitivity_ID ~ variable, mean)

# write the tidy data set to a file
write.csv(tidy, "tidy.csv", row.names=FALSE)
