library(tinyplot)
set.seed(101)
D <- data.frame(
  X=1:10,
  Y=rnorm(10,10,1),
  K=rep(letters[1:5],2)
)
mytinyplot<-plt(Y~X|K,data=D)

CatchMeIfYouCan<-function(y,x){
  message("Click on the graph to catch me !")
  here<-locator(1)
  closest<-which.min(dist(rbind(D[,c(y,x)], here[c(y,x)]))[2:nrow(D)+1])
  D[closest,]
  }
CatchMeIfYouCan("Y","X")


#IT IS ACTUALLY THE identify function in R graphics
with(data=D,identify(X,Y))


