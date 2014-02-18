data<-read.csv("GSS2002.csv")
data<-subset(data,!is.na(data$Happy) & !is.na(data$Gender), select=c(Happy,Gender))

table<-table(data$Happy,data$Gender)
print(table)

c= chisq.test(table)$statistic[[1]]
tests= 10000
passed=0
for(i in 1:tests) {
	sample.gender<-sample(data$Gender)
	sample.table=table(data$Happy, sample.gender)
	sample.c= chisq.test(sample.table)$statistic[[1]]
	if(sample.c>=c)
		passed= passed+1
}

print(passed/tests)