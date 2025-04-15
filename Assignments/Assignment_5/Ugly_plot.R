library(tidyverse)
library(palmerpenguins)
filter(penguins, !is.na(sex), !is.na(bill_length_mm),
       !is.na(bill_depth_mm)) %>%
  ggplot(mapping = aes(x = year, 
         y = bill_length_mm, 
         color = species, ))+
  geom_col()+
  coord_polar(theta = "y")+
  facet_grid(~island, scales = "free")+
  theme(text = element_text(colour = "olivedrab2"), 
        axis.line.y = element_line(linewidth = 5),
        axis.text = element_text(color = "hotpink",size = 20),
        axis.line.x = element_line(linewidth = 5), 
        panel.background = element_rect(fill = "orange"),
        plot.background = element_rect(fill = "red"),
        strip.text = element_text(face = "bold",
                 colour = "orangered4",size = 10),
        strip.background = element_rect(fill = "purple"),
        plot.title = element_text(colour = "black", 
                        face = "bold", angle = 180))+
  labs(title = "PENGUINS", subtitle = "I'm sorry", 
       x = "Bill Length", y = "Year" )
  

    
                  
                  