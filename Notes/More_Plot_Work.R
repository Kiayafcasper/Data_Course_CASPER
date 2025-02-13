library(palmerpenguins)
library(tidyverse)
library(ggplot2)
p <- 
  filter(penguins, !is.na(sex)) %>%
  mutate(sex=sex %>% str_to_sentence())%>%
ggplot(mapping = aes( x = flipper_length_mm, 
        y= body_mass_g, colour = species))+
geom_point()+
stat_ellipse()+
facet_wrap(~sex)+
labs(x ="Flipper length (mm)", y=
     "Body mass (g)", color = "Species")+
theme_bw()
  
install.packages("GGally")  
library(GGally)
penguins %>%
GGally::ggpairs()
#whats is a package?
#tidyverse::
#install.packages("gganimate")
library(gganimate)
install.packages("gifski")
library(gifski)
#p+ gganimate::transition_states(species)+gganimate::ease_aes()

ggplot(penguins, mapping = aes(x = bill_length_mm, color = species))+
  geom_histogram()
  #geom_density()
