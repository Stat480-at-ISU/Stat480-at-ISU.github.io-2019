library(classdata)
# devtools::install_github("heike/classdata")
data("Titanic", package="classdata")

head(Titanic)
library(ggplot2)
ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar()

ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar(aes(fill=Survived))
ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar(aes(fill=factor(Survived)))
ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar(aes(fill=factor(Survived))) +
  scale_fill_discrete("Did person\nsurvive?")

ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar(aes(fill=factor(Survived))) +
  scale_fill_manual("Did person\nsurvive?", 
                    values=c("pink", "violet"))


ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar(aes(fill=Survived),
           position = "fill") 

ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar(aes(fill=Survived),
           position = "dodge") 

ggplot(data=Titanic, aes(x = Sex)) + 
  geom_bar(aes(fill=Survived),
           position = "stack") 

  