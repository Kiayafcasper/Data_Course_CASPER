library(tidyverse)
library(palmerpenguins)
library(janitor)
dats <- 
  penguins_raw %>%
  clean_names() 
# change name within columns to something else
names(dats) <- names(dats) %>% str_replace("culmen", "bill") 

# remove Egg_date intead put year:
#Change sex to lowercase
# change species to frst word
# change name order to same as clean penguins data
library(skimr)
skim(dat)
dat <- 
dats%>% select(species, bill_length_mm ,bill_depth_mm,body_mass_g,sex,island,date_egg, flipper_length_mm) %>%
  mutate(year = date_egg %>% year() %>% as.numeric()) %>%
  select(-date_egg)%>%
  mutate(sex = sex %>% str_to_lower() %>% factor(levels = c("male", "female")),
         species = species %>% str_split(" ") %>% map_chr(1))
dat%>%
  select(names(penguins))
  
identical(dat, penguins)

dat %>% map_chr(class)
penguins %>% map_chr(class)
 # change class to match penguin data;Change to integer
dat %>%
mutate(flipper_length_mm = flipper_length_mm %>% as.integer(),
        body_mass_g = body_mass_g %>% as.integer(),
        year = year %>% as.integer())
# change to factor:
dat$species %>%
  factor(levels = c("Adelie", "Chinstrap", "Gentoo"))
dat$island %>%
factor(levels = c("Biscoe","Dream", "Torgerson"))

identical(dat,penguins)
identical(names(dat), names(penguins))

#look at how simmilar they are:
skim(dat)
skim(penguins)
\
# split to words up by the space;
dat$species%>%
  str_split(" ")%>% 
  # thi can apply a function to everything in a list!
  # in thi scase we told it to make a lst and to keep the first charcter vector from the list
  map_chr(1)

#Get the date from date_egg:
library(lubridate)
dat$date_egg %>% year() 


