## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(cache=T, echo=T, message=F, warning=F)



## ----read-in-data, cache=T----------------------------------------------------
load(url("https://github.com/sjkiss/DMJN328/raw/master/Lecture_Notes/mar_23/data/census_2016.rdata"))


## ----look-for-wages-----------------------------------------------------------
library(labelled)
look_for(census_2016, "wage")



## ----check-mean---------------------------------------------------------------
mean(census_2016$Wages, na.rm=T)


## ----graph-histogram----------------------------------------------------------
library(tidyverse)
census_2016 %>% 
  ggplot(., aes(x=Wages))+geom_histogram(bins=200)



## ----select-only-wages--------------------------------------------------------
census_2016 %>% 
  select(Wages)-> df








## ----print-n-10---------------------------------------------------------------
print(n10)








## ----print-n500, echo=T, results="markup"-------------------------------------
print(n500)


## ---- combine-data-frame, echo=F, eval=T,fig.width=6, fig.height=5------------
#combine into a data frame with four variables
data.frame(n5=n5$avg, n10=n10$avg, n100=n100$avg, n500=n500$avg) %>%
#gather them down into two variables called sample_size and average
  gather(sample_size, average) %>%
  #Change the order of the levels in the sample_size variable; this is strictly aesthetic 
  mutate(sample_size=fct_relevel(sample_size, "n5", "n10", "n100", "n500")) %>%
  #Show a histogram of all the averages for each sample size
  ggplot(., aes(x=average))+
  geom_histogram()+
  geom_vline(col="red", xintercept=mean(df$Wages))+
  facet_wrap(~sample_size)+theme_bw()



## ----sd5, echo=T--------------------------------------------------------------
#Take 1 sample of size 5 from df$Wages
sample_n(na.omit(df), 5) %>% 
  #summrize that sample calculating the averge wage, the standard deviation of the wages and how large the sample his
  summarize(avg=mean(Wages), sd=sd(Wages), n=n())-> sd5


## ----sd10, echo=T-------------------------------------------------------------
#Take 1 sample of size 10 from df$Wages
sample_n(na.omit(df), 10) %>% 
  #summrize that sample calculating the averge wage, the standard deviation of the wages and how large the sample his
  summarize(avg=mean(Wages), sd=sd(Wages), n=n())-> sd10


## ----one-sample-size-5, echo=T------------------------------------------------
#Take 1 sample of size 5 from df$Wages
sample_n(na.omit(df), 5) %>% 
  #summrize that sample calculating the averge wage, the standard deviation of the wages and how large the sample his
  summarize(avg=mean(Wages), sd=sd(Wages), n=n())-> sd5


## ----one-sample-size-10, echo=T-----------------------------------------------
#Take 1 sample of size 5 from df$Wages
sample_n(na.omit(df), 10) %>% 
  #summrize that sample calculating the averge wage, the standard deviation of the wages and how large the sample his
  summarize(avg=mean(Wages), sd=sd(Wages), n=n())-> sd10


## ----one-sample-size-100, echo=T----------------------------------------------
#Take 1 sample of size 5 from df$Wages
sample_n(na.omit(df), 100) %>% 
  #summrize that sample calculating the averge wage, the standard deviation of the wages and how large the sample his
  summarize(avg=mean(Wages), sd=sd(Wages), n=n())-> sd100


## ----one-sample-size-500, echo=T----------------------------------------------
#Take 1 sample of size 5 from df$Wages
sample_n(na.omit(df), 500) %>% 
  #summrize that sample calculating the averge wage, the standard deviation of the wages and how large the sample his
  summarize(avg=mean(Wages), sd=sd(Wages), n=n())-> sd500


## ----combine-into-data-frame--------------------------------------------------
#Combine all in one
#the bind_rows() function works when data frames have exactly the same variable names. 
combined<-bind_rows(sd5, sd10, sd100, sd500)
# Calculate the standard error
combined<-mutate(combined, se=sd/sqrt(n))


## ----graph-standard-error-sample-size, fig.width=5, fig.height=4--------------
ggplot(combined, aes(x=n, y=se))+
  geom_point(size=2)+
  geom_line()+
  theme_bw()+
  labs(title="The Relationship Between Sample Size\nand Standard Error")


## ---- echo=T------------------------------------------------------------------
print(combined)


