library(Lahman)
LahmanData
data("HallOfFame")
data(Master)

library(tidyverse)

dim(HallOfFame)
HallOfFame <- HallOfFame %>% 
  left_join(Master, by="playerID")
dim(HallOfFame)


# Master <- Master %>% 
#  left_join(HallOfFame, by="playerID")

# attempts for Sammy Sosa
HallOfFame %>% filter(nameLast=="Sosa")

HallOfFame %>% filter(
  inducted=="Y",
  is.na(deathYear)
  ) %>% select(nameFirst, nameLast)


#############################

library(classdata)
data(box)
data(budget)

dim(box) # 25181 
box <- box %>% left_join(budget, by="Movie")
dim(box) # 25569
# duplicates!!

budget %>% filter(Movie=="Beauty and the Beast")

rm(box)
aj <- box %>% anti_join(budget, by="Movie")
head(aj) # movies where don't know - for whatever reason - the budget

aj2 <- budget %>% anti_join(box, by="Movie")

#########################

summary(box)
# there are missing values!

box %>% filter(is.na(Rank.Last.Week)) %>% head()
