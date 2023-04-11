# Import libraries
library(stargazer)
library(tidyverse)
library(Hmisc)
library(car)
library(corrplot)
library(sandwich)
library(lmtest)
library(treemap)
library(RColorBrewer)

# Import data
setwd("~/Documents/GitHub/capstone/data")
data_all <- read.csv("nsduh_2021_final.csv",
                 stringsAsFactors=TRUE)
data_all <- as.data.frame(data_all)


data_subset <- read.csv('nsduh_2021_final_subset.csv',
                        stringsAsFactors=TRUE)
data_subset <- as.data.frame(data_subset)

dim(data_subset)


summary(data_all$insurance)
summary(data_all$insurance_type)
summary(as.factor(data_subset$unmet_need)) # 45879 total
summary(as.factor(data_subset$tx_util)) # 45899 total


## SUMMARY: insurance/ins type
# tree map: https://r-graph-gallery.com/treemap.html

treemap_data <- data_all
treemap_data$insurance <- fct_recode(data$insurance, 'employer' = 'private/employer')
insurance_type <- c('public', 'public', 'public', 'none', 'unknown', 'private', 'private', 'unknown')
count <- dplyr::count(treemap_data, insurance)
treemap_data <- data.frame(insurance_type, count)

treemap(treemap_data,
        index=c("insurance_type","insurance"),
        vSize="n",
        type="index",
        title="Figure 1: Health Insurance Types and Sources",
        align.labels=list(c('center', 'center'), c('right', 'bottom')),
        mirror.x=FALSE,
        mirror.y=TRUE,
        aspRatio=1,
        fontcolor.labels = 'black')


## RELATIONSHIP: insurance/insurance_type & type of MH tx (or none)

barplot_data <- filter(data_all, !is.na(AMHTXND2))
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

treatment_type$AMHSVTYP4 <- as.factor(treatment_type$AMHSVTYP4)
treatment_type$AMHSVTYP4 <- fct_recode(treatment_type$AMHSVTYP4,
                                 'Inpatient only' = '1',
                                 'Outpatient only' = '2',
                                 'Prescription meds only' = '3',
                                 'Inpatient & Outpatient' = '4',
                                 'Inpatient & Medication' = '5',
                                 'Outpatient & Medication' = '6',
                                 'Inpatient, Outpatient, & Medication' = '7')
treatment_type$AMHSVTYP4 <- fct_relevel(treatment_type$AMHSVTYP4,
                                        'Inpatient only',  
                                        'Prescription meds only',
                                        'Inpatient & Medication',
                                        'Outpatient & Medication',
                                        'Inpatient, Outpatient, & Medication',
                                        'Outpatient only',
                                        'Inpatient & Outpatient')

plotdata <- treatment_type %>%
  group_by(insurance_type, AMHSVTYP4) %>%
  dplyr::summarize(n = n()) %>% 
  mutate(pct = n/sum(n),
         lbl = round(pct*100))
#plotdata



ggplot(plotdata, aes(fill=AMHSVTYP4, x=insurance_type, y=pct)) +
  geom_bar(position='fill', stat='identity')+
  labs(title="Figure 5: Treatment Utilization by Service Type",
       x="Insurance Type",
       y="Percent",
       fill="Service Type")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_brewer(palette = 'Set3')+
 # scale_fill_manual(name="Treatment Type", 
  #                    labels=c('Inpatient only',
   #                            'Outpatient only',
    #                           'Prescription meds only',
     #                          'Inpatient & Outpatient',
      #                         'Inpatient & Medication',
       #                        'Outpatient & Medication',
        #                       'Inpatient, Outpatient, & Medication'),
         #           values=c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"))+ 
  geom_text(aes(label = paste0(lbl, '%')), 
            size = 3, 
            position = position_stack(vjust = 0.5)) +
  theme(panel.grid.major.x = element_blank())



ggplot(barplot_data, aes(fill=factor(AMHTXYR4), x=insurance_type)) +
  geom_bar(position='fill', stat='count')+
  labs(title="Figure 4: Mental Health Treatment Utilization by Insurance Type",
       x="Insurance Type",
       y="Percent")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_manual(name="Treatment Utilization", 
                      labels=c('No',
                               'Yes'),
                    values=c("#80B1D3", "#FDB462"))+ 
  theme(panel.grid.major.x = element_blank())




ggplot(barplot_data, aes(fill=factor(AMHTXYR4), x=insurance)) +
  geom_bar(position='fill', stat='count')+
  labs(title="Mental Health Treatment Utilization by Insurance",
       x="Insurance Type",
       y="Percent")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_manual(name="Treatment Utilization", 
                    labels=c('No',
                             'Yes'),
                    values=c("#676767", "#b6b6b6"))+ 
  theme(panel.grid.major.x = element_blank(),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))

## Brewer palette Set3
# "#8DD3C7" "#FFFFB3" "#BEBADA" "#FB8072" "#80B1D3" "#FDB462" "#B3DE69" "#FCCDE5"

