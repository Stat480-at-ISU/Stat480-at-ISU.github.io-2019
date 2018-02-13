devtools::install_github("Stat480-at-ISU/yourturns480")
install.packages("devtools")

learnr::run_tutorial("logical", package="yourturns480")

##################
url <- "https://stat480-at-isu.github.io/materials/01_collaborative-environment/data/gapminder-5060.csv"
gap <- read.csv(url)
str(gap)
library(dplyr)
filter(gap, country=="Canada", year==1957)
gap$lifeExp <- replace(gap$lifeExp, 
        (gap$country=="Canada") & (gap$year==1957), 
        69.96)
gap$lifeExp

which(gap$lifeExp==999999)
which((gap$country=="Canada") & (gap$year==1957))
idx <- which(gap$lifeExp>999)

gap$lifeExp[idx] <- 69.96


library(classdata)
str(fbi)

summary(fbi$Year)
fbi$Year <- factor(fbi$Year)
summary(fbi$Year)


fbi$Year <- as.integer(fbi$Year)
summary(fbi$Year)

str(fbi$Type)
summary(as.integer(fbi$Type))

library(ggplot2)
twoyear <- filter(fbi, Year %in% c(1961, 2014))
ggplot(twoyear, aes(x = factor(Year), y=Count)) + 
  geom_boxplot()

