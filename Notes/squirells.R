library(tidyverse)
Squir <- read.csv("Data/Squirrels.csv",na.strings = c("","NA"))
view(Squir)
Fsq <- filter(.data = Squir, !is.na(Primary.Fur.Color),
              !is.na(Highlight.Fur.Color),
              !is.na(Age),
              !is.na(Location))
library(ggplot2)
ggplot(data = Fsq, mapping = aes(x = X, y = Primary.Fur.Color))+
geom_col(aes(colour = Primary.Fur.Color))+
coord_radial()+
facet_wrap(~Shift)+
labs(title = "SqUIrelLS", x = "Longitude")+
theme_linedraw(base_rect_size = 2
               , base_family = "arial")
# make fots of axis bigger
  
  
  