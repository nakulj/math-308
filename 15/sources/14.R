boxPDF<-function(data,file,title) {
	pdf(paste(
		c("../img/",file,".pdf"),
		collapse=""
	))
	boxplot(data,main=title)
	dev.off()
}

bootstrap<-function(data1,data2) {
	m=length(data1)
	n=length(data2)
	tests= 10000
	bs1<-matrix(sample(data1,m*tests,replace=TRUE),nrow=tests)
	bs2<-matrix(sample(data2,n*tests,replace=TRUE),nrow=tests)
	diffMeans<-apply(bs2,1,mean)-apply(bs1,1,mean)
	boxPDF(diffMeans,"14b","Difference of Means")
	print(summary(diffMeans))
	print(
		quantile(diffMeans,c(0.025,0.975))
	)
	bias= mean(diffMeans)-(mean(data2)-mean(data1))
	se= sd(diffMeans)
	print(bias)
	print(100*bias/se)
}

permutetest<-function(data1,data2) {
	m= length(data1)
	n= length(data2)
	data= c(data1,data2)
	N=m+n
	tests= 10000
	pass= 0
	diffMeans= mean(data2)-mean(data1)
	for(i in 1:tests) {
		indices<-sample(1:N,m)
		sample1<-data[indices]
		sample2<-data[-indices]
		resampleDiffMeans= mean(sample2)-mean(sample1)
		if(resampleDiffMeans>=diffMeans) {
			pass= pass+1
		}
	}
	print(pass/tests)
}

data<-read.csv("Girls2004.csv")
wy<-subset(data,data$State=="WY")$Weight
ak<-subset(data,data$State=="AK")$Weight

pdf("../img/14a.pdf")
boxplot(wy,ak,names=c("Wyoming","Arkansas"))
dev.off()

print(tapply(data$Weight,data$State,summary))

bootstrap(wy,ak)

permutetest(wy,ak)