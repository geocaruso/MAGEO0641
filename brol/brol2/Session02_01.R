# 02_01 Diorectories ----
#
#This is to show how you change directories
getwd() #this is my working directory
#I save it in an oboject
wd <- getwd()

#I create a new directory within
dir.create("brol2")

#I use it now as my working dirceory
newdirectory <- paste0(wd, "/brol2")

setwd(newdirectory)


# 02_02 Naming convention ----

#Naming of objects is case sensistive
Sam <- 3
sam <- 2
SamFromLux <- Sam + sam
Sam_from_lux <- Sam - sam


#02_03 understanding functionarguments----
#
## A sequence of numbers and plot of the sqaure function
#All those 4 are equivalent
X <- -100:100
X <- seq(-100,100,1)
X <- seq(from=-100,to=100,by=1)
X <- seq(to=100,by=1,from=-100)
X

Y<-X^2
Y

plot(x=X,y=Y)
plot(X,Y)

#Not the same as
plot(Y,X) 
#which can manually export as pdf or png


#02_04 Errors and Warnings ----
# example warnin when taking sqrt of negative number
# 
sqrt(X) # is a warning that NAN are produced because of negative numbers

plot(X,Y,Z) #is an erro because Z does not exist


#02_05 Saving text to text file

a_sentence<-paste("Vaishnavi computed the standard deviation of Y , which is equal to ",sd(Y))
cat(a_sentence,file="brol/brol2/a_sentence.txt",append = TRUE)
