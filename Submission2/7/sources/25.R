#get the data
data<-read.csv("lottery.csv")
numbers<-c(data$Number_1,data$Number_2,data$Number_3,data$Number_4,data$Number_5)
table<-table(numbers)

#get observed and expected counts
observed<-as.vector(table)
expected<-rep(mean(observed),39)

#calculate test statistic
c=sum((observed-expected)^2/expected)

#get p value
p= 1-pchisq(c,df=38)
print(p)
