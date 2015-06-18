library(dplyr)

################################################################################
#
# set data paths
#
################################################################################

# data path to training set, training labels & subject labels
train.path <- "./UCI HAR Dataset/train/X_train.txt"
train.label.path <- "./UCI HAR Dataset/train/y_train.txt"
train.subj.path <- "./UCI HAR Dataset/train/subject_train.txt"

# data path to test set, test labels & subject labels
test.path <- "./UCI HAR Dataset/test/X_test.txt"
test.label.path <- "./UCI HAR Dataset/test/y_test.txt"
test.subj.path <- "./UCI HAR Dataset/test/subject_test.txt"

# data path to activity labels
activity.label.path <- "./UCI HAR Dataset/activity_labels.txt"

# data path to features
features.path <- "./UCI HAR Dataset/features.txt"


################################################################################
#
# read in data
#
################################################################################

# read in features & activity labels
activity.label <- read.table(activity.label.path)
features <- read.table(features.path)

# read in the training set, training labels & subject labels
train <- read.table(train.path)
train.label <- read.table(train.label.path)
train.subj <- read.table(train.subj.path)

# read in the test set, test labels & subject labels
test <- read.table(test.path)
test.label <- read.table(test.label.path)
test.subj <- read.table(test.subj.path)


################################################################################
#
# data munging
#
################################################################################

# combine measurements, labels & subjects data for training & test sets
data <- bind_rows(train, test)
labels <- bind_rows(train.label, test.label)
subjects <- bind_rows(train.subj, test.subj)

# label the columns with descriptive variable names in the data frames
colnames(activity.label) <- c("activityCode", "activity")
colnames(features) <- c("featureNum", "feature")
colnames(data) <- as.character(features$feature)
colnames(labels) <- "activityCode"
colnames(subjects) <- "subject"

# select only columns containing the mean & std deviation of measurements,
# followed by joining the activity labels & subject details, and replacing
# the activity labels with descriptive names
full.data <-
  data[, grep(".*std\\(\\)|mean\\(\\).*", colnames(data))] %>%
  bind_cols(labels, subjects) %>%
  
  # replace the activity labels with descriptive activity names
  left_join(activity.label, by = "activityCode") %>%
  select(-activityCode)


################################################################################
#
# create tidy (wide) data set
#
################################################################################

tidy.data <-
  full.data %>% group_by(subject, activity) %>% summarise_each(funs(mean))


