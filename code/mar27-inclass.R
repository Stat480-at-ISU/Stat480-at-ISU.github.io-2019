library(classdata)
dim(box)
dim(na.omit(box)) # don't use na.omit

#############################
library(lubridate)
str(mdy("3/27/2018"))

summary(mdy("3/27/2018"))

# some date calculus
mdy("3/27/2018")+1
mdy("3/27/2018")+5

today <- mdy("3/27/2018")
month(today)
?month

month(today, label=TRUE)
month(today, label=TRUE, abbr=FALSE)

wday(mdy("5/1/2014"), label=TRUE)
wday(mdy("1/1/0000"), label=TRUE)

yday(today)
mdy(today) # wrong converter - pick different one

#############################
mdy("4.2.1990")

now()

ymd_hms("2018-03-27 10:08:41 CDT")

now <- now()
now+1
now
now+600

now+years(5)

#########################
head(budget)
str(budget)
summary(budget$`Release Date`)
library(tidyverse)
budget %>% arrange(desc(`Release Date`)) %>%
  head()

budget %>% ggplot(aes(x = `Release Date`)) +
  geom_histogram(binwidth=365)

box <- box %>% left_join(budget, by="Movie")
head(box)

########################
data(nasa, package="GGally")

nasa %>% filter(id =="1-1") %>%
  ggplot(aes(x = time, y=temperature)) + 
  geom_point()

nasa %>% filter(id =="1-1") %>%
  ggplot(aes(x = time, y=temperature)) + 
  geom_line()
nasa %>% filter(id %in% c("1-1", "1-15")) %>%
  ggplot(aes(x = time, y=temperature)) + 
  geom_line(aes(group=id))
