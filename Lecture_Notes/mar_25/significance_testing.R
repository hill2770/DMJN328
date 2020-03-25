## ----read-in-data, eval=F--------------------------------------------------------------------------------
## ## This might take a few minutes!!
## 
load(url("https://github.com/sjkiss/DMJN328/raw/master/Lecture_Notes/mar_23/data/census_2016.rdata"))
## 


## ----select-variables------------------------------------------------------------------------------------
#Start with data frame and pipe
census_2016 %>% 
  #select the names of three variables and save to df
  select(CONDO, Wages, HDGREE)->df


## ----recode-degree, eval=T, echo=T-----------------------------------------------------------------------
#start with df and pipe
df %>% 
  #use mutate to make a new variable degree based on the conditions in case_when()
  mutate(degree=case_when(
    #when HDGREE is less than 9, make degree no degree
    HDGREE < 9 ~ "no degree",
    #when HDGREE is between 8 and 14, makd degree degree
    HDGREE > 8 & HDGREE<14 ~ "degree",
    # all other values of HDGREE are set to missing
    TRUE ~ NA_character_
    #save
  ))->  df
  




## ----recode-condo----------------------------------------------------------------------------------------
df %>% 
  mutate(CONDO=case_when(
    CONDO ==0 ~ "no condo",
    CONDO == 1 ~ "condo",
    TRUE ~ NA_character_
  ))->df


## ----show-averages---------------------------------------------------------------------------------------
#start with data frame
df %>% 
  #groupby degree
  group_by(degree) %>% 
  #summarize average
  summarize(avg=mean(Wages, na.rm=T))



## ----show-average-condo----------------------------------------------------------------------------------
#start with data frame
df %>% 
  #Group by CONDO 
  group_by(CONDO) %>% 
  #summarize the groups by calculating the wages
  summarize(avg=mean(Wages, na.rm=T))





## ----show-density-plots, echo=F--------------------------------------------------------------------------
out<-data.frame(t=rt(5000, df=156579))
out %>% 
  ggplot(., aes(x=t))+geom_histogram(aes(y=..density..), alpha=0.2)+scale_x_continuous(breaks=seq(-3,3,1))+theme_bw()+labs(title="The t-distribution", subtitle="with samples larger than ~30, looks almost exactly\nlike the normal distribution")



## ----run-t-test-degree-----------------------------------------------------------------------------------
t.test(Wages ~ degree, df)



## ----run-t-test-condo------------------------------------------------------------------------------------
t.test(Wages ~ CONDO, df)


