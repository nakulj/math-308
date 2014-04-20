data<-read.csv("Spruce.csv")
c<-subset(data,Competition=="C")$Di.change
nc<-subset(data,Competition=="NC")$Di.change


diff=abs(mean(c)-mean(nc))
print(diff)

all= data$Di.change

m=length(c)
n=length(nc)

passed=0
tests= 100000
for(i in 1:tests) {
	resample= sample(all)
	resample.c= resample[1:m]
	resample.nc= resample[(m+1):(m+n)]
	resample.diff= abs(mean(resample.c)-mean(resample.nc))
	if(resample.diff >= diff) {
		passed= passed+1
	}
}
print(passed/tests)