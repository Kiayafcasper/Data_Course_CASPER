# STATS:
# T test = compaes mean values of two groups
    # are they the "same" 
# null hypoth = hypoth against "height does not foollow normal dist"
# alternative hypoth = "height does follo dist
# p value =  "measure of surprise" random chance hypoth is wrong
  # area under ditribution curve of possible distrubution results
# set up to test alternative hypoth
# r very good P-value = 1x10^-16
# Fail to reect the alternative hypoth
# Coorelation:
  # x effects y
  # y = mx + b Linear model lm
# every model is wrong, but can be useful
# RMSE = standard error of model squared- on averag, how often is the model off?
  # shows how accurate the model is.
library(tidyverse)
install.packages("easystats")
library(easystats)
iris
# how to still pipe: # predict sepal length based on species:
  mod1 <- iris %>%
    glm(data = .,
        formula = Sepal.Length~ Species)
  mod1 %>% summary()
# *** = very significant!
# WEIGHTS: previous knowledge can be used
# Use more fcators;
  # ADDATIVE: Independent variables used, without condsidering 
  mod2 <- iris %>%
    glm(data = .,
        formula = Sepal.Length~ Species + Sepal.Width)
   summary(mod2)
  #MULTIPLICIPLE: relationship of the independent values used
    # shows different means per species
  mod3 <- iris %>%
    glm(data = .,
        formula = Sepal.Length~ Species * Sepal.Width)
  mod3 %>% summary()
  
# compare models:
  compare_models(mod1, mod2, mod3) %>% plot()
  compare_performance(mod1, mod2, mod3) %>% plot()
  # PLOT 2 WINS! loook at area occupied