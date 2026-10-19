
# Week 2 Task: Data Visualization and Insight Communication using R
# Focus: ggplot2 Dynamic Visualization Suite


library(dplyr)
library(ggplot2)
library(tidyr)

# 1. Cleaned Titanic Dataset
titanic_data <- data.frame(
  PassengerId = 1:20,
  Survived = c(0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1),
  Pclass = c(3, 1, 3, 1, 3, 3, 1, 3, 3, 2, 3, 1, 3, 3, 3, 2, 3, 2, 3, 3),
  Sex = c("male", "female", "female", "female", "male", "male", "male", "male", 
          "female", "female", "female", "female", "male", "male", "female", 
          "female", "male", "male", "female", "female"),
  Age = c(22, 38, 26, 35, 35, 28, 54, 2, 27, 14, 4, 58, 20, 39, 14, 55, 2, 28, 31, 28),
  Fare = c(7.25, 71.28, 7.92, 53.1, 8.05, 8.45, 51.86, 21.07, 11.13, 30.07, 
           16.7, 26.55, 8.05, 31.27, 7.85, 16.0, 29.12, 13.0, 18.0, 65.0),
  Embarked = c("S", "C", "S", "S", "S", "Q", "S", "S", "S", "C", "S", "S", "S", "S", "S", "S", "Q", "S", "S", "S"),
  stringsAsFactors = FALSE
)

# Factor Conversions
titanic_data$Survived <- factor(titanic_data$Survived, levels = c(0, 1), labels = c("No", "Yes"))
titanic_data$Pclass <- factor(titanic_data$Pclass, levels = c(1, 2, 3), labels = c("1st", "2nd", "3rd"))
titanic_data$Sex <- factor(titanic_data$Sex)

# Visual 1: 100% Stacked Bar Chart - Survival Proportion by Gender
p1 <- ggplot(titanic_data, aes(x = Sex, fill = Survived)) +
  geom_bar(position = "fill", color = "white", width = 0.6) +
  scale_fill_manual(values = c("No" = "#E74C3C", "Yes" = "#2ECC71")) +
  labs(title = "Survival Proportion by Gender",
       subtitle = "Evacuation Protocol Verification: Women vs Men",
       x = "Gender", y = "Proportion", fill = "Survived") +
  theme_minimal()

# Visual 2: Histogram - Passenger Age Distribution
p2 <- ggplot(titanic_data, aes(x = Age)) +
  geom_histogram(binwidth = 10, fill = "#1F618D", color = "white") +
  labs(title = "Distribution of Passenger Age",
       subtitle = "Demographic breakdown across binned age cohorts",
       x = "Age (Years)", y = "Passenger Count") +
  theme_minimal()

# Visual 3: Grouped Bar Chart - Survival Rate by Passenger Class
p3 <- ggplot(titanic_data, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "fill", color = "white", width = 0.6) +
  scale_fill_manual(values = c("No" = "#E74C3C", "Yes" = "#2ECC71")) +
  labs(title = "Survival Rate by Passenger Class",
       subtitle = "Socio-economic impact on passenger survival",
       x = "Passenger Class", y = "Proportion", fill = "Survived") +
  theme_minimal()

# Visual 4: Multivariate Scatter Plot - Fare vs Age by Survival
p4 <- ggplot(titanic_data, aes(x = Age, y = Fare, color = Survived)) +
  geom_point(size = 3.5, alpha = 0.8) +
  scale_color_manual(values = c("No" = "#E74C3C", "Yes" = "#2ECC71")) +
  labs(title = "Fare vs Age by Survival Status",
       subtitle = "High-fare passenger survival clusters",
       x = "Age (Years)", y = "Ticket Fare ($)", color = "Survived") +
  theme_minimal()

# Print Plots
print(p1)
print(p2)
print(p3)
print(p4)
