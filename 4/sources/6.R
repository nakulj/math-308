spruces<-read.csv("Spruce.csv")

#a
Ht.change<-spruces$Ht.change
summary(Ht.change)

#b
hist(Ht.change)
qqnorm(Ht.change)
qqline(Ht.change)

#c
yes<-subset(spruces, Fertilizer=="F")$Di.change
no<-subset(spruces, Fertilizer=="NF")$Di.change
boxplot(yes,no,names=c("In fertilized plots","Not in fertilized plots"))

#d
tapply(spruces$Di.change,spruces$Fertilizer,summary)

#e
Di.change=spruces$Di.change
plot(Ht.change,Di.change)
