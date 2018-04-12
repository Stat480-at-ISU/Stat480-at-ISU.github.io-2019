library(ggplot2)
states <- map_data("state")
library(tidyverse)

states %>% ggplot(aes(x = long, y = lat)) +
  geom_path(aes(group= group))

states %>% ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group= group, 
                   fill = long))

library(classdata)
fbi14 <- fbi %>% filter(Year == 2014)

fbi14.map <- left_join(fbi, states, 
                       by=c("State" = "region"))
summary(fbi14.map) # NAs only for lat, long, ...

fbi14$region <- tolower(fbi14$State)
fbi14.map <- left_join(fbi14, states, 
                       by="region")

fbi14.map %>% 
  filter(Type=="Robbery") %>%
  ggplot(aes(x = long, y=lat)) +
  geom_polygon(aes(group=group, 
                   fill=Count/Population*60000))

fbi %>% 
  filter(Year == 2012) %>%
  mutate(
    region = tolower(State)
  ) %>%
  left_join(states, by="region") %>%
  filter(Type == "Motor.vehicle.theft") %>%
  ggplot(aes(x = long, y=lat)) +
  geom_polygon(aes(group=group, 
                   fill=Count/Population*60000))

###############
acc <- read.csv("https://raw.githubusercontent.com/DS202-at-ISU/labs/master/data/fars2016/accident.csv", stringsAsFactors = FALSE)

states %>% ggplot(aes(x = long, y=lat)) +
  geom_path(aes(group=group)) +
  geom_point(aes(x = LONGITUD, y=LATITUDE), 
             size = .1, alpha=.1,
             data=filter(acc, between(LONGITUD, -130, 700)))

p1 <- mpg %>% filter(year == 2008) %>%
  ggplot(aes(x = cty, y = hwy, colour = cyl)) +
  geom_point()
p2 <- mpg %>% filter(year == 2008) %>%
  ggplot(aes(x = cty, y = hwy, colour = factor(cyl))) +
  geom_point()

p1 + scale_color_continuous() # default scale
p2 + scale_color_discrete() # default scale for factor

p1 + scale_color_gradient2(low="#a0631c", high="pink", midpoint=6)
