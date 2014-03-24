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

tests=10000
bootstrap<-matrix(sample(
	chlorine, tests*length(chlorine),
	replace=TRUE
),nrow=tests)
bootstrap.means<-apply(bootstrap,1,mean,trim=0.25)
histPDF(bootstrap.means,"11","bootstrap distribution")

bootstrap.mean=mean(bootstrap.means)
sample.mean=mean(chlorine,trim=0.25)
bootstrap.se= sd(bootstrap.means)
bootstrap.bias=bootstrap.mean-sample.mean

print(bootstrap.mean)
print(
	quantile(bootstrap.means,c(0.025,0.975))
)
print(bootstrap.bias)
print(100*bootstrap.bias/bootstrap.se)