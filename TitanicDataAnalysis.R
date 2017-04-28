

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

#Take a look at gross survival rates
table(data.combined$Survived)


# Distrbution across classes
table(data.combined$Pclass)

# Load up ggplot2 package to use vizualization

library(ggplot2)

# Hyphothesis - Rich folks survived at a higher rate
train$Pclass <- as.factor(train$Pclass)

str(train)

ggplot(train, aes(x = Pclass, fill = factor(Survived))) + 
  geom_bar(width = 0.5) +
  xlab("Plcass") +
  ylab("Total Count") +
  labs(fill = "Survived")
  

