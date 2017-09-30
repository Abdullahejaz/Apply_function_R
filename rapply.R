#for rapply
x<- list(1,2,3,4)
rapply(x, function(x){x^2}, class=c("numeric"))
#doing sublisting
x <- list(1,2,list(3,4,5),6,list(7,list(8,9)))
rapply(x, function(x){x^2}, class=c("numeric"))
#rapply function to print squares
rapply(x, function(x){x^2}, class=c("numeric"))
#introducing new parameter "how"
rapply(x, function(x){x^2}, class=c("numeric"),how = "list")
#if there is another data type in the list, it will show NULL
x <- list(1,3,"e")
rapply(x, function(x){x^2}, class=c("numeric"),how = "list")
#it was showing null. For that introduce new parameter "deflt"
rapply(x, function(x){x^2}, class=c("numeric"),how = "list", deflt = "e")

#Function can take more arguments too
rapply(x, function(r,x){x^r}, class=c("numeric"),how = "list", deflt = "e", r=4)

#Equivalent for loop 
qq <- function(list){
list1 <- list(2,3)
list2 <- list(4,6)
list3 <- list(8,7)
list4 <- list(9,10)
list <- list(list1,list2,list3,list4)
for(i in list){
for(x in i){
www <- x^2
print(www)
}
}
}
qq(list)

#comparing the for loop with rapply through the function benchmark
microbenchmark::microbenchmark(qq(list),rapply(x, function(x){x^2}, class=c("numeric")),5)

kk<- microbenchmark::microbenchmark(qq(list),rapply(x, function(x){x^2}, class=c("numeric")),5)

#plot graph
plot(kk)
autoplot(kk)
