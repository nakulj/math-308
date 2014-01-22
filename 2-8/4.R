
flights<-read.csv("../Data/FlightDelays.csv")

#a
times<-flights$DepartTime
times<-factor(times, levels= c("4-8am","8-Noon","Noon-4pm","4-8pm","8-Mid"),ordered= TRUE)
table<-table(times)
print(table)
barplot(table)

#b
