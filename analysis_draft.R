# Import libraries
library(stargazer)
library(tidyverse)
library(Hmisc)
library(car)
library(corrplot)
library(sandwich)
library(lmtest)
library(treemap)

# Import data
setwd("~/Documents/GitHub/capstone/data")
data <- read.csv("nsduh_2021_final.csv",
                 stringsAsFactors=TRUE)
data <- as.data.frame(data)

# Summary statistics
stargazer(data, type="text")
summary(data)

# Control variables - correlation matrix
controls <- select(data, AGE3, SERVICE, IRSEX, 
                     SEXIDENT, IRMARIT, EDUHIGHCAT, NEWRACE2, HEALTH, 
                     ENRLCOLLST2, IRWRKSTAT18, GOVTPROG, INCOME, PDEN10,
                     COUTYP4, AMHTXND2, AMHTXYR4)
summary(controls)
## dropping ENRLCOLLST2 from controls, mostly NAs
controls <- drop_na(controls)

controls_corr <- cor(controls, method = c("spearman"))
corrplot(controls_corr)
## PDEN10 and COUTYP4 highly correlated, PDEN10 removed from controls



# LOGISTIC REGRESSION 
## INSURANCE

probit_model <- glm(AMHTXND2 ~ insurance, family = binomial(link = "probit"), data=data)
probit_model$rse <- sqrt(diag(vcovHC(probit_model, type="HC1")))
probit_pseudoR2 <- 1 - (probit_model$deviance) / (probit_model$null.deviance)
probit_pseudoR2 <- round(probit_pseudoR2, 3)

logit_model <- glm(AMHTXND2 ~ insurance, family = binomial(link = "logit"), data=data)
logit_model$rse <- sqrt(diag(vcovHC(logit_model, type="HC1")))
logit_pseudoR2 <- 1 - (logit_model$deviance) / (logit_model$null.deviance)
logit_pseudoR2 <- round(logit_pseudoR2, 3)

stargazer(logit_model, probit_model,
          se=list(logit_model$rse, probit_model$rse), 
          add.lines = list(c("Pseudo R-Squared", logit_pseudoR2, probit_pseudoR2)),
          type = "text", 
          title="Logit & Probit models",
          omit.stat=c("adj.rsq","f"))

## INSURANCE TYPE
probit_model2 <- glm(AMHTXND2 ~ insurance_type, family = binomial(link = "probit"), data=data)
probit_model2$rse <- sqrt(diag(vcovHC(probit_model2, type="HC1")))
probit2_pseudoR2 <- 1 - (probit_model2$deviance) / (probit_model2$null.deviance)
probit2_pseudoR2 <- round(probit2_pseudoR2, 3)

logit_model2 <- glm(AMHTXND2 ~ insurance_type, family = binomial(link = "logit"), data=data)
logit_model2$rse <- sqrt(diag(vcovHC(logit_model2, type="HC1")))
logit2_pseudoR2 <- 1 - (logit_model2$deviance) / (logit_model2$null.deviance)
logit2_pseudoR2 <- round(logit2_pseudoR2, 3)

stargazer(logit_model2, probit_model2,
          se=list(logit_model2$rse, probit_model2$rse), 
          add.lines = list(c("Pseudo R-Squared", logit2_pseudoR2, probit2_pseudoR2)),
          type = "text", 
          title="Logit & Probit models",
          omit.stat=c("adj.rsq","f"))

### WITH CONTROLS
probit_model2m <- glm(AMHTXND2 ~ insurance_type + AGE3 + SERVICE + IRSEX + 
                       SEXIDENT + IRMARIT + EDUHIGHCAT + NEWRACE2 + HEALTH + 
                       ENRLCOLLST2 + IRWRKSTAT18 + GOVTPROG + INCOME +
                       COUTYP4, 
                     family = binomial(link = "probit"), data=data)
probit_model2m$rse <- sqrt(diag(vcovHC(probit_model2m, type="HC1")))
probit2m_pseudoR2 <- 1 - (probit_model2m$deviance) / (probit_model2m$null.deviance)
probit2m_pseudoR2 <- round(probit2m_pseudoR2, 3)

logit_model2m <- glm(AMHTXND2 ~ insurance_type + AGE3 + SERVICE + IRSEX + 
                      SEXIDENT + IRMARIT + EDUHIGHCAT + NEWRACE2 + HEALTH + 
                      ENRLCOLLST2 + IRWRKSTAT18 + GOVTPROG + INCOME +
                      COUTYP4, family = binomial(link = "logit"), data=data)
logit_model2m$rse <- sqrt(diag(vcovHC(logit_model2m, type="HC1")))
logit2m_pseudoR2 <- 1 - (logit_model2m$deviance) / (logit_model2m$null.deviance)
logit2m_pseudoR2 <- round(logit2m_pseudoR2, 3)

