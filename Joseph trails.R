library(rstan)
SEED <- 48927
data_p <- list(N = 162, y = 40)
fit_a <- stan(file = "code_binom.stan", data = data_p, seed = SEED)
data_n <- list(N = 162, y = 122)
fit_b <- stan(file = "code_binom.stan", data = data_n, seed = SEED)
data_se <- list(N = 40, y = 38)
fit_se <- stan(file = "code_binom.stan", data = data_se, seed = SEED)

data_p <- list(N = 162, y = 40)

fit_s <- stan(file = "code_binom.stan", data = data_p, seed = SEED)

