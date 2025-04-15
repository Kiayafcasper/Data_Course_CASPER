library(tidyverse)
library(janitor)
library(dplyr)
dat <- read_csv("BioLog_Plate_Data.csv", show_col_types = FALSE) %>%
clean_names()
dat <- dat %>% pivot_longer(cols = c(hr_24,hr_48,hr_144), names_to = "time", 
                     values_to = "absorbance")
dat <-  dat %>% data.frame(sample_id = c("Clear_Creek", "Waste_Water"))
dat$sample_id.1 <- gsub(pattern = "Clear_Creek", replacement = "Water",
                        dat$sample_id.1, ignore.case = TRUE)
dat$sample_id.1 <- gsub(pattern = "Waste_Water", replacement = "Water",
                        dat$sample_id.1, ignore.case = TRUE)

dat <-  dat %>% data.frame(sample_id = c("Soil_1", "Soil_2"))
dat$sample_id.2 <- gsub(pattern = "Soil_1", replacement = "Soil",
                        dat$sample_id.2, ignore.case = TRUE)
dat$sample_id.2 <- gsub(pattern = "Soil_2", replacement = "Soil",
                        dat$sample_id.2, ignore.case = TRUE)
dat <- pivot_longer(data = dat,cols = c(sample_id.2, sample_id.1), 
             names_to = "category", values_to = "type")
dat <- dat%>%
  select(- "category")
dat$time_hours <- as.numeric(gsub("hr_", "", dat$time))

ggplot( data = dat, mapping = aes( x = time_hours, y = absorbance, color = type))+
  geom_smooth()+
  facet_wrap(~ substrate)
  
         