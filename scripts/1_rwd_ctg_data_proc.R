###
#   RWD CTG example: data pre-processing
###
#   Author:
#   Max Westphal (max.westphal@mevis.fraunhofer.de)
###
#   Description:
#   This script preprocesses the data used for the CTG example.
#   Original data/credit: https://archive.ics.uci.edu/ml/datasets/cardiotocography.
#   The file "data/session2/ctg_raw.csv" was derived by saving the original file
#     https://archive.ics.uci.edu/ml/machine-learning-databases/00193/CTG.xls as csv from MS Excel.
###
#   Remark:
#   This needs only be executed for a reproduction of (pre-computation) results.
###


library(dplyr)


## load original data:
data <- readr::read_csv2("data_raw/ctg_raw.csv")

## remove 4 incomplete observations, everything else is complete
data <- data[- which(rowSums(is.na(data))>0), ]

data <- data %>%
  mutate(CLASS = factor(CLASS),
         NSP = factor(NSP)) %>%
  mutate(Date = (as.POSIXct(Date, format="%d.%m.%Y"))) %>%
  select(-c(FileName, SegFile, b, e)) %>%
  select(-c(A, B, C, D, E, AD, DE, LD, FS, SUSP)) %>%
  arrange(Date) %>%
  as.data.frame()

## EDA on endpoints
table(data$CLASS) # -> Class code (1 to 10) for classes A to SUSP
table(data$NSP)   # -> Normal=1; Suspect=2; Pathologic=3
table(data$CLASS, data$NSP)
colSums(is.na(data))

## Remove observations from 1980, as this is clearly separated from the remaining years (1995:1998):
table(substr(data$Date, 1, 4))
data <- data %>% filter(substr(data$Date, 1, 4) != "1980")
data <- data %>% mutate(Year = as.factor(substr(Date, 1, 4)) ) %>% select(-Date)






# Version 1: 3 class problem ------------------------------------------------------------------
## Goal: prediction of NSP, renamed to "status" (Normal=1; Suspect=2; Pathologic=3)
data_ctg3 <- data %>%
  mutate(status = dplyr::recode(NSP, "1"="normal", "2"="suspect", "3"="pathologic") %>% 
           factor(levels=c("normal", "suspect", "pathologic"))) %>% 
  select(-c(CLASS, NSP))
data_ctg3 %>% data.table::setcolorder(c("status", names(data_ctg3)[-ncol(data_ctg3)]))

## Serialize:
saveRDS(data_ctg3, "data/data_ctg3.rds")


# Version 2: binary problem -------------------------------------------------------------------
## Goal: prediction of NSP != 1, i.e. suspect or pathological (without CLASS as predictor)
data_ctg <- data_ctg3 %>% 
  mutate(status = case_match(status, c("suspect", "pathologic") ~ "suspect", "normal" ~ "normal"))
 
data_ctg$status %>% table()

## Serialize:
saveRDS(data_ctg, "data/data_ctg.rds")



## clean environment:
rm(list = ls())
