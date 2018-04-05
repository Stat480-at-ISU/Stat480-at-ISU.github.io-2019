map_data <- function (map, region = ".", 
                      exact = FALSE, ...) 
{
  fortify(maps::map(map, region, exact = exact, 
                    plot = FALSE, fill = TRUE, 
                    ...))
}

library(ggplot2)
world <- map_data("world")

library(dplyr)
world <- world %>% arrange(order)



world %>% ggplot(aes(x = long, y = lat)) + 
  geom_path(aes(group=group))

world %>% ggplot(aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group), size=.1, 
               colour="white")

counties <- map_data("county")
counties %>% ggplot(aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group), size=.1, 
               colour="white")
counties %>% ggplot(aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group, 
                   fill= subregion=="story"), 
               size=.1, 
               colour="white")

counties %>% ggplot(aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group, 
                   fill= subregion=="lincoln") 
               )
counties %>% ggplot(aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group, 
                   fill= subregion=="washington") 
  )

counties %>% mutate(
  wash_linc = replace(subregion, 
                      !(subregion %in% c("lincoln", "washington")),
                      NA)
) %>% 
  ggplot(aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group, 
                   fill= wash_linc) 
  )

counties %>% count(subregion) %>% arrange(desc(n))

counties %>% group_by(region, subregion) %>%
  summarize(
    one = 1
  ) %>% ungroup() %>%
  count(subregion) %>% arrange(desc(n))


states <- map_data("state")
library(classdata)
fbi12 <- filter(fbi, Year==2012)

fbi12$region <- tolower(fbi12$State)
fbi.map <- fbi12 %>% left_join(states, by="region")

fbi.map %>% filter(Type=="Motor.vehicle.theft") %>%
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group= group, fill = Count/Population*60000))+
  scale_fill_gradient2(midpoint=200)
