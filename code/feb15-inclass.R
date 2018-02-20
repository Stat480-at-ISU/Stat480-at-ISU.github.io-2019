data(french_fries, package="reshape2")
dim(french_fries)
head(french_fries)
library(tidyverse)
avgs <- french_fries %>%
  group_by(time) %>%
  summarise(
    m.potato = mean(potato, na.rm=TRUE),
    m.rancid = mean(rancid, na.rm=TRUE)
  )
avgs %>% str()


## Your turn: are there differences between the treatments?


avgs %>% ggplot(aes(x=time)) +
  geom_point(aes(y=m.potato)) +
  geom_point(aes(y=m.rancid), shape=2) +
  ylab("Rating")


avgs <- french_fries %>%
  group_by(time, treatment) %>%
  summarise(
    m.potato = mean(potato, na.rm=TRUE),
    m.rancid = mean(rancid, na.rm=TRUE)
  )
avgs %>% 
  ggplot(aes(x = time, y = m.potato, 
             colour=treatment)) +
  geom_point()

############### Your-turn: consistency

consistency <- french_fries %>% 
  group_by(subject, treatment, time) %>%
  summarise(
    m.buttery = mean(buttery, na.rm=TRUE),
    m.rancid = mean(rancid, na.rm=TRUE),
    diff.buttery = max(buttery)-min(buttery)
  )
