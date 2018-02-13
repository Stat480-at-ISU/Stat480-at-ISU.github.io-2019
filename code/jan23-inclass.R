## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- fig.width=3, fig.height=3------------------------------------------
library(classdata)
library(ggplot2)

ggplot(data=fbiwide, aes(x = Murder, y=Burglary)) +
  geom_point()
ggplot(data=fbiwide, 
       aes(x = log10(Murder), y=log10(Burglary))) +
  geom_point()
ggplot(data=fbiwide, 
       aes(x = log10(Murder), y=log10(Burglary),
           colour=State)) +
  geom_point()
ggplot(data=fbiwide, 
       aes(x = log10(Murder), y=log10(Burglary),
           colour=Year)) +
  geom_point()

ggplot(data=fbiwide, 
       aes(x = log10(Murder), y=log10(Burglary),
           size=log10(Population))) +
  geom_point()

ggplot(data=fbiwide, 
       aes(x = log10(Population), y=log10(Motor.vehicle.theft),
           size=log10(Population))) +
  geom_point()


## ------------------------------------------------------------------------
ggplot(data=fbiwide, aes(x=Year, y=Murder/Population*70000)) + geom_point() + facet_wrap(~State)

ggplot(data=fbiwide, aes(x=Year, y=Motor.vehicle.theft/Population*70000)) + geom_point() + facet_wrap(~State)

ggplot(data=fbiwide, aes(x=Year, y=Larceny.theft/Population*70000)) + geom_point() + facet_wrap(~State)


