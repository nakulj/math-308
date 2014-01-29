x <- rnorm(100) # draw random sample of size 15 from N(0,1)
par(mfrow = c(2,1)) # set up plot area to place 2 graphs on one sheet
qqnorm(x)
qqline(x)
hist(x)

#Chihara, Laura M.; Hesterberg, Tim C. (2012-09-04). Mathematical Statistics with Resampling and R (Kindle Locations 963-964). Wiley. Kindle Edition. 