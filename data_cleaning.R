# Libraries
library(tidyverse)
library(stargazer)
##  Hlavac, Marek (2018). stargazer: Well-Formatted Regression and Summary Statistics Tables.
##  R package version 5.2.2. https://CRAN.R-project.org/package=stargazer 

# Import data
setwd("~/Documents/JHU/capstone/data")
nsduh_2021_subset <- read_csv("nsduh-2021-subset.csv")

# Summary statistics
nsduh_2021_subset <- as.data.frame(nsduh_2021_subset)
#stargazer(nsduh_2021_subset, type="text")

#na_values <- c(85, 94, 97, 98, 99)

#for (i in 1:ncol(nsduh_2021_subset)) {
  
 # nsduh_2021_subset %>%
  #  mutate(i = ifelse(nsduh_2021_subset[,i] > 10, NA, nsduh_2021_subset[,i]))
  
#}

#nsduh_2021_new <- as.data.frame(nsduh_2021_new)
#stargazer(nsduh_2021_new, type="text")

################################################################################

nsduh_2021_subset$MEDICARE <- as.factor(nsduh_2021_subset$MEDICARE)
nsduh_2021_subset$MEDICARE <- fct_collapse(nsduh_2021_subset$MEDICARE,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$MEDICARE <- as.numeric(as.character(nsduh_2021_subset$MEDICARE))
nsduh_2021_subset <- mutate(nsduh_2021_subset, MEDICARE = na_if(MEDICARE, 3))

################################################################################

nsduh_2021_subset$CAIDCHIP <- as.factor(nsduh_2021_subset$CAIDCHIP)
nsduh_2021_subset$CAIDCHIP <- fct_collapse(nsduh_2021_subset$CAIDCHIP,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$CAIDCHIP <- as.numeric(as.character(nsduh_2021_subset$CAIDCHIP))
nsduh_2021_subset <- mutate(nsduh_2021_subset, CAIDCHIP = na_if(CAIDCHIP, 3))

################################################################################

nsduh_2021_subset$CHAMPUS <- as.factor(nsduh_2021_subset$CHAMPUS)
nsduh_2021_subset$CHAMPUS <- fct_collapse(nsduh_2021_subset$CHAMPUS,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$CHAMPUS <- as.numeric(as.character(nsduh_2021_subset$CHAMPUS))
nsduh_2021_subset <- mutate(nsduh_2021_subset, CHAMPUS = na_if(CHAMPUS, 3))

################################################################################

nsduh_2021_subset$PRVHLTIN <- as.factor(nsduh_2021_subset$PRVHLTIN)
nsduh_2021_subset$PRVHLTIN <- fct_collapse(nsduh_2021_subset$PRVHLTIN,
                                          "1" = "1", # Yes
                                          "0" = "2", # No
                                          "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$PRVHLTIN <- as.numeric(as.character(nsduh_2021_subset$PRVHLTIN))
nsduh_2021_subset <- mutate(nsduh_2021_subset, PRVHLTIN = na_if(PRVHLTIN, 3))

################################################################################

nsduh_2021_subset$GRPHLTIN <- as.factor(nsduh_2021_subset$GRPHLTIN)
nsduh_2021_subset$GRPHLTIN <- fct_collapse(nsduh_2021_subset$GRPHLTIN,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$GRPHLTIN <- as.numeric(as.character(nsduh_2021_subset$GRPHLTIN))
nsduh_2021_subset <- mutate(nsduh_2021_subset, GRPHLTIN = na_if(GRPHLTIN, 3))

################################################################################

nsduh_2021_subset$HLTINALC <- as.factor(nsduh_2021_subset$HLTINALC)
nsduh_2021_subset$HLTINALC <- fct_collapse(nsduh_2021_subset$HLTINALC,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$HLTINALC <- as.numeric(as.character(nsduh_2021_subset$HLTINALC))
nsduh_2021_subset <- mutate(nsduh_2021_subset, HLTINALC = na_if(HLTINALC, 3))

################################################################################

nsduh_2021_subset$HLTINDRG <- as.factor(nsduh_2021_subset$HLTINDRG)
nsduh_2021_subset$HLTINDRG <- fct_collapse(nsduh_2021_subset$HLTINDRG,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$HLTINDRG <- as.numeric(as.character(nsduh_2021_subset$HLTINDRG))
nsduh_2021_subset <- mutate(nsduh_2021_subset, HLTINDRG = na_if(HLTINDRG, 3))

################################################################################

nsduh_2021_subset$HLTINMNT <- as.factor(nsduh_2021_subset$HLTINMNT)
nsduh_2021_subset$HLTINMNT <- fct_collapse(nsduh_2021_subset$HLTINMNT,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$HLTINMNT <- as.numeric(as.character(nsduh_2021_subset$HLTINMNT))
nsduh_2021_subset <- mutate(nsduh_2021_subset, HLTINMNT = na_if(HLTINMNT, 3))

################################################################################

nsduh_2021_subset$HLTINNOS <- as.factor(nsduh_2021_subset$HLTINNOS)
nsduh_2021_subset$HLTINNOS <- fct_collapse(nsduh_2021_subset$HLTINNOS,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$HLTINNOS <- as.numeric(as.character(nsduh_2021_subset$HLTINNOS))
nsduh_2021_subset <- mutate(nsduh_2021_subset, HLTINNOS = na_if(HLTINNOS, 3))

################################################################################

nsduh_2021_subset$AUUNMTYR <- as.factor(nsduh_2021_subset$AUUNMTYR)
nsduh_2021_subset$AUUNMTYR <- fct_collapse(nsduh_2021_subset$AUUNMTYR,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$AUUNMTYR <- as.numeric(as.character(nsduh_2021_subset$AUUNMTYR))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AUUNMTYR = na_if(AUUNMTYR, 3))

################################################################################

nsduh_2021_subset$AUUNCOST <- as.factor(nsduh_2021_subset$AUUNCOST)
nsduh_2021_subset$AUUNCOST <- fct_collapse(nsduh_2021_subset$AUUNCOST,
                                           "1" = c("1", "3"), # Yes
                                           "0" = "6", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$AUUNCOST <- as.numeric(as.character(nsduh_2021_subset$AUUNCOST))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AUUNCOST = na_if(AUUNCOST, 3))

################################################################################

nsduh_2021_subset$AUUNNCOV <- as.factor(nsduh_2021_subset$AUUNNCOV)
nsduh_2021_subset$AUUNNCOV <- fct_collapse(nsduh_2021_subset$AUUNNCOV,
                                           "1" = "1", # Yes
                                           "0" = "6", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$AUUNNCOV <- as.numeric(as.character(nsduh_2021_subset$AUUNNCOV))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AUUNNCOV = na_if(AUUNNCOV, 3))

################################################################################

nsduh_2021_subset$AUUNENUF <- as.factor(nsduh_2021_subset$AUUNENUF)
nsduh_2021_subset$AUUNENUF <- fct_collapse(nsduh_2021_subset$AUUNENUF,
                                           "1" = "1", # Yes
                                           "0" = "6", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$AUUNENUF <- as.numeric(as.character(nsduh_2021_subset$AUUNENUF))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AUUNENUF = na_if(AUUNENUF, 3))

################################################################################

nsduh_2021_subset$SERVICE <- as.factor(nsduh_2021_subset$SERVICE)
nsduh_2021_subset$SERVICE <- fct_collapse(nsduh_2021_subset$SERVICE,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$SERVICE <- as.numeric(as.character(nsduh_2021_subset$SERVICE))
nsduh_2021_subset <- mutate(nsduh_2021_subset, SERVICE = na_if(SERVICE, 3))

################################################################################

nsduh_2021_subset$GOVTPROG <- as.factor(nsduh_2021_subset$GOVTPROG)
nsduh_2021_subset$GOVTPROG <- fct_collapse(nsduh_2021_subset$GOVTPROG,
                                          "1" = "1", # Yes
                                          "0" = "2") # No
nsduh_2021_subset$GOVTPROG <- as.numeric(as.character(nsduh_2021_subset$GOVTPROG))
nsduh_2021_subset <- mutate(nsduh_2021_subset, GOVTPROG = na_if(GOVTPROG, 3))

################################################################################

nsduh_2021_subset$AMHINP2 <- as.factor(nsduh_2021_subset$AMHINP2)
nsduh_2021_subset$AMHINP2 <- fct_collapse(nsduh_2021_subset$AMHINP2,
                                          "1" = "1", # Yes
                                          "0" = "2", # No
                                          "3" = ".")
nsduh_2021_subset$AMHINP2 <- as.numeric(as.character(nsduh_2021_subset$AMHINP2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AMHINP2 = na_if(AMHINP2, 3))

################################################################################

nsduh_2021_subset$AMHOUTP4 <- as.factor(nsduh_2021_subset$AMHOUTP4)
nsduh_2021_subset$AMHOUTP4 <- fct_collapse(nsduh_2021_subset$AMHOUTP4,
                                          "1" = "1", # Yes
                                          "0" = "2", # No
                                          "3" = ".")
nsduh_2021_subset$AMHOUTP4 <- as.numeric(as.character(nsduh_2021_subset$AMHOUTP4))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AMHOUTP4 = na_if(AMHOUTP4, 3))

################################################################################

nsduh_2021_subset$AMHRX2 <- as.factor(nsduh_2021_subset$AMHRX2)
nsduh_2021_subset$AMHRX2 <- fct_collapse(nsduh_2021_subset$AMHRX2,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = ".")
nsduh_2021_subset$AMHRX2 <- as.numeric(as.character(nsduh_2021_subset$AMHRX2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AMHRX2 = na_if(AMHRX2, 3))

################################################################################

nsduh_2021_subset$AMHTXRC4 <- as.factor(nsduh_2021_subset$AMHTXRC4)
nsduh_2021_subset$AMHTXRC4 <- fct_collapse(nsduh_2021_subset$AMHTXRC4,
                                         "1" = "1", # Yes
                                         "0" = "2", # No
                                         "3" = ".")
nsduh_2021_subset$AMHTXRC4 <- as.numeric(as.character(nsduh_2021_subset$AMHTXRC4))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AMHTXRC4 = na_if(AMHTXRC4, 3))

################################################################################

#nsduh_2021_subset$AUMHTELYR2 <- as.factor(nsduh_2021_subset$AUMHTELYR2)
#nsduh_2021_subset$AUMHTELYR2 <- fct_collapse(nsduh_2021_subset$AUMHTELYR2,
 #                                          "1" = "1", # Yes
  #                                         "0" = "0", # No
   #                                        "3" = ".")
#nsduh_2021_subset$AUMHTELYR2 <- as.numeric(nsduh_2021_subset$AUMHTELYR2)
#nsduh_2021_subset <- mutate(nsduh_2021_subset, AUMHTELYR2 = na_if(AUMHTELYR2, 3))

################################################################################

nsduh_2021_subset$AMHTXYR4 <- as.factor(nsduh_2021_subset$AMHTXYR4)
nsduh_2021_subset$AMHTXYR4 <- fct_collapse(nsduh_2021_subset$AMHTXYR4,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = ".")
nsduh_2021_subset$AMHTXYR4 <- as.numeric(as.character(nsduh_2021_subset$AMHTXYR4))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AMHTXYR4 = na_if(AMHTXYR4, 3))

################################################################################

nsduh_2021_subset$AMHTXND2 <- as.factor(nsduh_2021_subset$AMHTXND2)
nsduh_2021_subset$AMHTXND2 <- fct_collapse(nsduh_2021_subset$AMHTXND2,
                                           "1" = "1", # Yes
                                           "0" = "2", # No
                                           "3" = ".")
nsduh_2021_subset$AMHTXND2 <- as.numeric(as.character(nsduh_2021_subset$AMHTXND2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, AMHTXND2 = na_if(AMHTXND2, 3))

################################################################################

#nsduh_2021_subset$AMHSVTYP4 <- as.factor(nsduh_2021_subset$AMHSVTYP4)
#nsduh_2021_subset$AMHSVTYP4 <- fct_collapse(nsduh_2021_subset$AMHSVTYP4,
 #                                           "Unknown" = ".", # Unknown
  #                                          "Inpatient" = "1", # Inpatient only
   #                                         "Outpatient" = "2", # Outpatient only
    #                                        "Medication" = "3", # Presc medication only
     #                                       "Inpt&Outpt" = "4", # Inpatient and outpatient only
      #                                      "Inpt&Med" = "5", # Inpatient and Presc Med Only
       #                                     "Outpt&Med" = "6", # Outpatient and Presc Med Only
        #                                    "Inpt&Outpt&Med" = "7", # Inp & Outp & Presc Medication
         #                                   "NoMHtx" = "8") # Did Not Receive Any of These MH Trt


################################################################################

# AGE3 is left unchanged for now
# SEXATRACT possibly not used so unchanged

################################################################################

nsduh_2021_subset$SEXIDENT <- as.factor(nsduh_2021_subset$SEXIDENT)
#nsduh_2021_subset$SEXIDENT <- fct_collapse(nsduh_2021_subset$SEXIDENT,
 #                                          "Heterosexual" = "1",
  #                                         "Lesbian/Gay" = "2",
   #                                        "Bisexual" = "3",
    #                                       "Unknown" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$SEXIDENT <- fct_collapse(nsduh_2021_subset$SEXIDENT,
                                           "1" = "1", # Hetero/straight
                                           "2" = "2", # Lesbian/gay
                                           "3" = "3", # Bisexual
                                           "99" = c("85", "94", "97", "98", "99"))
nsduh_2021_subset$SEXIDENT <- as.numeric(as.character(nsduh_2021_subset$SEXIDENT))
nsduh_2021_subset <- mutate(nsduh_2021_subset, SEXIDENT = na_if(SEXIDENT, 99))

################################################################################

nsduh_2021_subset$SPEAKENGL <- as.factor(nsduh_2021_subset$SPEAKENGL)
nsduh_2021_subset$SPEAKENGL <- fct_collapse(nsduh_2021_subset$SPEAKENGL,
                                           "3" = "1", # very well
                                           "2" = "2", # well
                                           "1" = "3", # not well
                                           "0" = "4", # not at all
                                           "99" = c("85", "94", "97", "98"))
nsduh_2021_subset$SPEAKENGL <- as.numeric(as.character(nsduh_2021_subset$SPEAKENGL))
nsduh_2021_subset <- mutate(nsduh_2021_subset, SPEAKENGL = na_if(SPEAKENGL, 99))

################################################################################

nsduh_2021_subset$LVLDIFSEE2 <- as.factor(nsduh_2021_subset$LVLDIFSEE2)
nsduh_2021_subset$LVLDIFSEE2 <- fct_collapse(nsduh_2021_subset$LVLDIFSEE2,
                                            "0" = "1", # no difficulty
                                            "1" = "2", # some difficulty
                                            "2" = "3", # A lot of difficulty or cannot do at all
                                            "99" = c("85", "94", "97", "98"))
nsduh_2021_subset$LVLDIFSEE2 <- as.numeric(as.character(nsduh_2021_subset$LVLDIFSEE2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, LVLDIFSEE2 = na_if(LVLDIFSEE2, 99))

################################################################################

nsduh_2021_subset$LVLDIFHEAR2 <- as.factor(nsduh_2021_subset$LVLDIFHEAR2)
nsduh_2021_subset$LVLDIFHEAR2 <- fct_collapse(nsduh_2021_subset$LVLDIFHEAR2,
                                             "0" = "1", # no difficulty
                                             "1" = "2", # some difficulty
                                             "2" = "3", # A lot of difficulty or cannot do at all
                                             "99" = c("85", "94", "97", "98"))
nsduh_2021_subset$LVLDIFHEAR2 <- as.numeric(as.character(nsduh_2021_subset$LVLDIFHEAR2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, LVLDIFHEAR2 = na_if(LVLDIFHEAR2, 99))

################################################################################

nsduh_2021_subset$LVLDIFWALK2 <- as.factor(nsduh_2021_subset$LVLDIFWALK2)
nsduh_2021_subset$LVLDIFWALK2 <- fct_collapse(nsduh_2021_subset$LVLDIFWALK2,
                                              "0" = "1", # no difficulty
                                              "1" = "2", # some difficulty
                                              "2" = "3", # A lot of difficulty or cannot do at all
                                              "99" = c("85", "94", "97", "98"))
nsduh_2021_subset$LVLDIFWALK2 <- as.numeric(as.character(nsduh_2021_subset$LVLDIFWALK2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, LVLDIFWALK2 = na_if(LVLDIFWALK2, 99))

################################################################################

nsduh_2021_subset$LVLDIFMEM2 <- as.factor(nsduh_2021_subset$LVLDIFMEM2)
nsduh_2021_subset$LVLDIFMEM2 <- fct_collapse(nsduh_2021_subset$LVLDIFMEM2,
                                              "0" = "1", # no difficulty
                                              "1" = "2", # some difficulty
                                              "2" = "3", # A lot of difficulty or cannot do at all
                                              "99" = c("85", "94", "97", "98"))
nsduh_2021_subset$LVLDIFMEM2 <- as.numeric(as.character(nsduh_2021_subset$LVLDIFMEM2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, LVLDIFMEM2 = na_if(LVLDIFMEM2, 99))

################################################################################

nsduh_2021_subset$LVLDIFCARE2 <- as.factor(nsduh_2021_subset$LVLDIFCARE2)
nsduh_2021_subset$LVLDIFCARE2 <- fct_collapse(nsduh_2021_subset$LVLDIFCARE2,
                                             "0" = "1", # no difficulty
                                             "1" = "2", # some difficulty
                                             "2" = "3", # A lot of difficulty or cannot do at all
                                             "99" = c("85", "94", "97", "98"))
nsduh_2021_subset$LVLDIFCARE2 <- as.numeric(as.character(nsduh_2021_subset$LVLDIFCARE2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, LVLDIFCARE2 = na_if(LVLDIFCARE2, 99))

################################################################################

nsduh_2021_subset$LVLDIFCOMM2 <- as.factor(nsduh_2021_subset$LVLDIFCOMM2)
nsduh_2021_subset$LVLDIFCOMM2 <- fct_collapse(nsduh_2021_subset$LVLDIFCOMM2,
                                              "0" = "1", # no difficulty
                                              "1" = "2", # some difficulty
                                              "2" = "3", # A lot of difficulty or cannot do at all
                                              "99" = c("85", "94", "97", "98"))
nsduh_2021_subset$LVLDIFCOMM2 <- as.numeric(as.character(nsduh_2021_subset$LVLDIFCOMM2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, LVLDIFCOMM2 = na_if(LVLDIFCOMM2, 99))

################################################################################

# IRSEX unchanged for now, may change to factor
# unchanged: IREDUHIGHST2, INCOME, PDEN10, COUTYP4

################################################################################

nsduh_2021_subset$IRMARIT <- as.factor(nsduh_2021_subset$IRMARIT)
#nsduh_2021_subset$IRMARIT <- fct_collapse(nsduh_2021_subset$IRMARIT,
 #                                             "Married" = "1", 
  #                                            "Widowed" = "2", 
   #                                           "Divorced" = "3", 
    #                                      "Never been married" = "4", 
     #                                         "Resp. is a minor" = "99")
nsduh_2021_subset$IRMARIT <- fct_collapse(nsduh_2021_subset$IRMARIT,
                                          "1" = "1", # Married
                                          "2" = "2", # Widowed
                                          "3" = "3", # Divorced
                                          "4" = "4", # Never married
                                          "99" = "99") # Resp. is a minor
nsduh_2021_subset$IRMARIT <- as.numeric(as.character(nsduh_2021_subset$IRMARIT))
nsduh_2021_subset <- mutate(nsduh_2021_subset, IRMARIT = na_if(IRMARIT, 99))

################################################################################

nsduh_2021_subset$EDUHIGHCAT <- as.factor(nsduh_2021_subset$EDUHIGHCAT)
#nsduh_2021_subset$EDUHIGHCAT <- fct_collapse(nsduh_2021_subset$EDUHIGHCAT,
 #                                         "No HS diploma" = "1", 
  #                                        "HS diploma" = "2", 
   #                                       "Some college/Assoc degree" = "3", 
    #                                      "Bach degree or higher" = "4", 
     #                                     "Resp. is a minor" = "5")
nsduh_2021_subset$EDUHIGHCAT <- fct_collapse(nsduh_2021_subset$EDUHIGHCAT,
                                             "1" = "1", 
                                             "2" = "2", 
                                             "3" = "3", 
                                             "4" = "4", 
                                             "99" = "5")
nsduh_2021_subset$EDUHIGHCAT <- as.numeric(as.character(nsduh_2021_subset$EDUHIGHCAT))
nsduh_2021_subset <- mutate(nsduh_2021_subset, EDUHIGHCAT = na_if(EDUHIGHCAT, 99))

################################################################################

#nsduh_2021_subset$NEWRACE2 <- as.factor(nsduh_2021_subset$NEWRACE2)
#nsduh_2021_subset$NEWRACE2 <- fct_collapse(nsduh_2021_subset$NEWRACE2,
 #                                            "NonHispWhite" = "1", 
  #                                           "NonHispBlack" = "2", 
   #                                          "NonHispNativeAmAK" = "3", 
    #                                         "NonHispNativeHIPacIsl" = "4", 
     #                                      "NonHispAsian" = "5", 
      #                                     "NonHispMulti" = "6", 
       #                                      "Hispanic" = "7")

################################################################################

nsduh_2021_subset$HEALTH <- as.factor(nsduh_2021_subset$HEALTH)
nsduh_2021_subset$HEALTH <- fct_collapse(nsduh_2021_subset$HEALTH,
                                              "5" = "1", # Excellent
                                              "4" = "2", # Very good
                                              "3" = "3", # Good
                                              "2" = "4", # Fair
                                              "1" = "5", # Poor
                                              "99" = c("94", "97")) # Unknown
nsduh_2021_subset$HEALTH <- as.numeric(as.character(nsduh_2021_subset$HEALTH))
nsduh_2021_subset <- mutate(nsduh_2021_subset, HEALTH = na_if(HEALTH, 99))

################################################################################

nsduh_2021_subset$ENRLCOLLST2 <- as.factor(nsduh_2021_subset$ENRLCOLLST2)
#nsduh_2021_subset$ENRLCOLLST2 <- fct_collapse(nsduh_2021_subset$ENRLCOLLST2,
 #                                          "FullTime" = "1", 
  #                                         "PartTime" = "2", 
   #                                        "NotEnrolled" = "3", 
    #                                       "Other/Unknown" = c("4", "5"))
nsduh_2021_subset$ENRLCOLLST2 <- fct_collapse(nsduh_2021_subset$ENRLCOLLST2,
                                              "1" = "1", 
                                              "2" = "2", 
                                              "3" = "3", 
                                              "99" = c("4", "5"))
nsduh_2021_subset$ENRLCOLLST2 <- as.numeric(as.character(nsduh_2021_subset$ENRLCOLLST2))
nsduh_2021_subset <- mutate(nsduh_2021_subset, ENRLCOLLST2 = na_if(ENRLCOLLST2, 99))

################################################################################

nsduh_2021_subset$IRWRKSTAT18 <- as.factor(nsduh_2021_subset$IRWRKSTAT18)
#nsduh_2021_subset$IRWRKSTAT18 <- fct_collapse(nsduh_2021_subset$IRWRKSTAT18,
 #                                         "FullTime" = "1", 
  #                                        "PartTime" = "2", 
   #                                       "Unemployed" = "3", 
    #                                      "Other" = "4", 
     #                                     "Resp. is a minor" = "99")
nsduh_2021_subset$IRWRKSTAT18 <- fct_collapse(nsduh_2021_subset$IRWRKSTAT18,
                                              "1" = "1", 
                                              "2" = "2", 
                                              "3" = "3", 
                                              "4" = "4", 
                                              "99" = "99")
nsduh_2021_subset$IRWRKSTAT18 <- as.numeric(as.character(nsduh_2021_subset$IRWRKSTAT18))
nsduh_2021_subset <- mutate(nsduh_2021_subset, IRWRKSTAT18 = na_if(IRWRKSTAT18, 99))

################################################################################


summary(nsduh_2021_subset)

#write.csv(nsduh_2021_subset, "nsduh_2021_subset_clean.csv", row.names = FALSE)
