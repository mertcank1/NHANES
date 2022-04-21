// Bernoulli model
data {
  int<lower=0> N;              // number of observations
  int<lower=0,upper=N> x; 
  int<lower=0,upper=N> y; // vector of binary observations
}
parameters {
  real<lower=0,upper=1> prev;
  real<lower=0,upper=1> spe;
  real<lower=0,upper=1> sen;
  real<lower=0,upper=1> spe2;
  real<lower=0,upper=1> sen2; // probability of success
}
transformed parameters { 
  real<lower=0,upper=1 > theta;
  real<lower=0,upper=1 > thetax;
  theta = prev * sen + (1-prev) * (1-spe);
  thetax = prev * sen2 + (1-prev) * (1-spe2);
  }
model {
  // model block creates the log density to be sampled
  prev ~ beta(1, 1);          // prior 
  spe ~ beta(71.25, 3.75); 
  sen ~ beta(4.41,13.31);
  spe2 ~ beta(4.1, 1.76); 
  sen2 ~ beta(21.96, 5.49);
  y ~ binomial(N, theta);
  x ~ binomial(N, thetax); // observation model / likelihood
 }
 
