library(janitor)
library(tidyverse)
dat <-  read.csv("./Data/Utah_Religions_by_County.csv")

cldat <- clean_names(dat)
myorder <- cldat %>% 
  pivot_longer(-c(pop_2010, county,religious), names_to = "religion",
             values_to = "proportion")%>%
  group_by(religion)%>%
  summarise(sum=sum(proportion)) %>%
              arrange(desc(sum))%>%
  # change religio from character to a factor- levels= categories with data
  mutate(religion = factor(religion, levels = myorder$religion))%>%
            
ggplot(data = dat, mapping = aes(x = religion, y = proportion ))+
  geom_col()+ facet_wrap(~county)


# Make dataset based on what kind of plot you are wanting to make.
# Each column could be variable in your plot


# Reading form an excel sheet:
readxl::read_xlsx("./Data/Utah_Religions_by_County.xlsx", range = "B2:E4", 
                  col_names = FALSE)
# ordering levels within a factor:
c("hi", "med","low") %>%
  factor(levels = c("lo","med","hi"),ordered = TRUE)
# save R data as file to be used later:
  # saveRDS('.data/blahblahblah)

# access what you've written: source("./R/whatevr you saved") - have to be 
# saved in R projects