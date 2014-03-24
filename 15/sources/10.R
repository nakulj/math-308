histPDF<-function(data,file,title) {
	pdf(paste(
		c("../img/",file,".pdf"),
		collapse=""
	))
	hist(data,main=title)
	dev.off()
}

data<-read.csv("Bangladesh.csv")
chlorine<-as.numeric(na.omit(data$Chlorine))
histPDF(chlorine,"10a","sample distribution")
print(summary(chlorine))

tests=10000
bootstrap<-matrix(sample(
	chlorine, tests*length(chlorine),
	replace=TRUE
),nrow=tests)
bootstrap.means<-apply(bootstrap,1,mean)
histPDF(bootstrap.means,"10b","bootstrap distribution")

bootstrap.mean=mean(bootstrap.means)
sample.mean=mean(chlorine)
bootstrap.se= sd(bootstrap.means)
bootstrap.bias=bootstrap.mean-sample.mean

print(bootstrap.mean)
print(
	quantile(bootstrap.means,c(0.025,0.975))
)
print(bootstrap.bias)
print(100*bootstrap.bias/bootstrap.se)