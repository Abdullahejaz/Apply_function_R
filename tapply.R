#for tapply
cricket<- data.frame(team= gl(5,5,labels= paste("Team", LETTERS[1:5])),player = sample(letters, 25), batting_avg = runif(25.45, 50, 100))


#tapply for calculating mean of every team
tt<- tapply(cricket$batting_avg, cricket$team, mean)


#Equivalent for loop
y <- function(x){
  for(i in unique(cricket$team)){
    temp <- mean(cricket[which(cricket$team == i),"batting_avg"])
    print(c(temp,i))
  }
}

#microbechmark to compare
microo <- microbenchmark::microbenchmark(y(x),tapply(cricket$batting_avg, cricket$team, mean),10)

#plotting the graph
plot(microo)

#for autoplot
autoplot(microo)