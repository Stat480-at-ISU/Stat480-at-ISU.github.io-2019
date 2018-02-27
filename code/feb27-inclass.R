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

starwars2 <- starwars %>% 
  filter(`Have you seen any of the 6 films in the Star Wars franchise? Response` == "Yes")

starwars2 %>% group_by(`X26 R2 D2`) %>% 
  summarise(n = length(`RespondentID NA`))

###################

starwars2 %>% group_by(`X5 Star Wars: Episode II  Attack of the Clones`) %>% tally()


#######################
library(classdata)
data(fbi, package="classdata")
library(dplyr)

fbi <- fbi %>% group_by(Type)

fbi <- fbi %>% ungroup(Type) %>% 
  mutate(
  Rate = Count/Population*70000,
  Type = reorder(Type, Rate, FUN=median, 
                 na.rm=TRUE)
)

library(ggplot2)
fbi %>% ggplot(aes(x = Type, y=Rate)) + 
  geom_boxplot() + coord_flip()


fbi <- fbi %>% group_by(Type, Year) %>%
  mutate(
    best = rank(Rate)
  )

fbi %>% filter(best <= 3, Year >= 2000) %>%
  ggplot(aes(x = Abb, fill=factor(best))) + 
  geom_bar() +
  facet_grid(~Type, space="free") +
  coord_flip()
