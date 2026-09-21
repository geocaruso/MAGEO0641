#This scirpt opens a shapefile of NetMig data in Lux
#then classify one variable using boxplot then export that classification in
#a csv for joining back to a dbf within a GIS system

# Libraries ----
library(foreign) #for reading dbf
library(classInt) #for discretisation
# Data----
A <- read.dbf("brol/LuxMig/Mig_Popdens_Pop.dbf")
summary(A$NetM2020)
head(A) #where I see that LAU2 is a unique ID
# Discretisation ----
NetM2020_box <- classify_intervals( A$NetM2020,
                                    style = "box"
                                    )
cl_int_box<-classIntervals(A$NetM2020,
                style = "box")
findCols(cl_int_box)

# Export----
B <- data.frame( ID_LAU2=A$LAU2,
                 ID_LAU2_ch=as.character(A$LAU2),
                 Box2020=NetM2020_box
                 )
write.csv(B,"brol/LuxMig/Mig2020_box.csv")
write.dbf(B,"brol/LuxMig/Mig2020_box.dbf")




