n=30
l=1/3
t=5000
#sample the distribution and group samples by trial
sample<-matrix(rexp(n*t,l),t)
#mean from each trial
means=apply(sample,1,mean)
print(mean(means))
#standard error
print(sd(means))
#plot the distribution
plot(density(means))
#get required p
print(sum(means<3.5)/t)
#with CLT approx
clt.mean=3
clt.sd=3/sqrt(30)
print(pnorm(3.5,clt.mean,clt.sd))