stargazer(logit_model2m, probit_model2m,
          se=list(logit_model2m$rse, probit_model2m$rse), 
          add.lines = list(c("Pseudo R-Squared", logit2m_pseudoR2, probit2m_pseudoR2)),
          type = "text", 
          title="Logit & Probit with controls",
          omit.stat=c("adj.rsq","f"))

## WITHOUT "UNKNOWN" CATEGORY

data_known <- filter(data, insurance_type != "unknown")

## INSURANCE

probit_modelk <- glm(AMHTXND2 ~ insurance, family = binomial(link = "probit"), data=data_known)
probit_modelk$rse <- sqrt(diag(vcovHC(probit_modelk, type="HC1")))
probitk_pseudoR2 <- 1 - (probit_modelk$deviance) / (probit_modelk$null.deviance)
probitk_pseudoR2 <- round(probitk_pseudoR2, 3)

logit_modelk <- glm(AMHTXND2 ~ insurance, family = binomial(link = "logit"), data=data_known)
logit_modelk$rse <- sqrt(diag(vcovHC(logit_modelk, type="HC1")))
logitk_pseudoR2 <- 1 - (logit_modelk$deviance) / (logit_modelk$null.deviance)
logitk_pseudoR2 <- round(logitk_pseudoR2, 3)

stargazer(logit_modelk, probit_modelk,
          se=list(logit_modelk$rse, probit_modelk$rse), 
          add.lines = list(c("Pseudo R-Squared", logitk_pseudoR2, probitk_pseudoR2)),
          type = "text", 
          title="Logit & Probit models with known ins only",
          omit.stat=c("adj.rsq","f"))

## INSURANCE TYPE
probit_modelk2 <- glm(AMHTXND2 ~ insurance_type, family = binomial(link = "probit"), 
                      data=data_known)
probit_modelk2$rse <- sqrt(diag(vcovHC(probit_modelk2, type="HC1")))
probitk2_pseudoR2 <- 1 - (probit_modelk2$deviance) / (probit_modelk2$null.deviance)
probitk2_pseudoR2 <- round(probitk2_pseudoR2, 3)

logit_modelk2 <- glm(AMHTXND2 ~ insurance_type, family = binomial(link = "logit"), 
                     data=data_known)
logit_modelk2$rse <- sqrt(diag(vcovHC(logit_modelk2, type="HC1")))
logitk2_pseudoR2 <- 1 - (logit_modelk2$deviance) / (logit_modelk2$null.deviance)
logitk2_pseudoR2 <- round(logitk2_pseudoR2, 3)

stargazer(logit_modelk2, probit_modelk2,
          se=list(logit_modelk2$rse, probit_modelk2$rse), 
          add.lines = list(c("Pseudo R-Squared", logitk2_pseudoR2, probitk2_pseudoR2)),
          type = "text", 
          title="Logit & Probit models with known ins type only",
          omit.stat=c("adj.rsq","f"))

### WITH CONTROLS
probit_modelk2m <- glm(AMHTXND2 ~ insurance_type + AGE3 + SERVICE + IRSEX + 
                        SEXIDENT + IRMARIT + EDUHIGHCAT + NEWRACE2 + HEALTH + 
                        ENRLCOLLST2 + IRWRKSTAT18 + GOVTPROG + INCOME +
                        COUTYP4, 
                      family = binomial(link = "probit"), data=data_known)
probit_modelk2m$rse <- sqrt(diag(vcovHC(probit_modelk2m, type="HC1")))
probitk2m_pseudoR2 <- 1 - (probit_modelk2m$deviance) / (probit_modelk2m$null.deviance)
probitk2m_pseudoR2 <- round(probitk2m_pseudoR2, 3)

logit_modelk2m <- glm(AMHTXND2 ~ insurance_type + AGE3 + SERVICE + IRSEX + 
                       SEXIDENT + IRMARIT + EDUHIGHCAT + NEWRACE2 + HEALTH + 
                       ENRLCOLLST2 + IRWRKSTAT18 + GOVTPROG + INCOME +
                       COUTYP4, family = binomial(link = "logit"), data=data_known)
logit_modelk2m$rse <- sqrt(diag(vcovHC(logit_modelk2m, type="HC1")))
logitk2m_pseudoR2 <- 1 - (logit_modelk2m$deviance) / (logit_modelk2m$null.deviance)
logitk2m_pseudoR2 <- round(logitk2m_pseudoR2, 3)

stargazer(logit_modelk2m, probit_modelk2m,
          se=list(logit_modelk2m$rse, probit_modelk2m$rse), 
          add.lines = list(c("Pseudo R-Squared", logitk2m_pseudoR2, probitk2m_pseudoR2)),
          type = "text", 
          title="Logit & Probit with controls and only known ins type",
          omit.stat=c("adj.rsq","f"))

## UTILIZATION VS INS TYPE W/O "UNKNOWN" CATEGORY

probitk3 <- glm(AMHTXYR4 ~ insurance_type, family = binomial(link = "probit"), 
                      data=data_known)
