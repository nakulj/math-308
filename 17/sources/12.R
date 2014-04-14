data<-read.csv("Girls2004.csv")
no<-subset(data,Smoker=="No")$Weight
yes<-subset(data,Smoker=="Yes")$Weight

pdf("../img/12.pdf")
plot(density(no),col="blue",main="")
lines(density(yes),col="red")
dev.off()

B=100000
n=length(no)
m=length(yes)

no.boot= matrix(
			sample(no,B*n,replace=TRUE),
			nrow=B
		)
yes.boot= matrix(
			sample(yes,B*m, replace=TRUE),
			nrow=B
		)

diffMeans= mean(no)-mean(yes)
boot.diffMeans= apply(no.boot,1,mean)-apply(yes.boot,1,mean)

no.boot.sd=apply(no.boot,1,sd)
yes.boot.sd=apply(yes.boot,1,sd)

tvalues=(boot.diffMeans-diffMeans)/sqrt((no.boot.sd^2/n+yes.boot.sd^2/m))


q=quantile(tvalues,c(0.025,0.975),names=FALSE)
q1=q[1]
q2=q[2]

S=sqrt(sd(no)^2/n+sd(yes)^2/m)
lower=diffMeans+q1*S
upper=diffMeans+q2*S

print(c(lower,upper))