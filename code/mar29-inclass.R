data(nasa, package="GGally")

library(ggplot2)
library(dplyr)
nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y=temperature)) +
  geom_line() +
  geom_point()

nasa %>% filter(id %in% c("1-1", "1-15")) %>%
  ggplot(aes(x = time, y=temperature, group=id)) +
  geom_line() +
  geom_point()

##########################

nasa %>% filter(id %in% c("1-1", "1-15")) %>%
  ggplot(aes(x = time, y=ozone, group=id)) +
  geom_line()

nasa %>% filter(id %in% c("1-1", "1-15")) %>%
  ggplot(aes(x = month, y=ozone, 
             group=interaction(id, year))) +
  geom_line(aes(colour=factor(year))) +
  geom_point()

nasa %>% filter(x %in% 1:10, y%in% 7:10) %>%
  ggplot(aes(x = date, y=temperature, group=id)) +
  geom_line() +
  geom_point()

nasa %>% filter(y <= 15) %>%
  ggplot(aes(x = date, y=temperature, group=id)) +
  geom_line() +
  geom_point()

#####################

data(box, package="classdata")
box %>% 
  filter(Movie == "Black Panther")%>%
  ggplot(aes(x = Date, y = Total.Gross)) + 
  geom_line()


box %>% 
  ggplot(aes(x = Date, y = Total.Gross,
             group=interaction(Movie, Distributor))) + 
  geom_line()


#####################
# for each movie and distributor, 
# find the (1) highest total gross, 
#          (2) the last date (and week) the movie was shown in theaters, 
#          (3) the gross the movie made in the first week it was released.


box_summary <- box %>%
  group_by(Movie, Distributor) %>%
  summarize(
    maxGross = max(Total.Gross, na.rm=T),
    lastDate = max(Date, na.rm=T),
    lastWeek = max(Week, na.rm=T),
    minGross = min(Total.Gross, na.rm=T)
  )

box %>% 
  ggplot(aes(x = Date, y = Total.Gross,
             group=interaction(Movie, Distributor))) + 
  geom_line() +
  geom_text(aes(x = lastDate, y=maxGross, 
                label=Movie),
            size = 3,
            data=box_summary %>%
              filter(maxGross>3e8))
# install.packages("ggrepel")
# library(help=ggrepel)
box %>% 
  ggplot(aes(x = Date, y = Total.Gross,
             group=interaction(Movie, Distributor))) + 
  geom_line() +
  ggrepel::geom_text_repel(aes(x = lastDate, y=maxGross, 
                label=Movie),
            size = 3, colour="grey50",
            data=box_summary %>%
              filter(maxGross>3e8))

