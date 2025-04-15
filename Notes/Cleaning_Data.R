library(tidyverse)
dir.create("./figures")
p1 <- iris%>%
  ggplot(aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()
ggsave(p1,
       filename = "./figures/basic_plot.png",
       width= 6,
       height= 6)
#clean: 
  # every row is a single observation
  # every column is a single variable
  
iris%>%View
table1
 table2
table3 
table4a
table4b
  # table 4a and 4b are BIG No No's!! don't split variables 
  #into two columns!
  #wath out for time!! column is time
table5
  # aesthetics for mapping needs to be a column!
  #can look at R for data science for tidying data
  # this will teach you step by step how to clean data
table3
  #Need to slplit the slash into two columns
    # convert makes character into a numeric/integer
table3 %>%
  separate(rate, into = c("cases","population"), convert = TRUE)
table5 %>%
  separate(rate, into = c("cases",
              "population"), convert = TRUE) %>%
  mutate(year = paste0(century, year)) %>%
  select(-century)
    # One colmn with multiple variables
table2%>%
  pivot_wider(names_from = type, values_from = count)
tb4c <- 
table4a%>%
  pivot_longer(cols = c("1999","2000"), names_to = "year",
              values_to = "cases", names_transform = as.numeric)
 tb4d <-  
table4b %>%
  pivot_longer(cols = c("1999","2000"), names_to = "year",
               values_to = "population", names_transform = as.numeric)
full_join(tb4c, tb4d)
  # you can tell it what to join by with "by="
      # if not, it will add by what is common between the two.
  # inner join: finds what matches, throws out what doesn't
  # left join: left column is kept, whatever doesn't match it, gets thron out
  # right join: ^
  # full join: keeps everything
  # usually want to use Left join of Full join.


  # when entering dates in excel always have three columns year,
    # month, day, hours, minutes, seconds.


