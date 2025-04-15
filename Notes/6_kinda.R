library(tidyverse)
data("mtcars")
# am = transmission: 0 = auto, 1 = manual
dat <-  mtcars[mtcars$am < 1,]

write.csv(dat, "automatic_mtcars.csv", row.names= FALSE)

MPG_Horse<- ggplot(data = dat, mapping = aes( x = hp, y = mpg))+
  geom_point()+ 
  xlab("Gross Horse Power ") +
  ylab(" Miles Per US Gallon")+ 
  labs(title = "Horsepower vs. MPG of Automatic Transmission Vehicles")


 #saves this plot as a png image called “mpg_vs_hp_auto.png” 
# in your Assignment_5 directory
ggsave("mpg_vs_hp_auto.png")

# plots the effect of weight on miles-per-gallon 
# (with improved labels, again)

Weight_MPG <- ggplot(dat, mapping = aes( x = wt, y = mpg))+
  geom_point()+
  xlab( "Weight per 1000 lbs")+
  ylab("Miles per US Gallon")+
  labs(title = "Weight vs. MPG in Automatic Transmission Vehicles")

# saves this second plot as a tiff image called 
# “mpg_vs_wt_auto.tiff” in your Assignment_5 directory

ggsave("mpg_vs_wt_auto.tiff", plot = Weight_MPG, device = "ti )
        
        