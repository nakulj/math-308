
test<-function(n=100, tests= 10000) {

	sample<-rnorm(n)

	unbiasedVar= var(sample)
	biasedVar= (n-1)*unbiasedVar/n

	tests= 10000
	resamples<-matrix(
		sample(sample, tests*length(sample), replace= TRUE),
		nrow= tests
	)

	resamples.unbiasedVars<-apply(resamples,1,var)
	resamples.biasedVars<-(n-1)*resamples.unbiasedVars/n
	hist(resamples.unbiasedVars)
	dev.new()
	hist(resamples.biasedVars)
}

test()