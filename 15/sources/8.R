

pdfHist<-function(data, title, file, size) {
	pdf(paste(
		c("../img/8",file,size,".pdf"),
		collapse=""
	))
	hist(data, main= paste(
		c(title,", n= ",size),
		collapse=""
	))
	dev.off()
}

test<-function(n) {
	tests= 1000
	samples<-matrix(
		rgamma(n*tests, shape=5, rate=1/4),
		ncol= n
	)
	sampleMeans<-apply(samples,1,mean)

	pdfHist(sampleMeans,"Sample Means","sampleMeans",n)


	print(summary(sampleMeans))

	sample<-rgamma(n*tests, shape=5, rate=1/4)

	pdfHist(sample,"Sample","sample",n)
	print(mean(sample))
	print(sd(sample))

	bootstrap<-matrix(
		sample(sample, tests*n, replace= FALSE),
		ncol= n
	)

	bootstrapMeans<-apply(bootstrap,1,mean)

	pdfHist(bootstrapMeans,"Bootstrap Means","bootstrap",n)

	print(mean(bootstrapMeans))
	print(sd(bootstrapMeans))
}

for(i in c(200,50,10))
	test(i)