nums=c(
	1.28,4.53,5.50,7.91,8.23,9.67,9.82,10.28,10.45,11.91,
	12.57,13.75,13.80,14.00,14.05,16.02,16.18,16.25,16.58,16.68,
	16.87,17.61,17.63,17.71,18.13,18.42,18.43,18.44,19.62,20.401,
	20.73,20.74,21.29,21.51,21.66,21.87,22.67,23.11,24.40,24.55,
	24.66,25.30,25.46,25.91,26.12,26.61,26.72,29.28,31.93,36.94
)

#a

probabilities<-seq(0.2, 0.8, 0.2)
quantiles<-qnorm(probabilities,mean=22,sd=7)
print(quantiles)


#b

breaks<- c(min(nums),quantiles,max(nums))
observed<-hist(nums, breaks, plot=FALSE)$counts
print(breaks)
print(observed)


#c

expected<-rep(0.2,1/0.2)*length(nums)
c=sum((observed-expected)^2/expected)
df=(1/0.2)-1
p= 1-pchisq(c,df)
print(p)
