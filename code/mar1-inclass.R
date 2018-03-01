library(dplyr)
library(ggplot2)
library(readr)
starwars <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/star-wars-survey/StarWars.csv")

# the following lines are necessary to make the second line of the file 
# part of the names:
line1 <- names(starwars)
line2 <- unlist(starwars[1,])
varnames <- paste(line1, line2)
# clean up some of the multibyte characters:
names(starwars) <- enc2native(stringi::stri_trans_general(varnames, "latin-ascii"))

starwars <- starwars[-1,]

starwars2 <- starwars %>% filter(`Have you seen any of the 6 films in the Star Wars franchise? Response`=="Yes")
starwars2 %>% group_by(`Gender Response`) %>% summarise(
  n = n(),
  ep1 = mean(na.rm=T, as.numeric(`Please rank the Star Wars films in order of preference with 1 being your favorite film in the franchise and 6 being your least favorite film. Star Wars: Episode I  The Phantom Menace`)),
  ep2 = mean(na.rm=T, as.numeric(`X11 Star Wars: Episode II  Attack of the Clones`)),
  ep4 = mean(na.rm=T, as.numeric(`X13 Star Wars: Episode IV  A New Hope`))
  
)

#########################
data(french_fries, package="reshape2")

library(tidyr)
ffm <- french_fries %>% gather(key=scale, value=score, 5:9)
ffm <- french_fries %>% gather(key=scale, value=score, potato:grassy, painty, rancid)
ffm <- french_fries %>% gather(key=scale, value=score,-(1:4))

head(ffm)

ffm %>% spread(rep, score) %>% head()
reps <- ffm %>% spread(rep, score)

reps %>% ggplot(aes(x = `1`, y = `2`)) +
  geom_point() + facet_wrap(~scale)

weeks <- ffm %>% spread(time, score)

weeks %>% ggplot(aes(x =`1`, y=`10`)) +
  geom_point(aes(colour=subject, 
                 shape=factor(rep))) +
  facet_grid(treatment~scale) +
  geom_abline()

########################
data("fbiwide", package="classdata")
fbi <- fbiwide %>% gather(Type, Incidences,
                          -(1:4))

