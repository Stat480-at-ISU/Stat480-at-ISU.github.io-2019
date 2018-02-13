library(classdata)
str(fbi)
levels(fbi$Type)
fbi$Type <- factor(fbi$Type, levels=c("Burglary","Larceny.theft",
                          "Motor.vehicle.theft",
                          "Aggravated.assault",
                          "Legacy.rape", "Rape",
                          "Robbery", 
                          "Murder.and.nonnegligent.Manslaughter"))


