data<-read.csv("Maunaloa.csv")
x<-data$Year
y<-data$Level

r=cor(x,y)
print(r)
lm=lm(y~x)

pdf("../img/21a.pdf")
plot(x,y,xlab="Year",ylab="CO2 Level")
abline(lm)
dev.off()

print(lm)

res=resid(lm)
pdf("../img/21c.pdf")
plot(x,res,xlab="Year",ylab="Residuals")
abline(0,0)
dev.off()
