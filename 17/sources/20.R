print(prop.test(459,980,conf.level=0.95,correct=FALSE)$conf)
print(prop.test(426,759,conf.level=0.95,correct=FALSE)$conf)
print(prop.test(c(459,426),c(980,759),conf.level=0.95,correct=FALSE)$conf)