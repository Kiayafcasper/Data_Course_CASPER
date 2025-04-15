library(tidyverse)
install.packages("skimr")
library(skimr)
install.packages("janitor")
library(janitor)
dat <- read.csv("./Data/Bird_Measurements.csv") %>% clean_names()
view(dat)
  # gives overlook of all data components
skim(dat)
  #whats wrong?
    # columns with too many ariables
    # need sex column
    # get rid of _N columns
    # remove species # column
    # Remove mating system
# what if w made 3 new data frames: males, female, unsexed:
# clean names
# merge back togther
  
# remove everything ending in "_N"
newdat <- dat %>% select(-ends_with("_N"))

males <- newdat%>% select(family,egg_mass,clutch_size,species_name,english_name,family,
                          starts_with("m_")) %>%
  mutate(sex = "male")
names(males) <- names(males) %>% str_remove("^m_")

females <- newdat %>% select(family,egg_mass,clutch_size,species_name,english_name,family
                             starts_with("f")) %>%
  mutate(sex = "female")
  names(females) <-  names(females) %>% str_remove("^f_")

unknown <- newdat%>% select(family,egg_mass,clutch_size,species_name,english_name,family
                          starts_with("unsex_")) %>%
  mutate(sex = "unsexed")
names(unknown) <-  names(unknown) %>% str_remove("^un")

identical(names(males), names(females))
dat <-  males%>%
  full_join(females)%>%
  full_join(unknown)

ggplot(data = dat, aes(x= tarsus, y= mass, color = sex))+
  geom_point()+
   geom_smooth()
