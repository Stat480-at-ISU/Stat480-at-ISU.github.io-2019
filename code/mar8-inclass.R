#devtools::install_github("heike/classdata")
library(classdata)
library(dplyr)
head(box)
?box
tail(box)
box %>% filter(Rank==1) %>% tail()

#################

url <- "https://data.iowa.gov/api/views/3adi-mht4/rows.csv"
campaign <- readr::read_csv(url)

campaign %>% glimpse()
campaign$Date[1:3]

library(tidyr)
?separate

campaign <- campaign %>% separate(Date, 
                      into=c("Month", "Day", "Year"),
                      sep="/",
                      remove=FALSE)
campaign %>% select(Date, Day, Month, Year) %>% head()

campaign <- campaign %>% separate(`City Coordinates`, 
                      into=c("line1", "line2"), 
                      sep="\n", remove=FALSE)
# need to check up on those 22 thousand problematic cases

campaign <- campaign %>% separate(line2, 
                      into=c("lat", "long"),
                      sep=",",
                      remove=FALSE)

library(readr)
campaign <- campaign %>% mutate(
  long = parse_number(long),
  lat = parse_number(lat)
)
# check into warning messages

library(ggplot2)
campaign %>% filter(lat < 200, long < 200) %>% 
  ggplot(aes(x = long, y=lat)) + geom_point()

###########
movies %>% count(Movie) %>% arrange(desc(n))
movies %>% filter(Movie=="Girlhood")
movies <- box %>% group_by(Movie, Distributor) %>%
  summarize(
    firstWeek = min(Week),
    firstDate = Date[which.min(Week)]
  )

