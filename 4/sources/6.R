spruces<-read.csv("../Data/Spruce.csv")

#a
changes<-spruces$Ht.Change
summary(changes)
hist(changes)
avg<-mean(changes)
sd<-sd(changes)
hist(changes)
plot(density(changes))