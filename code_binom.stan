// Bernoulli model
data {
  int<lower=0> N;              // number of observations
  int<lower=0,upper=N> y;   // vector of binary observations
}
parameters {
  real<lower=0,upper=1> prev;
  real<lower=0,upper=1> spe;
  real<lower=0,upper=1> sen; // probability of success
}
transformed parameters { 
  real<lower=0,upper=1 > theta;
  theta = prev * sen + (1-prev) * (1-spe); 
  }
model {
  // model block creates the log density to be sampled
  prev ~ beta(1, 1);          // prior 
  spe ~ beta(71.25, 3.75); 
  sen ~ beta(4.44, 13.31);
  y ~ binomial(N, theta);        // observation model / likelihood
 }
 