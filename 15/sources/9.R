histPDF<-function(even.boot,odd.boot,n) {
	ne= n
	no= n+1

	xlimits=c(-2,2)

	pdf(paste(c("../img/9even",n,".pdf"),collapse=""))
	hist(even.boot, xlim=xlimits)
	dev.off()

	pdf(paste(c("../img/9odd",n,".pdf"),collapse=""))
	hist(odd.boot, xlim=xlimits)
	dev.off()
}
test<-function(evenN) {
	ne <- evenN # n even
	no <- evenN+1 # n odd

	wwe <- rnorm(ne) # draw random sample of size ne
	wwo <- rnorm(no) # draw random sample of size no
	 
	N <- 10000
	even.boot <- numeric(N) # save space
	odd.boot <- numeric(N)


	for (i in 1:N) {
	   x.even <- sample (wwe, ne, replace = TRUE)
	   x.odd <- sample (wwo, no, replace = TRUE)
	   even.boot[i] <- median(x.even)
	   odd.boot[i]  <- median(x.odd)
	}

	xlimits=c(-2,2)

	histPDF(even.boot, odd.boot, evenN)

}


for(i in c(14,36,200,10000)) {
	test(i)
}