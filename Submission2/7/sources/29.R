data<-c(6,8,10,12)

obs<-matrix(data, nrow=2, byrow=TRUE)

rowT<- apply(obs, 1, sum)
colT<- apply(obs, 2, sum)
n<-sum(obs)

exp<-(rowT %o% colT)/n

c1= sum((obs-exp)^2/exp)
c2= n*((obs[1,1]*obs[2,2]-obs[1,2]*obs[2,1])^2)/prod(c(rowT,colT))

print(c1)
print(c2)