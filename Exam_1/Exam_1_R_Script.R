#I.**
  #Read the cleaned_covid_data.csv file into an R data frame. (20 pts)**
df <- list.files(path = "data", pattern = "cleaned_covid_data") 
df <- read.csv(df)

  # II.**
 # **Subset the data set to just show states that begin with "A" and save this as an object called A_states. (20 pts)**
library(tidyverse) 
A_States <- df[substr(df$Province_State,1,1)=="A",]
A_States <- na.omit(A_States)

#+ Use the *tidyverse* suite of packages
#+ #+ Selecting rows where the state starts with "A" is tricky (you can use the grepl() function or just a vector of those states if you prefer)

#III.**
 # **Create a plot _of that subset_ showing Deaths over time, with a separate facet for each state. (20 pts)**
A_States$Last_Update<-as.Date((A_States$Last_Update))
class(A_States$Last_Update)
 library(ggplot2)

ggplot(data = A_States, mapping = aes(x=Deaths, y = Last_Update))+
  geom_point()+
facet_wrap("Province_State", scale = "free")+
  geom_smooth(method = "loess", se = FALSE, color = "red")
# + Create a scatterplot
  #+ Add loess curves WITHOUT standard error shading
#+ Keep scales "free" in each facet

#IV.** (Back to the full dataset)
#Find the "peak" of Case_Fatality_Ratio for each state and save this as a new data frame object called state_max_fatality_rate. (20 pts)**
  library(dplyr)
 State_Max_Fatality_Rate <-  df%>%
   group_by(Province_State)%>%
   filter(Case_Fatality_Ratio == max(Case_Fatality_Ratio, na.rm = TRUE))%>%
   ungroup()
 State_Max_Fatality_Rate <- State_Max_Fatality_Rate[State_Max_Fatality_Rate$Case_Fatality_Ratio==
           ave(State_Max_Fatality_Rate$Case_Fatality_Ratio, State_Max_Fatality_Rate$Province_State, FUN = max),]
 
 State_Max_Fatality_Rate <- aggregate(Case_Fatality_Ratio ~ 
                            Province_State, data = State_Max_Fatality_Rate, FUN = max)
 
 State_Max_Fatality_Rate <- State_Max_Fatality_Rate%>%
   rename( Maximum_Fatality_Ratio = Case_Fatality_Ratio)

      
 # I'm looking for a new data frame with 2 columns:

# + "Province_State"
 #+ "Maximum_Fatality_Ratio"
 #+ Arrange the new data frame in descending order by Maximum_Fatality_Ratio
  State_Max_Fatality_Rate <- State_Max_Fatality_Rate%>%
    arrange(desc(State_Max_Fatality_Rate$Maximum_Fatality_Ratio))
 
#This might take a few steps. Be careful about how you deal with missing values!


#V.**
#**Use that new data frame from task IV to create another plot. (20 pts)**
State_Max_Fatality_Rate$Province_State <- factor(State_Max_Fatality_Rate$Province_State,
     levels = State_Max_Fatality_Rate$Province_State[order(State_Max_Fatality_Rate$Maximum_Fatality_Ratio,
                                                        decreasing = TRUE  )])
library(ggplot2)
ggplot(data = State_Max_Fatality_Rate, mapping = aes(x=Province_State, 
                                        y= Maximum_Fatality_Ratio))+
  geom_col()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
  

# geom_bar()# + X-axis is Province_State
# + Y-axis is Maximum_Fatality_Ratio
 #+ bar plot
 #+ x-axis arranged in descending order, just like the data frame (make it a factor to accomplish this)
# + X-axis labels turned to 90 deg to be readable
 
#Even with this partial data set (not current), you should be able to see that (within these dates), different states had very different fatality ratios.

#VI.** (BONUS 10 pts)
#Using the FULL data set, plot cumulative deaths for the entire US over time
Cum_data <- df%>%
  mutate(cumulative_deaths = cumsum(Deaths))
Cum_data <- Cum_data%>%
  group_by(Last_Update)%>%
           summarize(cumulative_deaths= sum(Deaths))

library(ggplot2)
ggplot(data = Cum_data, mapping = aes( x= Last_Update, y= cumulative_deaths))+
  geom_point()
 #+ You'll need to read ahead a bit and use the dplyr package functions group_by() and summarize() to accomplish this.


