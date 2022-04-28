// Bernoulli model
data {
  int<lower=0> N;              // number of observations
  int<lower = 0,upper = N > ans[4]; // vector of binary observations
}
parameters {
  real<lower=0,upper=1> prev;
  real<lower=0,upper=1> spe;
  real<lower=0,upper=1> sen;
  real<lower=0,upper=1> spe2;
  real<lower=0,upper=1> sen2; // probability of success
}
transformed parameters { 
 simplex[4] theta;
theta[1] = (sen*sen2*prev)+ ((1-spe)*(1-spe2)*(1-prev)); 
theta[3] = (sen*(1-sen2)*prev) +((1-spe)*spe2*(1-prev));
theta[2] = ((1-sen)*sen2*prev)+(spe*(1-spe2)*(1-prev)); 
theta[4] = ((1-sen)*(1-sen2)*prev)+(spe*spe2*(1-prev));
}
model {
  // model block creates the log density to be sampled
  prev ~ beta(1, 1);          // prior 
  spe ~ beta(71.25, 3.75); 
  sen ~ beta(4.41,13.31);
  spe2 ~ beta(4.1, 1.76); 
  sen2 ~ beta(21.96, 5.49);
  ans ~ multinomial(theta);// observation model / likelihood
 }
 
 