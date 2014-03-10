N <- 400  # population size
n <- 5  # sample size
finpop <- rexp(N, 1/10) # Create a finite pop. of size N=400 from
          # Exp(1/10)
hist(finpop)   # distribution of your finite pop.
mean(finpop)   # mean (mu) of your pop.
sd(finpop)   # stdev (sigma) of your pop.
sd(finpop)/sqrt(n)   # theoretical standard error of sampling # dist. of mean(x), with replacement
sd(finpop)/sqrt(n) *  sqrt((N-n)/(N-1)) # without replacement
my.means <- numeric(1000)
for (i in 1:1000)
{
   x <- sample(finpop, n) # Random sample of size n (w/o replacement)
   my.means[i] <- mean(x) # Find mean of sample, store in my.means
}
hist(my.means)
dev.new()   # new graphics device
qqnorm(my.means)
qqline(my.means)
mean(my.means)
sd(my.means)   # estimated standard error of sampling
               # distribution
