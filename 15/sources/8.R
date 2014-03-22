n= 200
tests= 1000
samples<-matrix(
	rgamma(n*tests, shape=5, rate=1/4),
	ncol= n
)
sampleMeans<-apply(samples,1,mean)
hist(sampleMeans)
dev.new()
print(summary(sampleMeans))

sample<-rgamma(n*tests, shape=5, rate=1/4)
hist(sample)
print(mean(sample))
print(median(sample))