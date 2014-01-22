
flights<-read.csv("Data/FlightDelays.csv")
times<-flights$DepartTime
times<-factor(times, levels= c("4-8am","8-Noon","Noon-4pm","4-8pm","8-Mid")) 

table<-table(flights$DepartTime)
print(table)
barplot(table)