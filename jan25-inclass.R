library(ggplot2)
library(classdata)

ggplot(data=fbiwide, aes(x = Year, y = Murder)) +
  geom_point() +
  facet_wrap(~State, ncol = 10)

ggplot(data=fbiwide, aes(x = Year, y = Motor.vehicle.theft)) +
  geom_point() +
  facet_wrap(~State)

ggplot(data=fbiwide, 
       aes(x = Year, y = log10(Motor.vehicle.theft))) +
  geom_point() +
  facet_wrap(~State)

ggplot(data=fbiwide, 
       aes(x = Year, y = log10(Motor.vehicle.theft))) +
  geom_point() +
  facet_wrap(~State, scales="free")

ggplot(data = fbi, aes(x = Type, y = log10(Count))) +
  geom_boxplot()  + coord_flip()

ggplot(data = fbi, aes(x = Type, y = Count)) +
  geom_boxplot()  + coord_flip()

names(fbiwide)
ggplot(data=fbiwide, aes(y=Robbery, x = Abb)) +
  geom_boxplot() +
  coord_flip()

ggplot(data=fbiwide, aes(y=Robbery/Population*70000, 
                         x = Abb)) +
  geom_boxplot() +
  coord_flip()

ggplot(data=fbiwide, aes(x = Motor.vehicle.theft)) +
  geom_histogram(binwidth=10000)

ggplot(data=fbiwide, aes(x = Motor.vehicle.theft)) +
  geom_histogram(binwidth=100000)

ggplot(data=fbiwide, aes(x = Motor.vehicle.theft)) +
  geom_histogram(binwidth=1000)

ggplot(data=fbi, aes(x = Type, weight=Count)) +
  geom_bar() + coord_flip()

ggplot(data=fbi, aes(x = Violent.crime, weight=Count)) + 
  geom_bar()

ggplot(data=fbi, aes(x = Violent.crime, weight=Count,
                     fill=Type)) + 
  geom_bar()


a <- c(1,15, 3,20, 5,8,9,10, 1,3)
a < 20
(a^2 >= 100) | (a^2 < 10)
a == 1 | a ==3
a %in% c(1,3)

a == c(1,3, 1,3, 1,3, 1,3, 1,3)


