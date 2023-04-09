# Import libraries
library(tidyverse)

# Import data
setwd("~/Documents/GitHub/capstone/data")
data <- read.csv("nsduh_2021_final.csv",
                 stringsAsFactors=TRUE)
data <- as.data.frame(data)

# Rename variables
data$unmet_need <- data$AMHTXND2
data$tx_util <- data$AMHTXYR4
data$age <- data$AGE3
data$military_service <- data$SERVICE
data$sex <- data$IRSEX
data$sexual_identity <- data$SEXIDENT
data$marital_status <- data$IRMARIT
data$education <- data$EDUHIGHCAT
data$race_ethnic <- data$NEWRACE2
data$emp_status <- data$IRWRKSTAT18
data$gov_asst <- data$GOVTPROG
data$urban_rural <- data$COUTYP4

# Categorical variables to factors + reference category

## SEX

data$sex <- as.factor(data$sex)
unique(data$sex)
data$sex <- fct_recode(data$sex,
                         male = "1", # 1=Male
                         female = "2") # 2=Female
#data$sex <- relevel(data$sex, ref = "male")


## SEXUAL IDENTITY

data$sexual_identity <- as.factor(data$sexual_identity)
data$sexual_identity <- fct_collapse(data$sexual_identity,
                                     "1" = "1", # Hetero/straight
                                     "2" = "2", # Lesbian/gay
                                     "3" = "3", # Bisexual
                                     "99" = c("85", "94", "97", "98", "99"))
data$sexual_identity <- as.numeric(as.character(data$sexual_identity))
data <- mutate(data, sexual_identity = na_if(sexual_identity, 99))
data$sexual_identity <- as.factor(data$sexual_identity)
data$sexual_identity <- fct_collapse(data$sexual_identity,
                                     "Heterosexual" = "1",
                                     "Lesbian/Gay" = "2",
                                     "Bisexual" = "3")
unique(data$sexual_identity)
#data$sexual_identity <- relevel(data$sexual_identity, ref = "Heterosexual")


## MARITAL STATUS

data$marital_status <- as.factor(data$marital_status)
data$marital_status <- fct_collapse(data$marital_status,
                                    "Married" = "1", 
                                    "Widowed" = "2", 
                                    "Divorced" = "3", 
                                    "Never married" = c("4","99"))
unique(data$marital_status)
#data$marital_status <- relevel(data$marital_status, ref = "Never married")


## EDUCATION

#data$education <- as.factor(data$education)
#data$education <- fct_collapse(data$education,
 #                              "1" = "1", 
  #                             "2" = "2", 
   #                            "3" = "3", 
    #                           "4" = "4", 
     #                          "99" = "5")
#data$education <- as.numeric(as.character(data$education))
#data <- mutate(data, education = na_if(education, 99))
#data$education <- as.factor(data$education)
#data$education <- fct_collapse(data$education,
 #                              "No HS diploma" = "1", 
  #                             "HS diploma" = "2", 
   #                            "Some college/Assoc degree" = "3", 
    #                           "Bach degree or higher" = "4")
#unique(data$education)
#data$education <- relevel(data$education, ref = "Bach degree or higher")

  
## RACE/ETHNICITY

data$race_ethnic <- as.factor(data$race_ethnic)
data$race_ethnic <- fct_collapse(data$race_ethnic,
                                 "NonHispWhite" = "1", 
                                 "NonHispBlack" = "2", 
                                 "NonHispNativeAmAK" = "3", 
                                 "NonHispNativeHIPacIsl" = "4", 
                                 "NonHispAsian" = "5", 
                                 "NonHispMulti" = "6", 
                                 "Hispanic" = "7")
unique(data$race_ethnic)
#data$race_ethnic <- relevel(data$race_ethnic, ref = "NonHispWhite")


## EMPLOYMENT STATUS

data$emp_status <- as.factor(data$emp_status)
data$emp_status <- fct_collapse(data$emp_status,
                                "1" = "1", 
                                "2" = "2", 
                                "3" = "3", 
                                "4" = "4", 
                                "99" = "99")
data$emp_status <- as.numeric(as.character(data$emp_status))
data <- mutate(data, emp_status = na_if(emp_status, 99))
data$emp_status <- as.factor(data$emp_status)
data$emp_status <- fct_collapse(data$emp_status,
                                "FullTime" = "1", 
                                "PartTime" = "2", 
                                "Unemployed" = "3", 
                                "Other" = "4")
summary(data$emp_status)
#data$emp_status <- relevel(data$emp_status, ref = "FullTime")


## URBAN/RURAL

#data$urban_rural <- as.factor(data$urban_rural)
#data$urban_rural <- fct_collapse(data$urban_rural,
 #                                "LargeMetro" = "1", 
  #                               "SmallMetro" = "2", 
   #                              "Nonmetro" = "3")
#summary(data$urban_rural)
#data$urban_rural <- relevel(data$urban_rural, ref = "LargeMetro")


# Remove unused variables

final_dataset <- select(data, unmet_need, tx_util, insurance, insurance_type,
                        age, military_service, sex, sexual_identity, 
                        marital_status, education, race_ethnic, HEALTH, 
                        emp_status, gov_asst, INCOME, urban_rural)


# Export CSV

write.csv(final_dataset, "nsduh_2021_final_subset.csv", row.names = FALSE)


