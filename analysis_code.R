# Import libraries
library(stargazer)
library(tidyverse)
library(sandwich)
library(lmtest)

# Import data
setwd("~/Documents/GitHub/capstone/data")
data <- read.csv("nsduh_2021_final_subset.csv",
                 stringsAsFactors=TRUE)
data <- as.data.frame(data)

## set reference levels
data$sex <- relevel(data$sex, ref = "male")
data$sexual_identity <- relevel(data$sexual_identity, ref = "Heterosexual")
data$marital_status <- relevel(data$marital_status, ref = "Never married")
data$race_ethnic <- relevel(data$race_ethnic, ref = "NonHispWhite")
data$emp_status <- relevel(data$emp_status, ref = "FullTime")


# Data subsets for analysis & reference levels

## INSURANCE TYPE, exclude "unknown"
data_instype_known <- subset(data, insurance_type != 'unknown')
data_instype_known$insurance_type <- relevel(data_instype_known$insurance_type, 
                                             ref = "none")

## INSURANCE TYPE, only private vs. public
data_instype_priv_pub <- subset(data_instype_known, insurance_type != 'none')
data_instype_priv_pub$insurance_type <- relevel(data_instype_priv_pub$insurance_type, 
                                             ref = "private")

## INSURANCE, exclude "unknown" or "other"
data_ins_known <- subset(data, insurance != 'unknown')
data_ins_known <- subset(data_ins_known, insurance != 'other')
data_ins_known$insurance <- relevel(data_ins_known$insurance, 
                                             ref = "none")

## INSURANCE, all except "unknown", "other" and "none"
data_has_ins <- subset(data_ins_known, insurance != 'none')
data_has_ins$insurance <- relevel(data_has_ins$insurance, 
                                    ref = "private/employer")


# Logit-Probit analysis functions

## Unmet Need x Insurance Type

unmet_instype <- function(dataset, title) {
  
  logit <- glm(unmet_need ~ insurance_type + 
                 age + military_service + sex + sexual_identity + 
                 marital_status + education + race_ethnic + HEALTH + 
                 emp_status + gov_asst + INCOME + urban_rural, 
               family = binomial(link = "logit"), 
               data=dataset)
  logit$rse <- sqrt(diag(vcovHC(logit, type="HC1")))
  logit_pseudoR2 <- 1 - (logit$deviance) / (logit$null.deviance)
  logit_pseudoR2 <- round(logit_pseudoR2, 3)
  
  probit <- glm(unmet_need ~ insurance_type + 
                   age + military_service + sex + sexual_identity + 
                   marital_status + education + race_ethnic + HEALTH + 
                   emp_status + gov_asst + INCOME + urban_rural, 
                 family = binomial(link = "probit"), 
                data=dataset)
  probit$rse <- sqrt(diag(vcovHC(probit, type="HC1")))
  probit_pseudoR2 <- 1 - (probit$deviance) / (probit$null.deviance)
  probit_pseudoR2 <- round(probit_pseudoR2, 3)
  
  stargazer(logit, probit,
            se=list(logit$rse, probit$rse), 
            add.lines = list(c("Pseudo R-Squared", logit_pseudoR2, probit_pseudoR2)),
            type = "text", 
            title=title,
            omit.stat=c("adj.rsq","f"),
            single.row = TRUE)
  
}

## Unmet Need x Insurance

unmet_insurance <- function(dataset, title) {
  
  logit <- glm(unmet_need ~ insurance + 
                 age + military_service + sex + sexual_identity + 
                 marital_status + education + race_ethnic + HEALTH + 
                 emp_status + gov_asst + INCOME + urban_rural, 
               family = binomial(link = "logit"), 
               data=dataset)
  logit$rse <- sqrt(diag(vcovHC(logit, type="HC1")))
  logit_pseudoR2 <- 1 - (logit$deviance) / (logit$null.deviance)
  logit_pseudoR2 <- round(logit_pseudoR2, 3)
  
  probit <- glm(unmet_need ~ insurance + 
                  age + military_service + sex + sexual_identity + 
                  marital_status + education + race_ethnic + HEALTH + 
                  emp_status + gov_asst + INCOME + urban_rural, 
                family = binomial(link = "probit"), 
                data=dataset)
  probit$rse <- sqrt(diag(vcovHC(probit, type="HC1")))
  probit_pseudoR2 <- 1 - (probit$deviance) / (probit$null.deviance)
  probit_pseudoR2 <- round(probit_pseudoR2, 3)
  
  stargazer(logit, probit,
            se=list(logit$rse, probit$rse), 
            add.lines = list(c("Pseudo R-Squared", logit_pseudoR2, probit_pseudoR2)),
            type = "text", 
            title=title,
            omit.stat=c("adj.rsq","f"),
            single.row = TRUE)
  
}

