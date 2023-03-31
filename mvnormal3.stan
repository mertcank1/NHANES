data{
  vector[2] m;
  cov_matrix[2] Sigma;
  int<lower=0> N;  
  int<lower=0> y;
  real prev_a;
  real prev_b;
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
  prev ~ beta(prev_a, prev_b);// prior 
  y ~ binomial(N, theta);
  beta ~ multi_normal(m, Sigma);
  }

generated quantities{
  int number_of_expected_cases;
  vector[2] sensspec_prior;
  
  sensspec_prior = multi_normal_rng(m, Sigma);
  number_of_expected_cases = binomial_rng(N, theta);
}
