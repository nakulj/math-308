data<-read.csv("pearson.csv")
y<-data$son
x<-data$father

r=cor(x,y)
print(r)

lm=lm(y~x)

pdf("1.pdf")
plot(x,y,ylab="Height of Son",xlab="Height of Father")
abline(lm)
dev.off()

print(summary(lm))