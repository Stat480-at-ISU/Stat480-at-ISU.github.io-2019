# Projects

# Midterm

# swirl

## Your turn

library(classdata)
head(box)
library(tidyverse)

top3 <- box %>% arrange(desc(Total.Gross)) %>%
  head(3)

top3 <- box %>% filter(Week < 52) %>%
  group_by(Movie, Distributor) %>%
  summarize(
    maxGross = max(Total.Gross, na.rm=T),
    lastWeek = max(Week, na.rm=TRUE)
  )

top3 <- top3 %>% arrange(desc(maxGross))

box %>% filter(Week < 52) %>%
  ggplot(aes(x = Week, y= Total.Gross)) +
  geom_line(aes(group=interaction(Movie, Distributor)),
            colour="orange") +
  geom_text(aes(x=lastWeek, y=maxGross, label=Movie),
            data=head(top3,3), hjust=0,
            colour="#00ff00")


###
states <- map_data("state")

states %>% ggplot(aes(x=long, y=lat)) +
  geom_point()
states %>% ggplot(aes(x=long, y=lat)) +
  geom_line(aes(group=group))

states %>% ggplot(aes(x=long, y=lat)) +
  geom_path()

states %>% ggplot(aes(x=long, y=lat)) +
  geom_path(aes(group=group))

states %>% ggplot(aes(x=long, y=lat)) +
  geom_polygon(aes(group=group))

states %>% ggplot(aes(x=long, y=lat)) +
  geom_polygon(aes(group=group, fill=lat))