## Tx Utilization x Insurance Type

tx_instype <- function(dataset, title) {
  
  logit <- glm(tx_util ~ insurance_type + 
                 age + military_service + sex + sexual_identity + 
                 marital_status + education + race_ethnic + HEALTH + 
                 emp_status + gov_asst + INCOME + urban_rural, 
               family = binomial(link = "logit"), 
               data=dataset)
  logit$rse <- sqrt(diag(vcovHC(logit, type="HC1")))
  logit_pseudoR2 <- 1 - (logit$deviance) / (logit$null.deviance)
  logit_pseudoR2 <- round(logit_pseudoR2, 3)
  
  probit <- glm(tx_util ~ insurance_type + 
                  age + military_service + sex + sexual_identity + 
                  marital_status + education + race_ethnic + HEALTH + 
                  emp_status + gov_asst + INCOME + urban_rural, 
                family = binomial(link = "probit"), 
                data=dataset)
  probit$rse <- sqrt(diag(vcovHC(probit, type="HC1")))
  probit_pseudoR2 <- 1 - (probit$deviance) / (probit$null.deviance)
  probit_pseudoR2 <- round(probit_pseudoR2, 3)
  
  stargazer(logit, probit,
            se=list(logit$rse, probit$rse), 
            add.lines = list(c("Pseudo R-Squared", logit_pseudoR2, probit_pseudoR2)),
            type = "text", 
            title=title,
            omit.stat=c("adj.rsq","f"),
            single.row = TRUE)
  
}

## Tx Utilization x Insurance

tx_insurance <- function(dataset, title) {
  
  logit <- glm(tx_util ~ insurance + 
                 age + military_service + sex + sexual_identity + 
                 marital_status + education + race_ethnic + HEALTH + 
                 emp_status + gov_asst + INCOME + urban_rural, 
               family = binomial(link = "logit"), 
               data=dataset)
  logit$rse <- sqrt(diag(vcovHC(logit, type="HC1")))
  logit_pseudoR2 <- 1 - (logit$deviance) / (logit$null.deviance)
  logit_pseudoR2 <- round(logit_pseudoR2, 3)
  
  probit <- glm(tx_util ~ insurance + 
                  age + military_service + sex + sexual_identity + 
                  marital_status + education + race_ethnic + HEALTH + 
                  emp_status + gov_asst + INCOME + urban_rural, 
                family = binomial(link = "probit"), 
                data=dataset)
  probit$rse <- sqrt(diag(vcovHC(probit, type="HC1")))
  probit_pseudoR2 <- 1 - (probit$deviance) / (probit$null.deviance)
  probit_pseudoR2 <- round(probit_pseudoR2, 3)
  
  stargazer(logit, probit,
            se=list(logit$rse, probit$rse), 
            add.lines = list(c("Pseudo R-Squared", logit_pseudoR2, probit_pseudoR2)),
            type = "text", 
            title=title,
            omit.stat=c("adj.rsq","f"),
            single.row = TRUE)
  
}


# Analysis

## Unmet MH Need by Insurance Type including NONE
unmet_instype(data_instype_known, 
             'Unmet MH Need by Insurance Type including NONE')


## Unmet MH Need by Insurance Type PRIVATE vs. PUBLIC
unmet_instype(data_instype_priv_pub, 
              'Unmet MH Need by Insurance Type PRIVATE vs. PUBLIC')


## Unmet MH Need by Insurance including NONE
unmet_insurance(data_ins_known, 
              'Unmet MH Need by Insurance including NONE')


## Unmet MH Need by Insurance
unmet_insurance(data_has_ins, 
              'Unmet MH Need by Insurance PRIVATE vs. PUBLIC')


## Tx Utilization by Insurance Type including NONE
tx_instype(data_instype_known,
           'Tx Utilization by Insurance Type including NONE')


## Tx Utilization by Insurance Type PRIVATE vs. PUBLIC
tx_instype(data_instype_priv_pub,
           'Tx Utilization by Insurance Type PRIVATE vs. PUBLIC')


## Tx Utilization by Insurance including NONE
tx_insurance(data_ins_known,
             'Tx Utilization by Insurance including NONE')


## Tx Utilization by Insurance
tx_insurance(data_has_ins,
             'Tx Utilization by Insurance')