probitk3$rse <- sqrt(diag(vcovHC(probitk3, type="HC1")))
probitk3_pseudoR2 <- 1 - (probitk3$deviance) / (probitk3$null.deviance)
probitk3_pseudoR2 <- round(probitk3_pseudoR2, 3)

logitk3 <- glm(AMHTXYR4 ~ insurance_type, family = binomial(link = "logit"), 
                     data=data_known)
logitk3$rse <- sqrt(diag(vcovHC(logitk3, type="HC1")))
logitk3_pseudoR2 <- 1 - (logitk3$deviance) / (logitk3$null.deviance)
logitk3_pseudoR2 <- round(logitk3_pseudoR2, 3)

stargazer(logitk3, probitk3,
          se=list(logitk3$rse, probitk3$rse), 
          add.lines = list(c("Pseudo R-Squared", logitk3_pseudoR2, probitk3_pseudoR2)),
          type = "text", 
          title="Logit & Probit models, treatment utilization with known ins type only",
          omit.stat=c("adj.rsq","f"))




# VISUALIZATIONS

## SUMMARY: insurance/ins type
# tree map: https://r-graph-gallery.com/treemap.html

treemap_data <- data
treemap_data$insurance <- fct_recode(data$insurance, 'employer' = 'private/employer')
insurance_type <- c('public', 'public', 'public', 'none', 'unknown', 'private', 'private', 'unknown')
count <- dplyr::count(treemap_data, insurance)
treemap_data <- data.frame(insurance_type, count)

treemap(treemap_data,
        index=c("insurance_type","insurance"),
        vSize="n",
        type="index",
        title="Health Insurance Types/Sources",
        align.labels=list(c('center', 'center'), c('right', 'bottom')),
        mirror.x=FALSE,
        mirror.y=TRUE,
        aspRatio=1,
        fontcolor.labels = 'black')


## RELATIONSHIP: insurance/insurance_type & type of MH tx (or none)

barplot_data <- filter(data, !is.na(AMHTXND2))
barplot_data <- filter(barplot_data, !is.na(AMHSVTYP4))
barplot_data <- mutate(barplot_data, 
                       insurance_type = fct_relevel(insurance_type, 
                                                    'public', 'private',
                                                    'unknown', 'none'))
barplot_data <- filter(barplot_data, insurance_type != 'unknown')
barplot_data <- filter(barplot_data, !is.na(AMHTXYR4))


#ggplot(data, aes(fill=factor(AMHSVTYP4), x=insurance)) +
 # geom_bar(position='fill', stat='count')
#ggplot(data, aes(fill=factor(AMHSVTYP4), x=insurance_type)) +
# geom_bar(position='stack', stat='count')

treatment_type <- filter(barplot_data, AMHSVTYP4 != '8')

ggplot(treatment_type, aes(fill=factor(AMHSVTYP4), x=insurance_type)) +
 geom_bar(position='fill', stat='count')+
  labs(title="Mental Health Treatment by Insurance Type",
       x="Insurance Type",
       y="Percent")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_discrete(name="Treatment Type", 
                      labels=c('Inpatient only',
                               'Outpatient only',
                               'Prescription meds only',
                               'Inpatient & Outpatient',
                               'Inpatient & Medication',
                               'Outpatient & Medication',
                               'Inpatient, Outpatient, & Medication'))+ 
  theme(panel.grid.major.x = element_blank())

ggplot(barplot_data, aes(fill=factor(AMHTXYR4), x=insurance_type)) +
  geom_bar(position='fill', stat='count')+
  labs(title="Mental Health Treatment Utilization by Insurance Type",
       x="Insurance Type",
       y="Percent")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_discrete(name="Treatment Utilization", 
                      labels=c('No',
                               'Yes'),
                      guide = guide_legend(reverse=TRUE))+ 
  theme(panel.grid.major.x = element_blank())

## RELATIONSHIP: insurance/ins type & unmet MH need

#ggplot(data, aes(fill=factor(AMHTXND2), x=insurance)) +
 # geom_bar(position='fill', stat='count')


ggplot(barplot_data, aes(fill=factor(AMHTXND2), x=insurance_type)) +
  geom_bar(position='stack', stat='count')+
  labs(title="Unmet Mental Health Needs by Insurance Type",
       x="Insurance Type",
       y="Count (thousands)")+
  scale_y_continuous(labels=c('0', '5', '10', '15', '20', '25'))

ggplot(barplot_data, aes(fill=factor(AMHTXND2), x=insurance_type)) +
  geom_bar(position='fill', stat='count')+
  labs(title="Unmet Mental Health Needs by Insurance Type",
       x="Insurance Type",
       y="Percent")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_discrete(name="Unmet need", 
                      labels=c('No','Yes'), 
                      guide = guide_legend(reverse=TRUE))+
  theme(panel.grid.major.x = element_blank())
