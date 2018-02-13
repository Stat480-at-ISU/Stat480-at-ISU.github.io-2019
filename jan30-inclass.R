library(ggplot2)
library(classdata)
library(dplyr)

iowa <- filter(fbi, State=="Iowa")
iowaMurder <- filter(iowa, Type=="Murder.and.nonnegligent.Manslaughter")

ggplot(data=iowaMurder, aes(x = Year, y = Count)) +
  geom_line()


crimes09 <- filter(fbi, Year==2009)
cr09Murder <- filter(crimes09, Type=="Murder.and.nonnegligent.Manslaughter")

ggplot(data=cr09Murder, 
       aes(x = State, y = Count/Population*70000)) +
  geom_point() + coord_flip() 


crimesMurder <- filter(fbi, Year>=2010, 
                       Type=="Murder.and.nonnegligent.Manslaughter")
crimesMurder$Rate <- crimesMurder$Count/crimesMurder$Population*70000
quantile(crimesMurder$Rate, probs=0.9)
topcrimes <- filter(crimesMurder, 
    Rate >= quantile(crimesMurder$Rate, probs=0.9))
topcrimes