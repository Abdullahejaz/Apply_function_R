#mapply function to print repeated numbers
mm<- mapply(rep, 1:4, 4:1)
print(mm)


#for Loop to print repeated numbers
nn<- function(x){
list = list()
for(i in 1:x){
length<- x-i+1
ww<-rep(i,length)
list[[i]]<-ww
}
print(list)
}
nn(4)

#install differert packages to compare the performance.
install.packages("microbenchmark")

#install package ggplot2 to plot graph
install.packages("ggplot2")

library("microbenchmark")
library("ggplot2")

# using microbenchmark function to compare
microbenchmark::microbenchmark(nn(5),mapply(rep, 1:5, 5:1),10)

#Saving microbenchmark to pp variable
pp<-microbenchmark::microbenchmark(nn(5),mapply(rep, 1:5, 5:1),10)

#replicating the "pp" 100 times using the replicate function
replicate(100, pp)

#plot the graph
plot(pp)

pp<-microbenchmark::microbenchmark(nn(5),mapply(rep, 1:5, 5:1),100)
#Rplot02
plot(pp)

pp<-microbenchmark::microbenchmark(nn(5),mapply(rep, 1:5, 5:1),1000)
#Rplot03(1000)
plot(pp)
