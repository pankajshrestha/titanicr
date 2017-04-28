

# Load raw data
train <- read.csv("train.csv", header=TRUE)
test <- read.csv("test.csv", header = TRUE)

# Add a "Survived" variable to the test set to allwo for combining data sets
test.survived <- data.frame(test[1], Survived = rep("None",nrow(test)), test[2:11])

#Combine data sets
data.combined <- rbind(train, test.survived)

str(data.combined)


data.combined$Survived <- as.factor(data.combined$Survived)
data.combined$Pclass <- as.factor(data.combined$Pclass)
