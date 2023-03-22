# Import libraries
library(stargazer)
library(tidyverse)
library(Hmisc)
library(car)

# Import data
setwd("~/Documents/JHU/capstone/data")
data <- read.csv("nsduh_2021_subset_clean.csv")
              #   stringsAsFactors=TRUE)
data <- as.data.frame(data)

# Summary statistics
stargazer(data, type="text")
summary(data)

# Multicollinearity