## RELATIONSHIP: insurance/ins type & unmet MH need

#ggplot(data, aes(fill=factor(AMHTXND2), x=insurance)) +
# geom_bar(position='fill', stat='count')


#ggplot(barplot_data, aes(fill=factor(AMHTXND2), x=insurance_type)) +
 # geom_bar(position='stack', stat='count')+
  #labs(title="Unmet Mental Health Needs by Insurance Type",
   #    x="Insurance Type",
    #   y="Count (thousands)")+
#  scale_y_continuous(labels=c('0', '5', '10', '15', '20', '25'))

ggplot(barplot_data, aes(fill=factor(AMHTXND2), x=insurance_type)) +
  geom_bar(position='fill', stat='count')+
  labs(title="Figure 2: Unmet Mental Health Needs by Insurance Type",
       x="Insurance Type",
       y="Percent")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_manual(name="Unmet need", 
                      labels=c('No','Yes'), 
                      values=c("#80B1D3", "#FDB462"))+
  theme(panel.grid.major.x = element_blank())



ggplot(barplot_data, aes(fill=factor(AMHTXND2), x=insurance)) +
  geom_bar(position='fill', stat='count')+
  labs(title="Figure 3: Unmet Mental Health Needs by Insurance",
       x="Insurance Type",
       y="Percent")+
  scale_y_continuous(labels=c('0', '25', '50', '75', '100'))+
  scale_fill_manual(name="Unmet need", 
                    labels=c('No','Yes'), 
                    values=c("#80B1D3", "#FDB462"))+
  theme(panel.grid.major.x = element_blank())


unmet_needs <- barplot_data %>%
  group_by(insurance, AMHTXND2) %>%
  dplyr::summarize(n = n()) %>% 
  mutate(pct = n/sum(n),
         lbl = round(pct*100))
unmet_needs

## Logistic regression

# Data subsets

## INSURANCE TYPE, exclude "unknown"
data_instype_known <- subset(data_subset, insurance_type != 'unknown')


## INSURANCE TYPE, only private vs. public
data_instype_priv_pub <- subset(data_instype_known, insurance_type != 'none')
data_instype_priv_pub <- mutate(data_instype_priv_pub, 
                                insurance_type = ifelse(
                                  insurance_type == 'private', 0, 1))

## INSURANCE, exclude "unknown" or "other"
data_ins_known <- subset(data_subset, insurance != 'unknown')
data_ins_known <- subset(data_ins_known, insurance != 'other')


## INSURANCE, all except "unknown", "other" and "none"
data_has_ins <- subset(data_ins_known, insurance != 'none')



ggplot(data_instype_priv_pub, aes(x=unmet_need, y=insurance_type)) +
  geom_point(shape=1, position=position_jitter()) +
  stat_smooth(method='glm', method.args=list(family='binomial'), se=FALSE)

ggplot(data_instype_priv_pub, aes(x=tx_util, y=insurance_type)) +
  geom_point(shape=1, position=position_jitter()) +
  stat_smooth(method='glm', method.args=list(family='binomial'), se=FALSE)


## DESCRIPTIVE STATS TABLE: CONTROLS

control <- select(data_subset, age, military_service, sex, sexual_identity, 
                    marital_status, education, race_ethnic, HEALTH, 
                    emp_status, gov_asst, INCOME, urban_rural)

control$age <- as.factor(control$age)
control$age <- fct_collapse(control$age,
                           'Under 18' = c('1', '2', '3'),
                           '18 to 25' = c('4', '5', '6'),
                           '26 to 64' = c('7', '8', '9', '10'),
                           '65 and over' = '11')

control$military_service <- as.factor(control$military_service)

###############################################################################
###############################################################################

control$education <- as.factor(control$education)
control$education <- fct_collapse(control$education, 
                                 'No HS diploma' = c('1','2','3','4','5','6','7'),
                                 'HS diploma' = '8',
                                 'Some college/Assoc degree' = c('9','10'),
                                 'Bach degree or higher' = '11')

###############################################################################
###############################################################################

control$HEALTH <- as.factor(control$HEALTH)
control$HEALTH <- fct_recode(control$HEALTH,
                              'Excellent' = '1',
                              'Very Good' = '2',
                              'Good' = '3',
                              'Fair' = '4',
                              'Poor' = '5')

control$gov_asst <- as.factor(control$gov_asst)

control$INCOME <- as.factor(control$INCOME)
control$INCOME <- fct_recode(control$INCOME,
                              'Less than $20,000' = '1',
                              '$20,000 - $49,999' = '2',
                              '$50,000 - $74,999' = '3',
                              '$75,000 or more' = '4')

control$urban_rural <- as.factor(control$urban_rural)
control$urban_rural <- fct_recode(control$urban_rural,
                                   'Large Metro' = '1',
                                   'Small Metro' = '2',
                                   'Nonmetro' = '3')
