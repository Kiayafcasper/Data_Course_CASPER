file <- download.file("https://gzahn.github.io/data-course/Repository/Assignments/Assignment_3/Assignment_3.R", destfile= "Assignmnet_3.R")
?download.file
getwd()
vector1 <- c(1,2,3,4,5,6,7,8,9,10)
vector2 <- c(5,6,7,8,4,3,2,1,3,10)
vector3 <- letters
#add 5to each element in vector:
vector1+5 # 5 is also a vector!
vector2/2
vector3 +1 # can't do this. can't add 1 to letters
vector1 * c(1,3,5) # can't do becuase mltiples can go together
# be careful! they will be multipliedrandomly

#T/F questions:
#>
#>=
#<=
#!=
#%in% is someithing in somthing?
vector1 %in% 1:6
#! invert tru/false :
!(vector1 %in% 1:6)

#iris
data("iris")
# duplicating iris:
dat <- iris
names(dat)
dim(dat) #rows and colums)
head(dat)
dat$Species
class(dat$Species)
# factor: levels of experimental fators
dat[1,1]
letters[c(1,3,5)]
plot(x=dat$Petal.Length, y=dat$Sepal.Length)
plot(x=dat$Species, y=dat$Sepal.Length)
# makes boxplot because of factors

class(dat$Petal.Length)
str(dat) # structure
nums <- c(1,2, 3, 6, 7, 8, 9, 12)
nums_factor <- as.factor(nums)
nums_factor +1
nums +1
# doesn't work, cant add number to categoracal data
# even thogh "nums" is numbers, it is now a category

as.character(vector1) # make character
as.numeric(vector3) # mak enumeric

# how to make letters numbers:
letters
1:length(letters)
plot(nums)
plot(nums_factor)
# plot will choose plot based on data given
range(vector1,NA) na.rm= TRUE
# when in doubt comma ten tab! It will give you options
dbinom(50,100,0.5) #binomial sucess- probabilty last numer = % likely
# give me random numbers:
rnorm(10, 10,1)
plot(rnorm(10,10,1))
hist(rnorm(10000000,10,1))


library(tidyverse)
