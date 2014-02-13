data<-read.csv("GSS2002.csv")
data<-subset(data,!is.na(data$Happy) & !is.na(data$Gender))
table
