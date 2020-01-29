# On a mac, it'd look like this
#setwd("~/projects/learn-r-journalism")

# On a pc, it might look like this
#setwd("C:/Documents/learn-r-journalism")

10^2 + 26

a <- 4
a


a*5

a



a <- a + 10
a

rm(list=ls())


b=c(3,4,5)
b

(3+4+5)/3

mean(x=b)

mean(b)


# rnorm() is a base function that creates random samples from a random distribution

x <- rnorm(100)

# plot() is a base function that charts

plot(x)

# The line below won't work, it's just theoretical
source("script.R")

j <- c(1,2,NA)

max(j)

max(j, na.rm=T)
#means to remove the NAs from the data set

m <- "apples"
n <- m

date1 <- strptime(c("20100225230000", "20100226000000", "20100226010000"),
        format="%Y%m%d%H%M%S")
install.packages("lubridate")
library(lubridate)

date2 <- ymd_hms("20100225230000", "20100226000000", "20100226010000")

sample_df <- data.frame(id=c(1001,1002,1003,1004), name=c("Steve", "Pam", "Jim", "Dwight"), age=c(26, 65, 15, 7), race=c("White", "Black", "White", "Hispanic"))
sample_df$race <- factor(sample_df$race)
sample_df$id <- factor(sample_df$id)
sample_df$name <- as.character(sample_df$name)

str(sample_df)

first_number <- 10
second_number <- 8

(second_number-first_number)/first_number*100

percent_change <- function(first_number, second_number) {
  pc <- (second_number-first_number)/first_number*100
  return(pc)
}

percent_change(100,80)

percent_change("hundred", "eighty")


