data<-read.csv("corrExerciseB.csv")

X<-data$X
Y<-data$Y
Z<-data$Z

print(cor(X,Y))

X.mean=tapply(X,Z,mean)
Y.mean=tapply(Y,Z,mean)

print(X.mean)
print(Y.mean)

pdf("../img/7.pdf")
plot(X,Y,pch=as.character(Z))
lines(X.mean,Y.mean,type="p",col="red",pch=levels(Z))
abline(lm(Y.mean~X.mean),col="red")
dev.off()

print(cor(X.mean,Y.mean))