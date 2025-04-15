library(tidyverse)
library(janitor)

# cleaning with two data sets!
# steps:
  # Change "t" to 0
  # Only variables from dat2 match dat1
  # make columns name match
    # there's two different stations
  # full join

dat1 <- read.csv("./Data/Utah_County_Precip/provo_hourly_precip_1980-2014.csv") %>%
  clean_names()
dat2 <- read.csv("./Data/Utah_County_Precip/provo_hourly_precip_2014-2021.csv")%>%
  clean_names()

names(dat1)
names(dat2)

dat1$hpcp %>% unique()
dat2$hpcp %>% unique()
dat1$station %>% unique()
dat2$station%>% unique()

dat2$station_name <-  "South Jordan"
dat1$station_name <- "Provo"
  #clean hcpc:
dat2$hpcp <- dat2$hourly_precipitation
dat2$hpcp %>% class()
dat2$hpcp[dat2$hpcp == "T"] <- 0 %>% as.numeric()
dat2$hpcp%>% as.numeric()
dat1$hpcp[dat1$hpcp =="T"] <- 0 %>% as.numeric()
as.numeric(dat1$hpcp)
#clean measurment data:
dat1$hpcp[dat1$hpcp == 999.99] <- NA
#change dates to proper format:
dat2$date %>% as.POSIXlt()
dat <- dat2%>%
  mutate(station = station %>% as.character()) %>%
  select(names(dat1)) %>%
full_join(dat1)
