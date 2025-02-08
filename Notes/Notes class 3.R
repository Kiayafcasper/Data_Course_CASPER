# SETUP ####
## load packages ####

library(tidyverse)
## load data ####
dat <- read_delim("./Data/DatasaurusDozen.tsv")
dat$dataset
# gives unique values in dataset- gets rid of repication
unique(dat$dataset)
#PRACTICE SUBSETTING!!
star <- dat[dat$dataset=="star",]
plot(star)
filter(dat,dataset =="star") # also used for subsetting

# pipe;
# %>% send to next line in code
# look at book in canvas. use worksheets to improve
