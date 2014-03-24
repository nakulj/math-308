boxPDF<-function(data,file,title) {
	pdf(paste(
		c("../img/",file,".pdf"),
		collapse=""
	))
	boxplot(data,main=title)
	dev.off()
}

bootstrapMean<-function(data) {
	n=length(data)
	tests=10000
	bootstrap<-matrix(
		sample(data,tests*n,replace=TRUE),
		nrow=tests
	)
	bootstrap.means= apply(bootstrap,1,mean)
	bootstrap.mean= mean(bootstrap.means)
	bootstrap.se= sd(bootstrap.means)
	print(bootstrap.mean)
	print(bootstrap.se)
	print(
		quantile(bootstrap.means,c(0.025,0.975))
	)

}

data<-(read.csv("FishMercury.csv"))$Mercury
boxPDF(data,"12a","Mercury Levels")
bootstrapMean(data)
bootstrapMean(data[-length(data)])

