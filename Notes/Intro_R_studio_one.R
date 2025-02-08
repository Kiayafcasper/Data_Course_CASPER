<<<<<<< HEAD
".Data/Fake_grade_data.csv"
grades <- "./Data/Fake_grade_data.csv"
=======
read.csv("Fake_grades_data.csv"")
grades <- read.csv("./Data/Fake_grade_data.csv")
>>>>>>> c57341f (Assignment 3)
grades
read.csv(grades)
dat <- read.csv(grades)
class(dat)
class(grades)
names(dat)
class(names(dat))
nrow(dat)
class(ncol(dat))
dat[1,3:6]
dat[,16]
names(dat[16])
x <- names(dat)
#final project scores
dat[,16]
mean(dat[,16])
#[rows, columns]
mean(dat$Final_Project)
round(mean(dat$Final_Project))
dat$Skills_Test_1 + 1 
test-totals <- 
dat$Skills_Test_2 + dat$Skills_Test_1 + dat$Skills_Test_3 + dat$Skills_Test_4
dat$Test_totals <- test-totals
plot(dat$Test_totals, dat$Final_project)
<<<<<<< HEAD
mod <- lm(dat$Final_project~dat$Test_totals))
=======
mod <- lm(dat$Final_Project~dat$Test_totals)
>>>>>>> c57341f (Assignment 3)
summary(mod)
# guesses each person's final project grade based off their test totals
predict(mod,dat)
# add to data set:
dat$predictions <- prediction(mod,dat)
# reality:
plat(x=dat$predictions,y=dat$Final_Project)
#Difference between predictions and actual final
dat$difference <- dat$predictions- dat$Final_Project
plot(dat$difference)

<<<<<<< HEAD
# what are the assingmnet scores of each student?
=======
# what are the assignment scores of each student?
>>>>>>> c57341f (Assignment 3)
names(dat)
dat[,2:11]
assignmnts_sums <- rowSums(dat[,2:11])
plot(x=dat$assignmnts_sums, y= dat$Test_Totals)
#which student has the lowest assigmnet sum score?
min(dat$assignments_sums)
#who's the student?
#== is a question. Is this that? it will answer with true or false
loser <- 
dat[which(dat$assignmnet_sums==min(dat$assigmnet$sums)),1]
#DONT USE TRUE OR FALSE!!
dat$Final_Project >100
<<<<<<< HEAD
[dat$Final_Project >100,]
=======
dat$Final_Project >100
>>>>>>> c57341f (Assignment 3)
# %in%
x <- 1:10
x==3
x > 3 & x < 5


