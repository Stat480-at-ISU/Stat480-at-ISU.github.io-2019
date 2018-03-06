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

library(tidyr)
ranks <- starwars %>% gather(episode, ranking, 10:15)
ranks <- ranks %>% mutate(
  ranking = as.numeric(ranking),
  episode = gsub(".*(Episode [VI]+).*", "\\1", episode)
) %>% select(`RespondentID NA`, episode, ranking) %>%
  arrange(`RespondentID NA`)


part <- ranks %>% filter(`RespondentID NA`== 3288372923)
rankSum = sum(part$ranking)

ranksSumm <- ranks %>% group_by(`RespondentID NA`) %>%
  summarize(rankSum = sum(ranking, na.rm=TRUE))
ranksSumm %>% ggplot(aes( x= factor(rankSum))) + geom_bar()

off15 <- ranksSumm %>% filter(rankSum==15)
ranks %>% filter(`RespondentID NA` %in% off15$`RespondentID NA`)


ranksSumm2 <- ranks %>% group_by(`RespondentID NA`) %>%
  mutate(rankSum = sum(ranking, na.rm=TRUE))


#######

# Use gather from the tidyr package to combine the variables for the different types of crimes into one variable. Call the key-value pair “Type” and “Incidences”. Compute a crime rate

# devtools::install_github("heike/classdata")
library(classdata)
data("fbiwide")
fbi <- fbiwide %>% gather(key=Type, value="Incidences", 
                          Violent.crime:Motor.vehicle.theft)
fbi <- fbi %>% mutate( Rate = Incidences/Population*70000)

twostates <- fbi %>% filter(State %in% c("Iowa", "Minnesota"))
sidebyside <- twostates %>% spread(State, Rate)

mini <- filter(twostates, Year==2014, Type=="Burglary")
mini %>% spread(State, Rate)
mini %>% select(-Abb,-Population, -Incidences) %>% spread(State, Rate)

sidebyside <- twostates %>%
  select(Year, Type, State, Rate) %>%
  spread(State, Rate)
dim(sidebyside)
sidebyside %>% ggplot(aes(x = Iowa, y=Minnesota)) +
  geom_point(aes(colour=Type)) +
  geom_abline() 

########
# campaign data

url <- "https://data.iowa.gov/api/views/3adi-mht4/rows.csv"
campaign <- readr::read_csv(url)

# split date:
campaign <- campaign %>% separate(Date, into=c("Month", "Day", "Year"), remove=FALSE)
campaign %>% count(Year)

