# homework #6, qu.5

housing <- read.csv("https://raw.githubusercontent.com/OAITI/open-datasets/master/Housing%20Data/Ames-Housing.csv")

library(dplyr)
housing %>% group_by(Neighborhood) %>% 
  summarise(
    n = length(YearBuilt)
  ) %>% arrange(n)

# which square footage?
names(housing) # you can use any, but LivingArea might give you the strongest results

# working with mutate - don't forget to save the result back into the dataset
# the 'Rate =' just gives the new variable its name
housing <- housing %>% mutate(
  Rate = SalePrice/LivingArea
)

## reorder neighborhoods according to mean sale price
library(ggplot2)
housing %>% 
  ggplot(aes(x = Neighborhood, y = SalePrice)) + 
  geom_boxplot() + coord_flip()
str(housing$Neighborhood)

str(reorder(housing$Neighborhood, housing$SalePrice))

housing$Neighborhood <- reorder(housing$Neighborhood, housing$SalePrice)

# equivalently:
housing <- housing %>% 
  mutate(
  Neighborhood = reorder(Neighborhood, SalePrice)
)

# example:
housing %>% 
  filter(Bedrooms >= 2, YearBuilt > 1990) %>%
  mutate(
    Rate = SalePrice/LivingArea,
    Neighborhood = reorder(Neighborhood, Rate)
  ) %>% 
  ggplot(aes(x = Neighborhood, y = SalePrice)) + 
  geom_boxplot() + coord_flip()


housing %>% 
  ggplot(aes(x = Neighborhood, y = SalePrice)) + 
  geom_boxplot() + coord_flip()


# working with cut:
# introduces bins for a numeric variable
# either specify the number of bins (breaks = 4, e.g.)
# or specify the break points in a vector:
YBcut <- cut(housing$YearBuilt, breaks=c(1800, 1850, 1900, 1950, 2000, 2050))
summary(YBcut)

# create logical variable

housing$HasGarage <- housing$GarageArea > 0
table(housing$HasGarage)

# equivalently:
housing <- housing %>% mutate(
  HasGarage = GarageArea > 0
)

housing %>% 
  filter(Bedrooms >= 2, YearBuilt > 1990) %>%
  mutate(
    Rate = SalePrice/LivingArea,
    Neighborhood = reorder(Neighborhood, 
                           Rate, FUN=median)
  ) %>% 
  ggplot(aes(x = Neighborhood, y = Rate)) + 
  geom_boxplot() + coord_flip()
