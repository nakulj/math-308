spruces<-read.csv("Spruce.csv")

#a
Ht.change<-spruces$Ht.change
summary(Ht.change)

#b
hist(Ht.change)
qqnorm(Ht.change)
qqline(Ht.change)

#c


