library(RColorBrewer)
mpg %>% ggplot(aes(x =displ, y = hwy, 
                   colour=drv)) +
  geom_point() +
  scale_colour_manual(values=c("orange", "darkblue", "purple")) +
  theme_bw()

display.brewer.all()
