library(dplyr)
library(ggplot2)
library(classdata)
head(box)


onemovie <- box %>% filter(Movie=="The Greatest Showman")

onemovie <- onemovie %>% arrange(Week)
onemovie$myranklastweek <- c(NA, onemovie$Rank[-nrow(onemovie)])

onemovie$grosslastweek <- c(NA, onemovie$Gross[-nrow(onemovie)])
onemovie$mychange <- (onemovie$Gross - onemovie$grosslastweek)/onemovie$grosslastweek*100

identical(as.numeric(onemovie$Change), round(onemovie$mychange))


mybox <- box %>% 
  group_by(Movie, Distributor) %>% 
  arrange(Week) %>%
  mutate(
    myranklastweek = c(NA, Rank[-length(Rank)]),
    grosslastweek = c(NA, Gross[-n()]),
    mychange = (Gross - grosslastweek)/grosslastweek*100
  )


######################
library(Lahman)
LahmanData

