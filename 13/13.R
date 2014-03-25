# 'n' is the size of the sample to generate
# 'tests' is the number of bootstrap resamples

rescale<-function(est,n) {
	return(
		(n-1)*est/n
	)
}

test<-function(n=10, tests= 20000) {

	sample<-rnorm(n)

	est1= var(sample)
	est2= rescale(est1,n)

	resamples<-matrix(
		sample(sample, tests*n, replace= TRUE),
		nrow= tests
	)

	bsEst1= mean(apply(resamples,1,var))
	bsEst2= rescale(bsEst1,n)
	
	bias1= bsEst1-est2n
	bias2= bsEst2-est2

	print(bias1)
	print(bias2)

}

test()