
flights<-read.csv("../Data/FlightDelays.csv")

#a
times<-flights$DepartTime
times<-factor(times, levels= c("4-8am","8-Noon","Noon-4pm","4-8pm","8-Mid"),ordered= TRUE)
table<-table(times)
print(table)
barplot(table)

#b
flights$Day<-factor(flights$Day, levels=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))
table<-table(flights$Day,flights$Delayed30)
print(table)
yes<-table[,"Yes"]
no<-table[,"No"]
print(yes/(yes+no))

#c
no<-subset(flights, Delayed30=="No", select(FlightLength))
yes<-