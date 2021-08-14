## This is where the code for week4 (simulations) will be kept. 

## str function - also called structure function that tells us the structure of 
## any object. 

str(lm)

# The output of the function above is -
# function (formula, data, subset, weights, na.action, method = "qr", model = TRUE, x = FALSE, 
#           y = FALSE, qr = TRUE, singular.ok = TRUE, contrasts = NULL, offset, ...)  
#         NULL

m = matrix(1:9, nrow = 3, ncol = 3)
str(m)

# The output of the function above is - 
# int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
# It tells us that the object m is an array with 3 rows and 3 columns and 
# what are some of the initial observations in the matrix

## Simulations - We can simulate numbers and variables from the given 
## probability distributions. Following functions can be used for simulations. 

# rnorm - generates a random normal variates with given mean and SD
# dnorm - evaluates the normal probability density (with a given mean and SD)
                # at a point or vector of points
# pnorm - evaluate a cumulative function for a normal distribution
# rpois - generate random poisson variates with a given rate.

# the functions have prefixes 
# d for density 
# r for random number generaration
# p for cumulaitve distribution
# q for quantile function

x <- rnorm(100) # generates standard normal distribution with a mean 0 and SD 1

mean (x)
sd(x)

y <- rnorm (500,200,20)
mean(y)
sd(y)
summary(y)
hist(y)

## Setting seed ensures reproduceability of the random numbers
## you can set the seed with set.seed() function

set.seed(1)
rnorm(5)
set.seed(2)
rnorm(5)

set.seed(1)  # This will produce the same output as above seed 1
rnorm(5) # NOTE - always set a seed when producing a simulation.  

## Using rpos to generate random variantes from Poisson distribution. 

rpois(10,1)  # 
rpois(10,2)
set.seed(1)
summary(rpois(100,1))

set.seed(1)
table(rpois(100,1))

set.seed(2)
table(rpois(100,5))

set.seed(2)
mean(rpois(100,5))

# cumulative distribution function ppois 

ppois(2,4)  # probability of a poisson varibale <=2 when the rate is 4 
ppois(1,2)  # probability of a poisson varibale <=1 when the rate is 2 

## How to simulate from a linear model. 
## Linear model equation 
## y = b0 + b1x + e
## b0 = 0.5, b1 = 2

set.seed(10)
x <- rnorm(100)
e <- rnorm(100, 0, 2)

y <- 0.5 + 2*x + e

summary(y)
plot(x,y)

## Simulate binary data through binomial distribution - rbinom


set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)

y <- 0.5 + 2*x + e

summary(y)
plot(x,y)

## Sampling. collect a sample 

set.seed(1)
sample(c('a','b','c','d','e','f','g','h'), 3)

set.seed(10)
d<-sample(1:1000, 50, replace = T) ## with replacement 

## Experiment to prove sampling distribution is usually normal. 

means <- numeric()
for (i in 1:100) {
        means <- append(means, mean (sample(1:1000, 100, replace = T)))
}

hist(means)
mean(means)
sd(means)



