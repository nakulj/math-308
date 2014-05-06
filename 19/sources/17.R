#17

data<-read.csv("NCBirths2004.csv")
y<-data$Weight
x<-data$Gestation

#a
r=cor(x,y)
print(r)

lm=lm(y~x)

pdf("../img/17a.pdf")
plot(x,y,xlab="Gestation",ylab="Weight")
abline(lm)
dev.off()

#b
print(lm)

#c
print(r^2)

#d
res=resid(lm)
pdf("../img/17d.pdf")
plot(x,res,xlab="Gestation",ylab="Residuals")
lines(smooth.spline(x,res))
dev.off()

#18

#a
n=length(res)
S=sd(res)*sqrt((n-1)/(n-2))

#b
ssx=sum((x-mean(x))^2)
t=qt(0.975,df=n-2)
print(
	t*S/sqrt(ssx)
)