data{
  vector[2] m;
  cov_matrix[2] Sigma;
  int<lower=0> N;  
  int<lower=0> y;
}
parameters {
vector[2] beta;
real<lower=0,upper=1> prev;
}
transformed parameters{
  real<lower=0,upper=1 > theta;
  vector[2] sensspec; 
sensspec = inv_logit(beta);
theta= prev * sensspec[2] + (1-prev) * (1-sensspec[1]);
}
model {
  prev ~ beta(1, 1);// prior 
  y ~ binomial(N, theta);
  beta ~ multi_normal(m, Sigma);
  }