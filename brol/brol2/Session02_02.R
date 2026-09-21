#Let's list our students and make a vector
Students_names <- c("Ray","Farzane","Bruno","oindrila","Vaishnavi","Sam","Theresa")
Students_ages <- c(26,27,21,25,16,25,35)
Students_ages_integ <- c(26L,27L,21L,25L,16L,25L,35L)
Students_countries<-c("China","Iran","Spain","India","India","Luxembourg","Germany")
``
mode(Students_countries)
mode(Students_ages)
mode(Students_names)

class(Students_names)

mylogical<-c(TRUE,FALSE, FALSE, FALSE)
mode(mylogical)

c(23L,34L)
typeof(c(23L,34L))

Students_ages_integ <- c(26L,27L,21L,25L,16L,25L,35L)
mode(Students_ages_integ)

as.integer(Students_ages)

#Quizz type
class(as.numeric(c("15","14","33")))
class(c("15","14","33"))
class(c("15",14,"33"))
c("15",14,"33")
class(c("15",14,"33"))
class(c(15,14,"33"))

#Quizz What happened?c(1,2)+c(4,5,6)
c(1,2)+c(4,5,6,8,9)
c(0,1)*c(4,5,6,8,9,13,99,22)
c(0,1)*c(4,5,6,8,9,13,99,22,15)
#recylcling!
length(c(0,1))
length(c(4,5,6,8,9,13,99,22,15))
length(Students_ages)

#Forcing length
length(Students_ages)<-10


#Other attributes (typically Projection, sources,...)
attributes(Students_ages,"SOURCE")
attr(Students_ages,"SOURCE")
attr(Students_ages,"SOURCE")<-"some text"

#FACTORS
as.factor(Students_countries)
Students_countries_mult<-rep(Students_countries, 200)
Students_countries_mult_F<-as.factor(Students_countries_mult)
Students_countries_mult_F






