library(easystats)
library(MASS)
library(tidyr)
library(tidyverse)
library(janitor)
library(caret)

#1-4:
dat <- read_csv("./Exams/Exam_2/unicef-u5mr.csv", show_col_types = FALSE) %>% clean_names()
dat <- pivot_longer(data = dat,cols = c(2:67),names_to = "time", values_to = "U5MR")
dat$time <- sub("u5mr_", "", dat$time)

ggplot(data = dat, mapping = aes( x = time, y = U5MR, group = country_name))+
  geom_line()+
  facet_wrap(~ continent, scales = "fixed", axis.labels = "all")+
  labs( x = "Year", y = " U5MR")+ 
  theme_minimal()+
  scale_x_discrete(breaks = seq(1960, 2020, by = 20))
  ggsave("./Exams/Exam_2/CASPER_Plot_1.png")
  
#5-6:
  dat_mean <- dat%>%
    group_by(continent, time)%>%
    summarize(mean_U5MR = mean(U5MR, na.rm = TRUE))
ggplot(data = dat_mean, mapping = aes(x = time, y = mean_U5MR,
      color = continent, group = continent))+
    geom_line()+
    theme_minimal()+
    scale_x_discrete(breaks = seq(1960, 2020, by = 20))
ggsave("./Exams/Exam_2/CASPER_Plot_2.png")

#7-9:
mod1 <- dat%>%
  glm(data = ., formula( U5MR ~ time))
summary(mod1)

mod2 <- dat%>%
  glm(data = ., formula( U5MR ~ time + continent))
summary(mod2)

mod3 <- dat%>%
  glm(data = ., formula( U5MR ~ time * continent))
summary(mod3)

compare_performance(mod1, mod2, mod3)
 # I would say mod3 is the best model becaause the 
  # AIC weights are higher than the other models and the RMSE is lower.

dat$mod1 <- predict(object = mod1, newdata = dat)
dat$mod2 <- predict(object = mod2, newdata = dat)
dat$mod3<- predict(object = mod3, newdata = dat)
dat <- pivot_longer(dat, cols = c(mod1,mod2,mod3), names_to = "model", 
             values_to = "predicted_U5MR")
ggplot(data = dat, mapping = aes( x = time, y = predicted_U5MR,
                  color = continent, group = country_name))+
  geom_line()+
  facet_wrap(~ model)+
  theme_minimal()+
  scale_x_discrete(breaks = seq(1960, 2020, by = 20))

# 10 - BONUS:
new_dat <- data.frame( time = "2020",
                       country_name = "Ecaudor",
                       continent = "Americas",
                       region = "South America")

mod4 <- glm(data = dat, formula = U5MR ~ .^2)
step <- stepAIC(object = mod4)
step$formula
mod5 <- glm(data = dat, formula = step$formula)
predict(object = mod5, newdata = new_dat))
