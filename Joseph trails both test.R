library(rstan)
SEED <- 48927
A = matrix( c(40,125),  nrow=2, ncol=1,byrow = TRUE)
data <- list(N = 162, y=c(A))

fit_s <- stan(file = "Code_binom for both test.stan", data = data, seed = SEED)

