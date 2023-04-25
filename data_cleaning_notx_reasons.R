library(tidyverse)

setwd("~/Documents/GitHub/capstone/data")
data <- read.csv("final-data-clean-reasons-notx.csv",
                 stringsAsFactors=TRUE)
data <- as.data.frame(data)


data$AUUNNBR <- as.factor(data$AUUNNBR)
data$AUUNNBR <- fct_collapse(data$AUUNNBR,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNNBR <- as.numeric(as.character(data$AUUNNBR))
data <- mutate(data, AUUNNBR = na_if(AUUNNBR, 3))


data$AUUNJOB <- as.factor(data$AUUNJOB)
data$AUUNJOB <- fct_collapse(data$AUUNJOB,
                             "1" = c("1", "3"), # Yes
                             "0" = "6", # No
                             "3" = c("85", "94", "97", "98", "99"))
data$AUUNJOB <- as.numeric(as.character(data$AUUNJOB))
data <- mutate(data, AUUNJOB = na_if(AUUNJOB, 3))



data$AUUNWHER <- as.factor(data$AUUNWHER)
data$AUUNWHER <- fct_collapse(data$AUUNWHER,
                             "1" = c("1", "3"), # Yes
                             "0" = "6", # No
                             "3" = c("85", "94", "97", "98", "99"))
data$AUUNWHER <- as.numeric(as.character(data$AUUNWHER))
data <- mutate(data, AUUNWHER = na_if(AUUNWHER, 3))





data$AUUNCFID <- as.factor(data$AUUNCFID)
data$AUUNCFID <- fct_collapse(data$AUUNCFID,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNCFID <- as.numeric(as.character(data$AUUNCFID))
data <- mutate(data, AUUNCFID = na_if(AUUNCFID, 3))





data$AUUNCMIT <- as.factor(data$AUUNCMIT)
data$AUUNCMIT <- fct_collapse(data$AUUNCMIT,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNCMIT <- as.numeric(as.character(data$AUUNCMIT))
data <- mutate(data, AUUNCMIT = na_if(AUUNCMIT, 3))




data$AUUNNOND <- as.factor(data$AUUNNOND)
data$AUUNNOND <- fct_collapse(data$AUUNNOND,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNNOND <- as.numeric(as.character(data$AUUNNOND))
data <- mutate(data, AUUNNOND = na_if(AUUNNOND, 3))




data$AUUNHNDL <- as.factor(data$AUUNHNDL)
data$AUUNHNDL <- fct_collapse(data$AUUNHNDL,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNHNDL <- as.numeric(as.character(data$AUUNHNDL))
data <- mutate(data, AUUNHNDL = na_if(AUUNHNDL, 3))



data$AUUNNHLP <- as.factor(data$AUUNNHLP)
data$AUUNNHLP <- fct_collapse(data$AUUNNHLP,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNNHLP <- as.numeric(as.character(data$AUUNNHLP))
data <- mutate(data, AUUNNHLP = na_if(AUUNNHLP, 3))


data$AUUNBUSY <- as.factor(data$AUUNBUSY)
data$AUUNBUSY <- fct_collapse(data$AUUNBUSY,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNBUSY <- as.numeric(as.character(data$AUUNBUSY))
data <- mutate(data, AUUNBUSY = na_if(AUUNBUSY, 3))



data$AUUNFOUT <- as.factor(data$AUUNFOUT)
data$AUUNFOUT <- fct_collapse(data$AUUNFOUT,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNFOUT <- as.numeric(as.character(data$AUUNFOUT))
data <- mutate(data, AUUNFOUT = na_if(AUUNFOUT, 3))



data$AUUNNTSP <- as.factor(data$AUUNNTSP)
data$AUUNNTSP <- fct_collapse(data$AUUNNTSP,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNNTSP <- as.numeric(as.character(data$AUUNNTSP))
data <- mutate(data, AUUNNTSP = na_if(AUUNNTSP, 3))



data$AUUNSOR <- as.factor(data$AUUNSOR)
data$AUUNSOR <- fct_collapse(data$AUUNSOR,
                              "1" = c("1", "3"), # Yes
                              "0" = "6", # No
                              "3" = c("85", "94", "97", "98", "99"))
data$AUUNSOR <- as.numeric(as.character(data$AUUNSOR))
data <- mutate(data, AUUNSOR = na_if(AUUNSOR, 3))



data$AUUNRIM2 <- as.factor(data$AUUNRIM2)
data$AUUNRIM2 <- fct_collapse(data$AUUNRIM2,
                             "3" = c("85", "94", "97", "98", "99"))
data$AUUNRIM2 <- as.numeric(as.character(data$AUUNRIM2))
data <- mutate(data, AUUNRIM2 = na_if(AUUNRIM2, 3))


write.csv(data, "super-final-data-clean-reasons-notx.csv", row.names = FALSE)
