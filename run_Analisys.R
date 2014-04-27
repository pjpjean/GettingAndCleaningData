
path.UCI.HAR.Dataset <- function(filename) {
  homeFolder <- getwd()
  
  if (file.exists(paste(homeFolder, filename, sep="/"))) {
    return(paste(homeFolder, filename, sep="/"))
  }
  
  if (file.exists(paste(homeFolder, "UCI HAR Dataset", filename, sep="/"))) {
    return(paste(homeFolder, "UCI HAR Dataset", filename, sep="/"))
  }
  
  if (file.exists(paste(homeFolder, "train", filename, sep="/"))) {
    return(paste(homeFolder, "train", filename, sep="/"))
  } else if (file.exists(paste(homeFolder, "UCI HAR Dataset/train", filename, sep="/"))) {
    return(paste(homeFolder, "UCI HAR Dataset/train", filename, sep="/"))
  }
  
  if (file.exists(paste(homeFolder, "test", filename, sep="/"))) {
    return(paste(homeFolder, "test", filename, sep="/"))
  } else if (file.exists(paste(homeFolder, "UCI HAR Dataset/test", filename, sep="/"))) {
    return(paste(homeFolder, "UCI HAR Dataset/test", filename, sep="/"))
  }
  
  return("")
}

files.to.read <- c("features.txt", "activity_labels.txt",
                   "subject_train.txt", "X_train.txt", "y_train.txt",
                   "subject_test.txt", "X_test.txt", "y_test.txt")
filepath <- sapply(files.to.read, path.UCI.HAR.Dataset)

if (any(nchar(filepath)==0)) {
  file.errors <- names(filepath[nchar(filepath)==0])
  error.message <- paste("Required file(s) not found!",
                         paste("[",seq_along(file.errors), "]", file.errors, " ", sep="", collapse=""))
  stop(error.message)  
}

# Merges the training and the test sets to create one data set.
## Read features.txt to get feature names
features <- read.table(filepath[1], col.names=c("id", "name"), stringsAsFactors=FALSE)

## Read activity_labels.txt to get activity names
activities <- read.table(filepath[2], col.names=c("id", "label"), stringsAsFactors=FALSE)

## For the training set
### read subject_train.txt -> ID
subject_train <- read.table(filepath[3], col.names="subject", stringsAsFactors=FALSE)

### read X_train.txt       -> features
X_train <- read.table(filepath[4], col.names=features$name, stringsAsFactors=FALSE)

### read y_train.txt       -> activity
y_train <- read.table(filepath[5], col.names="activity.id", stringsAsFactors=FALSE)

## Repeat for the test set, then merge.
### read subject_test.txt -> ID
subject_test <- read.table(filepath[6], col.names="subject", stringsAsFactors=FALSE)

### read X_test.txt       -> features
X_test <- read.table(filepath[7], col.names=features$name, stringsAsFactors=FALSE)

### read y_test.txt       -> activity
y_test <- read.table(filepath[8], col.names="activity.id", stringsAsFactors=FALSE)

# Appropriately labels the data set with descriptive activity names. 
y_train.labels <- activities$label[match(y_train$activity.id, activities$id)]
y_test.labels <- activities$label[match(y_test$activity.id, activities$id)]

# make full dataset
har.full.dataset <- data.frame(rbind(subject_train, subject_test),
                               activity=c(y_train.labels, y_test.labels),
                               rbind(X_train, X_test),
                               stringsAsFactors=FALSE)


# Extracts only the measurements on the mean and 
# standard deviation for each measurement.
features.to.extract <- make.names(features[grep("-(mean|std)\\(\\)", features$name),]$name)
har.subset <- subset(har.full.dataset, select=c("subject", "activity", features.to.extract))

# Creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
har.tidy <- aggregate(har.subset[-c(1,2)],
                      by=list(subject=har.subset$subject,
                              activity=har.subset$activity),
                      FUN=mean)

# Output tidy data set
write.csv(har.tidy, file="har_tidy.csv", row.names=FALSE)