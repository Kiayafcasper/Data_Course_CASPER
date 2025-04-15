library(MASS)
library(tidyverse)
install.packages("caret")
library(caret)
# make 2 vectors of random numbers drawn from normal/gaussian distribution
  #(N, mean)
x <- rnorm(100,100) # 100 numbers, mean of 100
y <- rnorm(100,99.9) # 100 numbers, mean of 99.9
t.test(x,y) # do a t-test to see if means are statistically different
mean(x)
mean (y)
  # Null- the distributions are similar statistically
  # alternative- the two distributions are distinctly different
# plot distributions
data.frame(x,y) %>%
  pivot_longer(everything()) %>% 
  ggplot(aes(x=value,fill=name)) +
  geom_density(alpha=.5)

# run a linear regression (instead of a t-test)
data.frame(x,y) %>%
  pivot_longer(everything()) %>% 
  glm(data=.,
      formula = value ~ name) %>% 
  summary()
# Binom can be used as eith , x, q, p , or n. 
# sample size is proportinal to "statistical power"
  # can detect smaller differences
# ust use glm! evyting uses regression!

#practice: make 3 models predicting body mass in (g)
library(palmerpenguins)
library(easystats)
penguins
penguins %>% glimpse()
mod1 <- 
  glm(data = penguins , formula  = body_mass_g ~ species)
mod2 <- 
  glm(data =  penguins, formula  = body_mass_g~ species + bill_depth_mm) 
mod3 <- 
  glm(data =penguins, formula  = body_mass_g~ species * sex)
  # saying "take into account that sex and speces may impact each other"

mod4 <- 
  glm(data = penguins , formula  = body_mass_g ~ .^2)

compare_models(mod1, mod2, mod3,mod4) %>% plot()
compare_performance(mod1, mod2, mod3, mod4) %>% plot()
# interaction = x:y

# StepAIC with mod 4 format is used to determine whcih model is best fit
step <- stepAIC(object = mod4)
step$formula
  # in this case im asking the best formula to determine body mass.
mod5 <- 
  glm(data = penguins, formula = step$formula)
compare_performance(mod1, mod2, mod3, mod4, mod5) %>% plot()
  #now mod5 is the best!
new_pen <- 
  data.frame(species = "Adelie", 
             island = "Torgersen",
             bill_length_mm= 20,
             bill_depth_mm = 20,
             flipper_length_mm = 500,
             sex = "female",
             year = 2007)
  predict(object = mod5, newdata = new_pen)
# predict model based on dataset mad of lol
  penguins$pred <- predict(mod5, penguins)
ggplot( data = penguins, aes( x = body_mass_g, y = pred))  +
  geom_point()+
  geom_smooth(method = "lm")
# how to test? Make model on parts of data, then test it using other
# part of data to see if its accurate.

# we need to split the data into two random chunks (cross-validation)
  # but what about categorical data? we need all parts of categorical data!
library(caret)
   #cross-validation. 
dat <-penguins[complete.cases(penguins),]
train_rows <- createDataPartition(y = dat$body_mass_g,p = .5)
train <- dat[train_rows$Resample1,]
test <- dat[-train_rows$Resample1,]

mod_xval <- glm(data = train,
                formula = step$formula)
xval_preds <- predict(mod_xval, test)

test %>%
  mutate(xval_preds = xval_preds) %>%
ggplot(aes(x = body_mass_g, y = xval_preds))+
  geom_point()+
  geom_smooth('lm')

model_performance(mod_xval)  
model_performance(mod5)

check_model(mod_xval)
# this literally writes a report for you to copy and paste into a report.
report(mod_xval)
