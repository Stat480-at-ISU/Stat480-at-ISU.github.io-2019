# # only if you cannot find the happy data in the classdata package
# devtools::install_github("heike/classdata") 
data("happy", package="classdata")

library(tidyverse)

byage <- happy %>% group_by(age, sex) %>%
  summarise(
    m.happy = mean(as.numeric(happy), na.rm=TRUE)
  )
byage %>% ggplot(aes(x = age, y = m.happy, colour=sex)) + 
  geom_point()

byparty <- happy %>% group_by(partyid) %>%
  summarise(
    m.happy = mean(as.numeric(happy), na.rm=TRUE)
  )
byparty %>% ggplot(aes(x = partyid, y=m.happy)) +
  geom_point()

bymoney <- happy %>% group_by(finrela, sex) %>%
  summarise(
    m.happy = mean(as.numeric(happy), na.rm=TRUE)
  )
bymoney %>% ggplot(aes(x = finrela, y=m.happy, colour=sex)) +
  geom_point() + coord_flip()
