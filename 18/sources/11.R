p1=0.38
p2=0.31
obs=round(c(p1*505,(1-p1)*505,p2*773,(1-p2)*773))
obs= matrix(obs,nrow=2,byrow=TRUE)
print(chisq.test(obs))