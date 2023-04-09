# Import libraries
library(tidyverse)

# Import data
setwd("~/Documents/GitHub/capstone/data")
data <- read.csv("nsduh_2021_subset_clean.csv")

# Independent variable: Insurance coverage
## MEDICARE - COVERED BY MEDICARE
## CAIDCHIP - COVERED BY MEDICAID/CHIP
## CHAMPUS - COV BY TRICARE, CHAMPUS, CHAMPVA, VA, MILITARY
## PRVHLTIN - COVERED BY PRIVATE INSURANCE
## GRPHLTIN - PRIVATE PLAN OFFERED THROUGH EMPLOYER OR UNION (subset of above)
## HLTINNOS - COVERED BY HEALTH INSUR (NOT OTHERWISE SPECIFIED)

data <- 
  mutate(data, insurance = case_when(
    MEDICARE == 1 ~ 'medicare',
    CAIDCHIP == 1 ~ 'medicaid',
    CHAMPUS == 1 ~ 'military',
    PRVHLTIN == 1 & GRPHLTIN == 0 ~ 'private/other',
    GRPHLTIN == 1 ~ 'private/employer',
    HLTINNOS == 1 ~ 'other',
    MEDICARE == 0 & CAIDCHIP == 0 & CHAMPUS == 0 & PRVHLTIN == 0 & HLTINNOS == 0 ~ 'none'
  ))

data$insurance <- as.factor(data$insurance)
data$insurance <- fct_explicit_na(data$insurance, na_level="unknown")

#unique(data$insurance)


data <- mutate(data, insurance_type = case_when(
  insurance == 'medicare' ~ 'public',
  insurance == 'medicaid' ~ 'public',
  insurance == 'military' ~ 'public',
  insurance == 'private/other' ~ 'private',
  insurance == 'private/employer' ~ 'private',
  insurance == 'none' ~ 'none',
  insurance == 'other' ~ 'unknown',
  insurance == 'unknown' ~ 'unknown'
))

data$insurance_type <- as.factor(data$insurance_type)

# Dependent variable: MH treatment
## AMHTXND2 - PERCEIVED UNMET NEED/DID NOT RCV MH TRT IN PST YR (binary)
## AMHSVTYP4 - TYPE OF MENTAL HEALTH TRT RCVD IN PST YR (includes none)



#write.csv(data, "nsduh_2021_final.csv", row.names = FALSE)
