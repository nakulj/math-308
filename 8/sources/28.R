n=c(20,50,200)
t=10000

dev.new()
device=dev.cur()

for(i in n) {
	dev.set(device)
	samples=matrix(rnorm(i*t,25,7),t)
	variances=apply(samples,1,var)
	print(mean(variances))
	print(sd(variances))
	if(i == n[1]) {
		plot(density(variances),ylim=c(0,0.1))
	}
	else {
		lines(density(variances))
	}
	dev.new()
	qqnorm(variances)
	qqline(variances)
}